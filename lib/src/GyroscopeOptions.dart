part of rikulo_gyroscope;

/** Options used with [Gyroscope.watchAngularSpeed] */
class GyroscopeOptions {
  /** interval in milliseconds to retrieve AngularSpeed back; default to 10000 */
  final int frequency;

  GyroscopeOptions({int frequency : 10000})
      : this.frequency = frequency;

  Map _toMap() => {'frequency' : this.frequency};
}
