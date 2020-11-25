//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	 	/*Update Interval*/	/*Update Signal*/
	{"░▒▒░", "/home/masud/.local/bin/statusbar/memory",	        60,		            1},
	{" ", "/home/masud/.local/bin/statusbar/cpu",	            20,		            1},
	{"", "/home/masud/.local/bin/statusbar/forecast",           3600,	            1},
	{" ", "/home/masud/.local/bin/statusbar/blight",		    120,	            2},
	{"", "/home/masud/.local/bin/statusbar/nettraf",			1,		            0},
	{"", "/home/masud/.local/bin/statusbar/battery",	        60,		            1},
	{"", "/home/masud/.local/bin/statusbar/volume",			    20,		            10},
	{"  ", "/home/masud/.local/bin/statusbar/clock",			60,		            0},
	{"", "/home/masud/.local/bin/statusbar/internet",			20,		            0},
	/* {"🔺 ", "/home/masud/.local/bin/statusbar/upt",		    3600,	            2}, */
    /* {" 🐧 ", "/opt/dwmblocks-distrotube-git/scripts/kernel", 360,		        2}, */
    /* {" 🐧 ", "/opt/dwmblocks-distrotube-git/scripts/kernel", 360,		        2}, */

    
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
