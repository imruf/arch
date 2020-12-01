//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	/* {"⌨", "kbselect", 0, 30}, */
	/* {"",	"torrent",	20,	7}, */
	/* {"",	"moonphase",	18000,	17}, */
	/* {"",	"music",	0,	11}, */
	/* {"",	"mailbox",	180,	12}, */
	/* {"",	"news",		0,	6}, */
	/* {"",	"pacpackages",	0,	8}, */
	/* {"", "cat /tmp/recordingicon 2>/dev/null",	0,	9}, */
	/* {"",     "dwmkb",       0,     30}, */
	/* {"",	"dwmforecast",	10800,	5}, */
	/* {"",	"dwmmemory",	10,	   14}, */
	/*  {"",	"dwmcpu",		10,	   18}, */
	/*  {"",	"dwmnettraf",	1,	   16}, */
	{"",	"dwmvolume",	0,	   10},
	{"",	"dwmbattery",	5,	    3},
	{"",	"dwmclock",	    60,	    1},
	{"",	"dwminternet",	5,	    4},
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = "|";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
