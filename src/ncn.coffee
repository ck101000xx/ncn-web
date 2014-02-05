Bacon = require 'bacon'
$ = require 'jquery'

class NCN
  constructor: (@host = '') ->
  request = (method) -> (path, data) ->
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
