/*
 * arm-kinematics.c
 *
 * 2006/11/24 nishino
 */
#include "arm_kinematics.h"
#include<math.h>

#define deg2rad(x) ((x)*M_PI/180)
#define rad2deg(x) ((x)*180.0/M_PI)
#define	FALSE       (0)
#define	TRUE        (!(FALSE))

int forward_kinematics_by_geometry(float angles[], float position[]) {
  position[0] =
    BASE_X +
    (L1 + L2 * cos(deg2rad(-1*angles[1])) + L3 * cos(deg2rad(-1*(angles[1]+angles[2])))) * cos(deg2rad(angles[0]));
  position[1] =
    BASE_Y +
    (L1 + L2 * cos(deg2rad(-1*angles[1])) + L3 * cos(deg2rad(-1*(angles[1]+angles[2])))) * sin(deg2rad(angles[0]));
  position[2] =
    BASE_Z -
    L2 * sin(deg2rad(-1*angles[1])) - L3 * sin(deg2rad(-1*(angles[1]+angles[2])));
  return TRUE;
}
int inverse_kinematics_by_geometry(float position[], float angles[][3]) {
  float x, y, z;
  float yy, ll, th1, th2, th3;
  float tmp;
  float tmp2;

  x = position[0] - BASE_X; y = position[1] - BASE_Y; z = position[2] - BASE_Z;
  if(x==0){
    if(y>0) angles[0][0] = angles[1][0] = 90;
    else angles[0][0] = angles[1][0] = -90;
  }
  else{
    tmp2= y/x;
    angles[0][0] = angles[1][0] = rad2deg(atan(tmp2));
  }
  yy = sqrt(x*x + y*y) - L1;
  ll = sqrt(yy*yy+z*z);
  th1 = -atan2f(z, yy);
  tmp = (-L3*L3 + (L2*L2+ll*ll)) / (2.0*L2*ll);
  if (fabs(tmp) > 1.0) return 0;
  th2 = acos(tmp);
  th3 = acos((-L2*L2 + (L3*L3+ll*ll)) / (2.0*L3*ll));
  angles[0][1] = -1*rad2deg(th1 + th2);
  angles[0][2] = rad2deg(th2 + th3);
  angles[1][1] = -1*rad2deg(th1 - th2);
  angles[1][2] = -1*rad2deg(th2 + th3);

  // printf("atan2(y, x)=%lf\n", atan2(y,x));
  // printf("atan(19.2)=%lf\n", atan(19.2) );

  //printf("x=%f, y=%f, z=%f, yy=%f, ll=%f\n", x, y, z, yy, ll);
  //printf("x=%f, y=%f, z=%f\n", x, y, z);
  //printf("th1=%f, th2=%f, th3=%f\n", rad2deg(th1), rad2deg(th2), rad2deg(th3));

  return 2;
}

/* int forward_kinematics_by_DHparameter(float angles[], float position[]) { */
/*   return TRUE; */
/* } */
/* int inverse_kinematics_by_jacobian(float angles[], float position[]) { */
/*   return TRUE; */
/* } */
