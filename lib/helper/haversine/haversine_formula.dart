import 'dart:math';

class HaversineFormula {
  static _toRadians(double degree) {
    return degree * pi / 180;
  }

  double distanceBetween(
    double startLatitude,
    double endLatitude,
    double startLongitude,
    double endLongitude,
  ) {
    var earthRadius = 6378137.0;
    var dLat = _toRadians(endLatitude - startLatitude);
    var dLon = _toRadians(endLongitude - startLongitude);

    var x =
        (dLon) * cos((_toRadians(startLatitude) + _toRadians(endLatitude)) / 2);
    var y = dLat;

    var d = sqrt((x * x) + (y * y)) * earthRadius;

    return d;
  }
}
