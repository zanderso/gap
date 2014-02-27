part of rikulo_thermometer;

/** Options used with [Thermometer.watchTemperature] */
class ThermometerOptions {
  /** interval in milliseconds to retrieve Temperature back; default to 10000 */
  final int frequency;

  ThermometerOptions({int frequency : 10000})
      : this.frequency = frequency;

  Map _toMap() => {'frequency' : this.frequency};
}
