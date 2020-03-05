/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#02143f" },
	[SchemeSel] = { "#005577", "#eee8d5" },
	[SchemeSelHighlight] = { "#b58900", "#eee8d5" },
	[SchemeNormHighlight] = { "#b58900", "#02143f" },
	[SchemeOut] = { "#000000", "#00ffff" },
	[SchemeMid] = { "#eee8d5", "#bf616a" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
