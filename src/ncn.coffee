riot = require 'riot'
Q = require 'q'

class NCN
  constructor: (@host = '') ->
    riot.observble @
  request = (method, url, data) ->
    deferred = Q.defer()
    x = new XMLHttpRequest()
    x.responseType = 'json'
    x.addEventListener 'load', () -> deferred.resolve x.response
    x.addEventListener 'error', () -> deferred.reject x
    x.open('method', host + path)
    x.send(JSON.stringify(data))
    deferred.promise
  get: (path, data) ->
    buildParam = (prefix, obj) ->
      for key, value of data
        if _.isObject obj
        then buildParam(key + '.', value)
        else encodeURIComponent(prefix + key) + '=' + encodeURIComponent(value)
    _.fltten(buildParam(data)).join('&')
    prefix = if _.contains(path '?') then '?' else ':'
    request('GET', @host + path + prefix + qs)
  post: (path, data) -> request('POST', @host + path, data)
  del: (path, data) -> request('DELETE', @host + path)
  put: (path, data) -> request('PUT', @host + path)


exports = NCN
