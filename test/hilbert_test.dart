import 'package:test/test.dart';
import 'package:stsapp/hilbert.dart';


void main()
{

  group("Testing xy2d", () {
    int x = 4;
    int y = 3;
    int n = 8;
    int d = xy2d(x, y, n);

    test("Test xy2d and d2xy conversions", () {
      expect((x,y), d2xy(n, d));
      expect(d, xy2d(x, y, n));
    });
  });
}