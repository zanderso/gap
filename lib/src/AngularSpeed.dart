part of rikulo_gyroscope;

/** The angular speed information in radians/s.
 */
class AngularSpeed {
  final num x;
  final num y;
  final num z;
  final int timestamp;

  AngularSpeed.fromProxy(js.Proxy p)
      : this.x = p.x,
        this.y = p.y,
        this.z = p.z,
        this.timestamp = p.timestamp;

  String toString() => "($timestamp: $x, $y, $z)";
}
