part of rikulo_barometer;

/** The pressure information.
 */
class Pressure {
  final num val;
  final int timestamp;

  Pressure.fromProxy(js.Proxy p)
      : this.val = p.val,
        this.timestamp = p.timestamp;

  String toString() => "($timestamp: $val)";
}
