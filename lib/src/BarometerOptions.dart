part of rikulo_barometer;

/** Options used with [Barometer.watchPressure] */
class BarometerOptions {
  /** interval in milliseconds to retrieve Pressure back; default to 10000 */
  final int frequency;

  BarometerOptions({int frequency : 10000})
      : this.frequency = frequency;

  Map _toMap() => {'frequency' : this.frequency};
}
