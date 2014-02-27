part of rikulo_thermometer;

/** The temperature information.
 */
class Temperature {
  final num val;
  final int timestamp;

  Temperature.fromProxy(js.Proxy p)
      : this.val = p.val,
        this.timestamp = p.timestamp;

  String toString() => "($timestamp: $val)";
}
