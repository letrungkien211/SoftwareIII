#include "screen.h"

//#ifndef Linux // readline
#if !Win32 
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <curses.h>
#include <term.h>


#ifdef CBREAK
# include <sgtty.h>
# define SGTTY
#else
# ifdef TCGETA
#  define TERMIO
#  include <termio.h>
# else
#  define TERMIOS
#  include <termios.h>
# endif
#endif /* CBREAK */

#if defined(TERMIO) || defined(TERMIOS)
# ifndef TAB3
#  ifdef OXTABS
#   define TAB3 OXTABS
#  else
#   define TAB3 0
#  endif
# endif
#endif

#include <unistd.h>
#include <strings.h>
#include <string.h>

#if 0
int tgetent(char *bp, char *name);
int tgetflag(char id[2]);
int tgetnum(char id[2]);
char *tgetstr(char id[2], char **area);
char *tgoto(char *cap, int col, int row);
    /*int tputs(char *str, int affcnt, int (*putc)(void));*/
int tputs(char *str, int affcnt, int (*putc)(char));
#endif

    /*int putstdout();*/

int  overstrike;
int  screen_length;
int  screen_width;
char ch_erase;
char ch_kill;
char smart_terminal;
char PC;
    /*char *tgetstr();*/
    /*char *tgoto();*/
char termcap_buf[1024];
char string_buffer[1024];
char home[15];
char lower_left[15];
char *clear_line;
//char *clear_screen;
char *clear_to_end;
char *cursor_motion;
char *start_standout;
char *end_standout;
char *terminal_init;
char *terminal_end;
char *gohome;
short ospeed;

int get_screensize(void);
int init_screen(void);
int end_screen(void);
int reinit_screen(void);
    

#ifdef SGTTY
static struct sgttyb old_settings;
static struct sgttyb new_settings;
#endif
#ifdef TERMIO
static struct termio old_settings;
static struct termio new_settings;
#endif
#ifdef TERMIOS
//static struct termios old_settings;
//static struct termios new_settings;
#endif
static char is_a_terminal = 0;
#ifdef TOStop
static int old_lword;
static int new_lword;
#endif

#define	STDIN	0
#define	STDOUT	1
#define	STDERR	2

void init_termcap(int interactive)
{
    char *bufptr;
    char *PCptr;
    char *term_name;
    /*    char *getenv(char *);*/
    int status;

    /* set defaults in case we aren't smart */
    screen_width = 128;
    screen_length = 0;

    if (!interactive)
    {
	/* pretend we have a dumb terminal */
	smart_terminal = 0;
	return;
    }

    /* assume we have a smart terminal until proven otherwise */
    smart_terminal = 1;

    /* get the terminal name */
    term_name = getenv("TERM");

    /* if there is no TERM, assume it's a dumb terminal */
    /* patch courtesy of Sam Horrocks at telegraph.ics.uci.edu */
    if (term_name == NULL)
    {
	smart_terminal = 0;
	return;
    }

    /* now get the termcap entry */
    if ((status = tgetent(termcap_buf, term_name)) != 1)
    {
	if (status == -1)
	{
	    fprintf(stderr, "can't open termcap file\n");
	}
	else
	{
	    fprintf(stderr, "no termcap entry for a `%s' terminal\n",
		     term_name);
	}

	/* pretend it's dumb and proceed */
	smart_terminal = 0;
	return;
    }

    /* "hardcopy" immediately indicates a very stupid terminal */
    if (tgetflag("hc"))
    {
	smart_terminal = 0;
	return;
    }

    /* set up common terminal capabilities */
    if ((screen_length = tgetnum("li")) <= 0)
    {
	screen_length = smart_terminal = 0;
	return;
    }

    /* screen_width is a little different */
    if ((screen_width = tgetnum("co")) == -1)
    {
	screen_width = 79;
    }
    else
    {
	screen_width -= 1;
    }

    /* terminals that overstrike need special attention */
    overstrike = tgetflag("os");

    /* initialize the pointer into the termcap string buffer */
    bufptr = string_buffer;

    /* get "ce", clear to end */
    if (!overstrike)
    {
	clear_line = tgetstr("ce", &bufptr);
    }

    /* get necessary capabilities */
    if ((clear_screen  = tgetstr("cl", &bufptr)) == NULL ||
	(cursor_motion = tgetstr("cm", &bufptr)) == NULL)
    {
	smart_terminal = 0;
	return;
    }
    gohome=tgetstr("ho", &bufptr);

    /* get some more sophisticated stuff -- these are optional */
    clear_to_end   = tgetstr("cd", &bufptr);
    terminal_init  = tgetstr("ti", &bufptr);
    terminal_end   = tgetstr("te", &bufptr);
    start_standout = tgetstr("so", &bufptr);
    end_standout   = tgetstr("se", &bufptr);

    /* pad character */
    PC = (PCptr = tgetstr("pc", &bufptr)) ? *PCptr : 0;

    /* set convenience strings */
    (void) strcpy(home, tgoto(cursor_motion, 0, 0));
    /* (lower_left is set in get_screensize) */

    /* get the actual screen size with an ioctl, if needed */
    /* This may change screen_width and screen_length, and it always
       sets lower_left. */
    get_screensize();

    /* if stdout is not a terminal, pretend we are a dumb terminal */
#ifdef SGTTY
    if (ioctl(STDOUT, TIOCGETP, &old_settings) == -1)
    {
	smart_terminal = 0;
    }
#endif
#ifdef TERMIO
    if (ioctl(STDOUT, TCGETA, &old_settings) == -1)
    {
	smart_terminal = 0;
    }
#endif
#ifdef TERMIOS
    if (tcgetattr(STDOUT, (struct termios*)&old_settings) == -1)
    {
	smart_terminal = 0;
    }
#endif
}

