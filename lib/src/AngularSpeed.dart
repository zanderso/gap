part of rikulo_gyroscope;

/** The angular speed information in radians/s.
 */
class AngularSpeed {
  final Vector3 w;
  final int timestamp;
  static final double NS2S = 1.0 / 1000000000.0;

  AngularSpeed.fromProxy(js.Proxy p) {
    this.w = new Vector3(p.x, p.y, p.z);
    this.timestamp = p.timestamp;
  }
    
  Quaternion _quaternion(int old_ts) {
    if (old_ts != 0) {
      double dT = (this.timestamp.toDouble() - ts.toDouble()) * NS2S;

      double w_mag = sqrt(w.x*w.x + w.y*w.y + w.z*w.z);
      Vector3 w_norm = this.w / w_mag;
      if (w_norm < 0.0001) {
        return null;
      }

      double thetaOverTwo = w_mag * dT / 2.0;
      double sinThetaOverTwo = sin(thetaOverTwo);
      double cosThetaOverTwo = cos(thetaOverTwo);
      return new Quaternion(sinThetaOverTwo * w_norm.x,
                            sinThetaOverTwo * w_norm.y,
                            sinThetaOverTwo * w_norm.z,
                            cosThetaOverTwo);
    }
    return null;
  }

  void doRotation(Vector3 v, int old_ts) {
    Quaternion q = _quaternion(old_ts);
    if (q != null) {
      q.rotate(v);
    }
  }

  String toString() => "($timestamp: ${w.x}, ${w.y}, ${w.z})";
}
