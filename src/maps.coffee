Q = require('q')

class GeoCoder
  constructor: () ->
    @geocoder = new google.maps.Geocoder()
  code: (request) ->
    deferred = Q.defer()
    @geocoder.geocode request, (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        deferred.resolve results.map (result) ->
          address: result.formatted_address
          location:
            longitude: result.geometry.loaction.lng()
            latitude:  result.geometry.loaction.lat()
      else
        deferred.reject status
    deferred.promise
  codeAddress: (address) ->
    @code address: address
  codeLocation: (location) ->
    @code location: google.maps.LatLng(location.latitude, location.longitude)

exports = {GeoCoder}
