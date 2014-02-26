//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, May 18, 2012  09:17:04 AM
// Author: henrichen

part of rikulo_geolocation;

/** Options used with [Geolocation.getCurrentPosition] and
 * [Geolocation.watchPosition] methods.
 */
class GeolocationOptions {
  /** Frequency to retrieve a Position information; default 10000 */
  int frequency;
  /** maximum time allowed in millisecond trying to retrieve a valid Position back */
  int timeout;
  /** maximum cached time in millisecond for a position */
  int maximumAge;
  /** Hint requesting best accuracy Position */
  bool enableHighAccuracy;

  GeolocationOptions({frequency : 10000,
                      enableHighAccuracy : true,
                      timeout,
                      maximumAge})
    : this.frequency = frequency,
      this.enableHighAccuracy = enableHighAccuracy,
      this.timeout = timeout,
      this.maximumAge = maximumAge;

  Map _toMap() => {'frequency' : this.frequency,
                   'enableHighAccuracy' : this.enableHighAccuracy,
                   'timeout' : this.timeout,
                   'maximumAge' : this.maximumAge};
}
