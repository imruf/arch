/*
 *  statusbar.c
 *  Author: Alex Kozadaev (2015)
 */

#include "build_host.h"

#define _DEFAULT_SOURCE
#define _XOPEN_SOURCE 700

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <signal.h>
#include <ctype.h>
#include <alsa/asoundlib.h>
#include <alsa/control.h>

#ifndef DEBUG
#include <X11/Xlib.h>
#endif

#define MIN(a, b) ((a) > (b) ? (b) : (a))

#define THRESHOLD 8
#define TIMEOUT   40
#define SUSPEND   { "/bin/sh", "/usr/local/bin/suspend.sh", NULL }

#define INTBUFSZ  64
#define DTBUFSZ   20    /* strip down the year */
#define LNKBUFSZ  64
#define STRSZ     256

/* Available statuses
 *
 *  Charging
 *  Draining
 *  Unknown
 *  Full
 */
typedef enum {
    CHARGING, DRAINING, UNKNOWN, FULL
} status_t;


static void open_display();
static void close_display();
static void spawn(const char **params)  __attribute__ ((unused));
static void set_status(char *str);
static const char *percent_bar(int p);
static void get_datetime(char *dstbuf);
static void get_load_average(char *dstla);
static status_t get_status(void);
static int read_int(const char *path);
static void read_str(const char *path, char *buf, size_t sz);
static int get_vol(void);

#ifndef DEBUG
static Display *dpy;
#endif

int
main(int argc, char **argv)
{
    int   timer = 0;
    int   vol = 0;
    float bat;                  /* battery status */
    char  lnk[STRSZ] = { 0 };   /* wifi link      */
    char  la[STRSZ] = { 0 };    /* load average   */
    char  dt[STRSZ] = { 0 };    /* date/time      */
    char  stat[STRSZ] = { 0 };  /* full string    */
    status_t st;                /* battery status */
    /* should be the same order as the status_t enum */
    char  status[] = { '+', '-', '?', '=' };

    if (argc > 1 && strcmp(argv[1], "-v") == 0) {
        printf("dwm-statusbar v%s"
#ifdef DEBUG
               " (debug)"
#endif
               " [%s %s]\n\nUsage: %s [-v]\n\n",
                BUILD_VERSION, BUILD_OS, BUILD_KERNEL, argv[0]);
        exit(0);
    }

    open_display();

    while (!sleep(1)) {
        vol = get_vol();
        get_load_average(la);
        read_str(LNK_PATH, lnk, LNKBUFSZ);      /* link status */
        get_datetime(dt);                       /* date/time */
        bat = ((float)read_int(BAT_NOW) /
               read_int(BAT_FULL)) * 100.0f;    /* battery */
        /* battery status (charging/discharging/full/etc) */
        st = get_status();

        if (st == DRAINING && bat < THRESHOLD) {
            snprintf(stat, STRSZ, "LOW BATTERY: suspending after %d ",
                     TIMEOUT - timer);
            set_status(stat);
            if (timer >= TIMEOUT) {
#ifndef DEBUG
                spawn((const char*[])SUSPEND);
#else
                puts("sleeping");
#endif
                timer = 0;
            } else
                timer++;
        } else {
            snprintf(stat, STRSZ, "%s | vol:%s | %s | %c%0.1f%% | %s", la,
                    percent_bar(vol), lnk, status[st], MIN(bat, 100), dt);
            set_status(stat);
            timer = 0;  /* reseting the standby timer */
        }
    }

    close_display();

    return 0;
}

void
open_display()
{
#ifndef DEBUG
    if (!(dpy = XOpenDisplay(NULL)))
        exit(1);
#endif
    signal(SIGINT, close_display);
    signal(SIGTERM, close_display);
}

void
close_display()
{
#ifndef DEBUG
    XCloseDisplay(dpy);
#endif
    exit(0);
}

void
spawn(const char **params) {
    if (fork() == 0) {
        setsid();
        execv(params[0], (char**)params);
        exit(0);
    }
}

void
set_status(char *str)
{
#ifndef DEBUG
    XStoreName(dpy, DefaultRootWindow(dpy), str);
    XSync(dpy, False);
#else
    puts(str);
#endif
}

const char *
percent_bar(int p) {
    const char *s[] = {
        "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
    };
    return s[(p * 7) / 100];
}

void
get_load_average(char *dstla)
{
    double avgs[3];

    if (getloadavg(avgs, 3) < 0) {
        set_status("getloadavg");
        exit(1);
    }

    snprintf(dstla, STRSZ, "%.2f %.2f %.2f", avgs[0], avgs[1], avgs[2]);
}

void
get_datetime(char *dstbuf)
{
    time_t rawtime;
    time(&rawtime);
    snprintf(dstbuf, DTBUFSZ, "%s", ctime(&rawtime));
}

status_t
get_status(void)
{
    FILE *bs;
    char st;

    if ((bs = fopen(BAT_STAT, "r")) == NULL) {
        return UNKNOWN;
    }

    st = fgetc(bs);
    fclose(bs);

    switch(tolower(st)) {
        case 'c': return CHARGING;
        case 'd': return DRAINING;
        case 'i': /* Idle - fall through */
        case 'f': return FULL;
        default : return UNKNOWN;
    }
}

int
read_int(const char *path)
{
    int i = 0;
    char buf[INTBUFSZ] = { 0 };

    read_str(path, buf, INTBUFSZ);
    i = atoi(buf);
    return i;
}

void
read_str(const char *path, char *buf, size_t sz)
{
    FILE *fh;
    char ch = 0;
    int idx = 0;

    if (!(fh = fopen(path, "r"))) return;

    while ((ch = fgetc(fh)) != EOF &&
            ch != '\0' && ch != '\n' &&
            idx < sz) {
        buf[idx++] = ch;
    }

    buf[idx] = '\0';
    fclose(fh);
}

int
get_vol(void)
{
    long min, max, volume = 0;
    snd_mixer_t *handle;
    snd_mixer_selem_id_t *sid;
    const char *card = "default";
    const char *selem_name = "Master";

    snd_mixer_open(&handle, 0);
    snd_mixer_attach(handle, card);
    snd_mixer_selem_register(handle, NULL, NULL);
    snd_mixer_load(handle);

    snd_mixer_selem_id_alloca(&sid);
    snd_mixer_selem_id_set_index(sid, 0);
    snd_mixer_selem_id_set_name(sid, selem_name);
    snd_mixer_elem_t* elem = snd_mixer_find_selem(handle, sid);

    snd_mixer_selem_get_playback_volume_range(elem, &min, &max);
    snd_mixer_selem_get_playback_volume(elem, 0, &volume);
    snd_mixer_close(handle);

    return ((double)volume / max) * 100;
}

