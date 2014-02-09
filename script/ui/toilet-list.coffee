`/** @jsx React.DOM */`
React = require 'react'

ToiletItem = React.createClass
  onClick: ->
    @props.onClick @props.toilet
  render: -> `(
    <li onClick={this.onClick}>
      <a href="#">
        {this.props.toilet.name} {this.props.toilet.address}
        <span className="chevron"></span>
      </a>
    </li>
  )`

ToiletList = React.createClass
  render: ->
    items =
      `<ToiletItem toilet={toilet} onClick={this.props.onSelect}/>` for toilet in @props.list
    return `(
      <ul className="list">
        {items}
      </ul>
    )`

module.exports = {ToiletList}
