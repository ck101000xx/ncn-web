Bacon = require 'bacon'
$ = require 'jquery'

class NCN
  constructor: (@host = '') ->
    @toilets = new NCN @host + '/toilets'
  request = (method) -> (path, data) ->
    [path, data] = [@host, path] unless data?
    Bacon.fromPromise(
      $.ajax @host + path,
        data: data
        type: method
        dataType: 'json')
  get: request 'GET'
  post: request 'POST'
  delete: request 'DELETE'
  put: request 'PUT'

module.exports = NCN
