#ifdef WIN32
#include <windows.h>
#include <commctrl.h>
#include <basetsd.h>
#include <dinput.h>
#else
#define HWND	char *
#define DI_FFNOMINALMAX 255
#define TRUE	true
#define FALSE	false
#define Sleep(a)	usleep((a)*1000)
#include <unistd.h>
#endif

#include <stdio.h>
#include <math.h>
#include "joy.h"

//-----------------------------------------------------------------------------
// Name: main()
// Desc: Entry point for the application.  Since we use a simple dialog for 
//       user interaction we don't need to pump messages.
//-----------------------------------------------------------------------------
//int APIENTRY WinMain( HINSTANCE hInst, HINSTANCE, LPSTR, int )
int main( ) 
{
    HWND hDlg = NULL;

    if( joyInit( hDlg ) == false )
    {
#ifdef WIN32
	MessageBox( NULL, TEXT("Error Initializing DirectInput"), 
		    TEXT("DirectInput Sample"), MB_ICONERROR | MB_OK );
#else
	fprintf(stderr, "Error Initializing DirectInput\n");
#endif
	return FALSE;
    }

    joyUpdate( );
    for ( int i  = 0 ; i < 100 ; i++ ){
      // Update the input device every timer message
      if( joyUpdate( ) == false )
	{
#ifdef WIN32
	  MessageBox( NULL, TEXT("Error Reading Input State. ") \
		      TEXT("The sample will now exit."), TEXT("DirectInput Sample"), 
		      MB_ICONERROR | MB_OK );
#else
	  fprintf(stderr, "Error Reading Input State. \n");
#endif
	  return FALSE;
	}
      joyRumbleEnvelope((int)(DI_FFNOMINALMAX*joyGetZRot()+1.0), 0.2, 0.2, 1);
      //joyRumbleMagnitude((int)(DI_FFNOMINALMAX*joyGetZRot()+1.0));
      printf("x:%5.2f y:%5.2f, ", joyGetXPos(), joyGetYPos());
      printf("z:%5.2f v:%5.2f, ", joyGetZRot(), joyGet0Sli());
      printf("pov:%3d, ", (joyGetPOV(0)>=0)?(joyGetPOV(0)/4500):-1);
      for ( int i = 0 ; i < 16; i ++ ) {
	printf("%d ", joyGetButtons(i));
      }
      printf("\n");
      Sleep(150);
    }
    joyRumbleMagnitude( 0 );
    
    joyQuit();    
    return TRUE;
}