int init_screen(void)
{
    /* get the old settings for safe keeping */
#ifdef SGTTY
    if (ioctl(STDOUT, TIOCGETP, &old_settings) != -1)
    {
	/* copy the settings so we can modify them */
	new_settings = old_settings;

	/* turn on CBREAK and turn off character echo and tab expansion */
	new_settings.sg_flags |= CBREAK;
	new_settings.sg_flags &= ~(ECHO|XTABS);
	(void) ioctl(STDOUT, TIOCSETP, &new_settings);

	/* remember the erase and kill characters */
	ch_erase = old_settings.sg_erase;
	ch_kill  = old_settings.sg_kill;

#ifdef TOStop
	/* get the local mode word */
	(void) ioctl(STDOUT, TIOCLGET, &old_lword);

	/* modify it */
	new_lword = old_lword | LTOSTOP;
	(void) ioctl(STDOUT, TIOCLSET, &new_lword);
#endif
	/* remember that it really is a terminal */
	is_a_terminal = 1;

	/* send the termcap initialization string */
	putcap(terminal_init);
    }
#endif
#ifdef TERMIO
    if (ioctl(STDOUT, TCGETA, &old_settings) != -1)
    {
	/* copy the settings so we can modify them */
	new_settings = old_settings;

	/* turn off ICANON, character echo and tab expansion */
	new_settings.c_lflag &= ~(ICANON|ECHO);
	new_settings.c_oflag &= ~(TAB3);
	new_settings.c_cc[VMIN] = 1;
	new_settings.c_cc[VTIME] = 0;
	(void) ioctl(STDOUT, TCSETA, &new_settings);

	/* remember the erase and kill characters */
	ch_erase = old_settings.c_cc[VERASE];
	ch_kill  = old_settings.c_cc[VKILL];

	/* remember that it really is a terminal */
	is_a_terminal = 1;

	/* send the termcap initialization string */
	putcap(terminal_init);
    }
#endif
#ifdef TERMIOS
    if (tcgetattr(STDOUT, &old_settings) != -1)
    {
	/* copy the settings so we can modify them */
	new_settings = old_settings;

	/* turn off ICANON, character echo and tab expansion */
	new_settings.c_lflag &= ~(ICANON|ECHO);
	new_settings.c_oflag &= ~(TAB3);
	new_settings.c_cc[VMIN] = 1;
	new_settings.c_cc[VTIME] = 0;
	(void) tcsetattr(STDOUT, TCSADRAIN, &new_settings);

	/* remember the erase and kill characters */
	ch_erase = old_settings.c_cc[VERASE];
	ch_kill  = old_settings.c_cc[VKILL];

	/* remember that it really is a terminal */
	is_a_terminal = 1;

	/* send the termcap initialization string */
	putcap(terminal_init);
    }
#endif

    if (!is_a_terminal)
    {
	/* not a terminal at all---consider it dumb */
	smart_terminal = 0;
    }

    return 0;
}

