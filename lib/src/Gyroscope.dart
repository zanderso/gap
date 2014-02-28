part of rikulo_gyroscope;

/** onSuccess callback function that returns the AngularSpeed information */
typedef GyroscopeSuccessCB(AngularSpeed speed);
/** onError callback function if fail getting the speederation information */
typedef GyroscopeErrorCB();

/** Singleton Gyroscope. */
Gyroscope gyroscope = new Gyroscope._internal();

/**
 * Capture device motion in x, y, and z direction.
 */
class Gyroscope {
  js.Proxy _gyroscope;

  factory Gyroscope() => gyroscope;

  Gyroscope._internal() {
    if (device == null)
      throw new StateError('device is not ready yet.');
    _gyroscope = js.context.navigator.gyroscope;
  }

  /**
   * Returns the current motion AngularSpeed along x, y, and z axis.
   * The speed is returned via the [success] callback.
   */
  void getCurrentAngularSpeed(GyroscopeSuccessCB success,
                              GyroscopeErrorCB error) {
    var s0 = (p) => success(new AngularSpeed.fromProxy(p));
    List jsfns = JSUtil.newCallbackOnceGroup("speed", [s0, error], [1, 0]);
    var ok = jsfns[0];
    var fail = jsfns[1];
    _gyroscope.getCurrentAngularSpeed(ok, fail);
  }

  /**
   * Register functions to get the AngularSpeed information in a regular
   * interval. This method returns an associated watchID which you can use to
   * clear this watch via [clearWatch] method.
   *
   * + [success] - success callback function.
   * + [error] - error callback function.
   * + [options] - optional parameter.
   */
  watchAngularSpeed(GyroscopeSuccessCB success,
                    GyroscopeErrorCB error, [GyroscopeOptions options]) {
    var s0 = (p) => success(new AngularSpeed.fromProxy(p));
    var ok = s0;
    var fail = error;
    var opts = options == null ? null : js.map(options._toMap());
    var id = "speed_${_gyroscope.watchAngularSpeed(ok, fail, opts)}";
    JSUtil.addCallbacks(id, [ok, fail]);
    return id;
  }

  /**
   * Stop watching the AngularSpeed that was associated with the specified
   * watchID.
   *
   * + [watchID] - the watch ID got from [watchAngularSpeed] method.
   */
  void clearWatch(var watchID) {
    _gyroscope.clearWatch(watchID.substring(4));
    JSUtil.delCallbacks(watchID);
  }
}
