Bacon = require 'bacon'
React = require 'react'
{ToiletList} = require 'ui/toilet-list'
{LocationInput} = require 'ui/location-input'

LocationInputApp = React.CreateClass
  getDefaultProps: ->
    onSubmit: new Bacon.Bus
    onChange: new Bacon.Bus
  componentDidMount: ->
    addresses =
      @props.onChange
        .map '.target.value'
        .toProperty()
        .sampleBy @props.onSubmit
    onLocation =
      addresses
        .flatMap @props.geocoder, 'codeAddress'
        .map '.0.location'
    @props.onLocation.plug onLocation
  render: ->
    `<LocationInput onChange={this.props.onChange.push} onSubmit={this.props.onSubmit.push} />`

ToiletListApp = React.createClass
  getInitialState: ->
    toiles: []
  componentDidMount: ->
    @props.toilets.onValue (toilets) ->
      @setState(toilets)
  render: ->
    `<ToiletList toilets={this.state.toilets} onSelect={this.props.onSelect.push} />`

