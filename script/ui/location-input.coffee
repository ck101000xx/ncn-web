`/** @jsx React.DOM */`
React = require 'react'

LocationInput = React.createClass
  onSubmit: (e) ->
    do e.preventDefault
    @props.onSubmit @refs.input.getDOMNode().value
  render: -> `(
    <form onSubmit={this.onSubmit}>
      <input ref="input" type="text"></input>
      <input type="submit"></input>
    </form>
  )`

module.exports = {LocationInput}
