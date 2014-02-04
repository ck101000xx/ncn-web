riot = require('riot')
React = require('react')

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
      <div>
        <ul>
          {items}
        </ul>
      </div>
    )`

class ToiletListApp
  constructor: ->
    @locationInput = `<LocationInput />`
    @toiletList = `<ToiletList />`
    riot.observable @
    return

  
