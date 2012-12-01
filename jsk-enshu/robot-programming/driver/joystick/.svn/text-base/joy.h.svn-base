//-----------------------------------------------------------------------------
// Function-prototypes
//-----------------------------------------------------------------------------
#ifdef WIN32
#define DllExport       __declspec(dllexport)
#else
#define DllExport
#endif

extern "C"{
  bool   DllExport joyInit(void *h);
  bool   DllExport joyUpdate();
  void   DllExport joyQuit();
  double DllExport joyGetXPos ();
  double DllExport joyGetYPos ();
  double DllExport joyGetZPos ();
  double DllExport joyGetXRot ();
  double DllExport joyGetYRot ();
  double DllExport joyGetZRot ();
  double DllExport joyGet0Sli ();
  double DllExport joyGet1Sli ();
  int    DllExport joyGetPOV (int i);
  int    DllExport joyGetButtons (int i);
  double DllExport joyGetAxis (int i);

  bool   DllExport joyForces();
  bool   DllExport joyRumbleMagnitude(int lMagnitude);
  bool   DllExport joyRumbleEnvelope(int lMagnitude, double attack, double fade, double duration);
}


