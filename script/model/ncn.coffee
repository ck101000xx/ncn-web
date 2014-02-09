$ = require 'jquery'
Q = require 'q'

class NCNClient
  constructor: (@host = '') ->
  request = (method) -> (path, data) ->
    [path, data] = [@host, path] unless data?
    Q($.ajax @host + path,
        data: data
        type: method
        dataType: 'json'
    )
  get: request 'GET'
  post: request 'POST'
  delete: request 'DELETE'
  put: request 'PUT'

class NCN extends NCNClient
  constructor: (@host = '') ->
    @toilets = new NCNClient @host + '/toilets'

module.exports = {NCN}
