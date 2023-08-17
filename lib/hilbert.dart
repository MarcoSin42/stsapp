import 'dart:ffi';

/// Given a point (x,y) on a nxn 2d-plane
/// Return the associated point on the n-th order hilbert curve
int xy2d(int x, int y, int n)
{
  int rx = 0;
  int ry = 0;
  int s = n ~/ 2;
  int d = 0;

  while (s > 0) {
    rx = ((x & s) > 0) ? 1 : 0;
    ry = ((y & s) > 0) ? 1 : 0;

    d += s*s*((3 * rx) ^ ry);
    (x,y) = rot(n, x, y, rx, ry);
    s = s ~/ 2;
  }

  return d;
}
/// Given a point on a hilbert curve, d, and a dimension of said curve, n.
/// Return the associated (x,y) points on the 2d-plane
(int, int) d2xy(int n, int d)
{
  int rx = 0;
  int ry = 0;
  int s = 1;
  int t = d;

  int x = 0;
  int y = 0;
  while (s < n) {
    rx = 1 & (t ~/ 2);
    ry = 1 & (t ^ rx);

    (x,y) = rot(s, x, y, rx, ry);

    x += s * rx;
    y += s * ry;

    t = t ~/ 4;
    s *= 2;
  }

  return (x, y);
}

/// Given two coordinates, x and y, we perform a 'rotation' on these coordinates
/// rx and ry dictate whether or not we should rotate
/// then, we return the rotated points
(int, int) rot(int n, int x, int y, int rx, int ry)
{

  if (ry == 0) {
    if (rx == 1) {
      x = n - 1 - x;
      y = n - 1 - y;
    }

    (x,y) = (y,x);
  }

  return (x,y);
}

