React = require('react')

ToiletItem = React.createClass
  render: -> `(
    <li onClick={this.props.onClick}><h3>{this.props.toilet.name}</h3>{this.props.toilet.address}</li>
  )`

ToiletList = React.createClass
  render: ->
    items = @props.toilets.map (toilet) -> `<ToiletItem toilet={toilet} />`
    `(
      <ul>
        {items}
      </ul>
    )`

module.exports = {ToiletList}
