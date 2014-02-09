{maps} = require 'google'
Q = require 'q'

class Geocoder
  constructor: () ->
    @geocoder = new maps.Geocoder()
  code: (request) ->
    deferred = Q.defer()
    @geocoder.geocode request, (results, status) ->
      if status is maps.GeocoderStatus.OK
        deferred.resolve results.map (result) ->
          address: result.formatted_address
          location:
            longitude: result.geometry.location.lng()
            latitude:  result.geometry.location.lat()
      else
        deferred.reject status
    deferred.promise
  codeAddress: (address) ->
    @code address: address
  codeLocation: (location) ->
    @code location: new maps.LatLng(location.latitude, location.longitude)
  currentLocation: ->
    navigator.geolocation.getCurrentPosition(
      (coords:{longitude, latitude}) -> deferred.resolve {longitude, lataiude}
      (e) -> deferred.reject e
    )

module.exports = {Geocoder}
