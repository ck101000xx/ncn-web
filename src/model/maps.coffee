$ = require('jquery')
Bacon = require('bacon')

class GeoCoder
  constructor: () ->
    @geocoder = new google.maps.Geocoder()
  code: (request) ->
    deferred = $.Deferred()
    @geocoder.geocode request, (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        deferred.resolve results.map (result) ->
          address: result.formatted_address
          location:
            longitude: result.geometry.loaction.lng()
            latitude:  result.geometry.loaction.lat()
      else
        deferred.reject status
    Bacon.fromPromise deferred
  codeAddress: (address) ->
    @code address: address
  codeLocation: (location) ->
    @code location: google.maps.LatLng(location.latitude, location.longitude)

class CurrentLocation
  constructor: ->
    stream = Bacon.fromBinder (sink) ->
      navigator.geolocation.watchPosition(
        (coords:{longitude, latitude}) -> sink {longitude, lataiude}
        (e) -> sink new Bacon.Error(e)
    @location = stream.toProperty()

module.exports = {GeoCoder, CurrentLocation}