int end_screen(void)
{
    /* move to the lower left, clear the line and send "te" */
    if (smart_terminal)
    {
 	putcap(lower_left);
	putcap(clear_line);
	fflush(stdout);
	putcap(terminal_end);
    }

    /* if we have settings to reset, then do so */
    if (is_a_terminal)
    {
#ifdef SGTTY
	(void) ioctl(STDOUT, TIOCSETP, &old_settings);
#ifdef TOStop
	(void) ioctl(STDOUT, TIOCLSET, &old_lword);
#endif
#endif
#ifdef TERMIO
	(void) ioctl(STDOUT, TCSETA, &old_settings);
#endif
#ifdef TERMIOS
	(void) tcsetattr(STDOUT, TCSADRAIN, &old_settings);
#endif
    }

    return 0;
}

int reinit_screen(void)
{
    /* install our settings if it is a terminal */
    if (is_a_terminal)
    {
#ifdef SGTTY
	(void) ioctl(STDOUT, TIOCSETP, &new_settings);
#ifdef TOStop
	(void) ioctl(STDOUT, TIOCLSET, &new_lword);
#endif
#endif
#ifdef TERMIO
	(void) ioctl(STDOUT, TCSETA, &new_settings);
#endif
#ifdef TERMIOS
	(void) tcsetattr(STDOUT, TCSADRAIN, &new_settings);
#endif
    }

    /* send init string */
    if (smart_terminal)
    {
	putcap(terminal_init);
    }

    return 0;
}

int get_screensize(void)
{

#ifdef TIOCGWINSZ

    struct winsize ws;

    if (ioctl (1, TIOCGWINSZ, &ws) != -1)
    {
	if (ws.ws_row != 0)
	{
	    screen_length = ws.ws_row;
	}
	if (ws.ws_col != 0)
	{
	    screen_width = ws.ws_col - 1;
	}
    }

#else
#ifdef TIOCGSIZE

    struct ttysize ts;

    if (ioctl (1, TIOCGSIZE, &ts) != -1)
    {
	if (ts.ts_lines != 0)
	{
	    screen_length = ts.ts_lines;
	}
	if (ts.ts_cols != 0)
	{
	    screen_width = ts.ts_cols - 1;
	}
    }

#endif /* TIOCGSIZE */
#endif /* TIOCGWINSZ */

    (void) strcpy(lower_left, tgoto(cursor_motion, 0, screen_length - 1));

    return 0;
}

#if 0
standout(char *msg)
{
    if (smart_terminal)
    {
	putcap(start_standout);
	fputs(msg, stdout);
	putcap(end_standout);
    }
    else
    {
	fputs(msg, stdout);
    }

    return 0;
}
#endif

void clear_scr()
{
    if (smart_terminal)
    {
	putcap(clear_screen);
    }
}

void ikuo_go_home() {
  if (smart_terminal) putcap(gohome);
}


int clear_eol(int len)
{
    if (smart_terminal && !overstrike && len > 0)
    {
	if (clear_line)
	{
	    putcap(clear_line);
	    return(0);
	}
	else
	{
	    while (len-- > 0)
	    {
		putchar(' ');
	    }
	    return(1);
	}
    }
    return(-1);
}

void go_home()

{
    if (smart_terminal)
    {
	putcap(home);
    }
}

/* This has to be defined as a subroutine for tputs (instead of a macro) */

int  putstdout(char ch)
{
    putchar(ch);
    return 0;
}
#else  /* Win32 */
clear ()
{
  //    system("cls");
}
clear_scr(){
}
#endif

//#else  // readline
//#include <curses.h>
//#include <term.h>
//#endif // readline
