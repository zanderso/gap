part of rikulo_thermometer;

/** onSuccess callback function that returns the Temperature information */
typedef ThermometerSuccessCB(Temperature accel);
/** onError callback function if fail getting the temperature information */
typedef ThermometerErrorCB();

/** Singleton Thermometer. */
Thermometer thermometer = new Thermometer._internal();

/**
 * Capture temperature.
 */
class Thermometer {
  js.Proxy _thermometer;

  factory Thermometer() => thermometer;

  Thermometer._internal() {
    if (device == null)
      throw new StateError('device is not ready yet.');
    _thermometer = js.context.navigator.thermometer;
  }

  /**
   * Returns the current Temperature.
   * The temperature is returned via the [success] callback.
   */
  void getCurrentTemperature(ThermometerSuccessCB success,
                          ThermometerErrorCB error) {
    var s0 = (p) => success(new Temperature.fromProxy(p));
    List jsfns = JSUtil.newCallbackOnceGroup("pres", [s0, error], [1, 0]);
    var ok = jsfns[0];
    var fail = jsfns[1];
    _thermometer.getCurrentTemperature(ok, fail);
  }

  /**
   * Register functions to get the Temperature information in a regular
   * interval. This method returns an associated watchID which you can use to
   * clear this watch via [clearWatch] method.
   *
   * + [success] - success callback function.
   * + [error] - error callback function.
   * + [options] - optional parameter.
   */
  watchTemperature(ThermometerSuccessCB success,
                ThermometerErrorCB error,
                [ThermometerOptions options]) {
    var s0 = (p) => success(new Temperature.fromProxy(p));
    var ok = s0;
    var fail = error;
    var opts = options == null ? null : js.map(options._toMap());
    var id = "pres_${_thermometer.watchTemperature(ok, fail, opts)}";
    JSUtil.addCallbacks(id, [ok, fail]);
    return id;
  }

  /**
   * Stop watching the Temperature that was associated with the specified
   * watchID.
   *
   * + [watchID] - the watch ID got from [watchTemperature] method.
   */
  void clearWatch(var watchID) {
    _thermometer.clearWatch(watchID.substring(4));
    JSUtil.delCallbacks(watchID);
  }
}
