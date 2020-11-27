/* If interval of a block is set to 0, the block will only be updated once at startup.
 * If interval is set to a negative value, the block will never be updated in the main loop.
 * Set signal to 0 if both clickability and signaling are not required for the block.
 * Signal must be less than 10 for clickable blocks.
 * If multiple signals are pending, then the lowest numbered one will be delivered first. */

static const Block blocks[] = {
	/*Icon*/	/*Command*/	 	/*Update Interval*/	/*Update Signal*/
	{"░▒▒░", "/home/masud/.local/bin/statusbar/forecast",	    10800,	            0},
	{"", "/home/masud/.local/bin/statusbar/memory",	            60,		            0},
	{" ", "/home/masud/.local/bin/statusbar/cpu",	            20,		            0},
	{"", "/home/masud/.local/bin/statusbar/nettraf",			1,		            0},
	{"", "/home/masud/.local/bin/statusbar/battery",	        60,		            0},
	{"", "/home/masud/.local/bin/statusbar/volume",			    20,		            0},
	{"  ", "/home/masud/.local/bin/statusbar/clock",			60,		            0},
	{"", "/home/masud/.local/bin/statusbar/internet",			20,		            0},
	/* {"🔺 ", "/home/masud/.local/bin/statusbar/upt",		    3600,	            2}, */
    /* {" 🐧 ", "/opt/dwmblocks-distrotube-git/scripts/kernel", 360,		        2}, */
	/* {" ", "/home/masud/.local/bin/statusbar/blight",	    60,	                5}, */

    
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
