riot = require('riot')
React = require('react')
NCN = require('./ncn')

LocationInput = React.createClass
  render: -> `(
    <form>
      <input type="text"></input>
      <input type="submit"></input>
    </form>
  )`

ToiletItem = React.createClass
  render: -> `(
    <li><h3>{this.props.name}</h3>{this.props.address}</li>
  )`

ToiletList = React.createClass
  getInitialState: ->
    toilets: []
  render: ->
    items = (`(<ToiletItem name={name} address={address} />)` for {address, name} in @state.toilets)
    `(
      <ul>
        {items}
      </ul>
    )`
