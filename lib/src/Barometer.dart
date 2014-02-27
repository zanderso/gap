part of rikulo_barometer;

/** onSuccess callback function that returns the Pressure information */
typedef BarometerSuccessCB(Pressure accel);
/** onError callback function if fail getting the pressure information */
typedef BarometerErrorCB();

/** Singleton Barometer. */
Barometer barometer = new Barometer._internal();

/**
 * Capture pressure.
 */
class Barometer {
  js.Proxy _barometer;

  factory Barometer() => barometer;

  Barometer._internal() {
    if (device == null)
      throw new StateError('device is not ready yet.');
    _barometer = js.context.navigator.barometer;
  }

  /**
   * Returns the current Pressure.
   * The pressure is returned via the [success] callback.
   */
  void getCurrentPressure(BarometerSuccessCB success,
                          BarometerErrorCB error) {
    var s0 = (p) => success(new Pressure.fromProxy(p));
    List jsfns = JSUtil.newCallbackOnceGroup("pres", [s0, error], [1, 0]);
    var ok = jsfns[0];
    var fail = jsfns[1];
    _barometer.getCurrentPressure(ok, fail);
  }

  /**
   * Register functions to get the Pressure information in a regular
   * interval. This method returns an associated watchID which you can use to
   * clear this watch via [clearWatch] method.
   *
   * + [success] - success callback function.
   * + [error] - error callback function.
   * + [options] - optional parameter.
   */
  watchPressure(BarometerSuccessCB success,
                BarometerErrorCB error,
                [BarometerOptions options]) {
    var s0 = (p) => success(new Pressure.fromProxy(p));
    var ok = s0;
    var fail = error;
    var opts = options == null ? null : js.map(options._toMap());
    var id = "pres_${_barometer.watchPressure(ok, fail, opts)}";
    JSUtil.addCallbacks(id, [ok, fail]);
    return id;
  }

  /**
   * Stop watching the Pressure that was associated with the specified
   * watchID.
   *
   * + [watchID] - the watch ID got from [watchPressure] method.
   */
  void clearWatch(var watchID) {
    _barometer.clearWatch(watchID.substring(4));
    JSUtil.delCallbacks(watchID);
  }
}
