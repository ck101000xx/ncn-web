`/** @jsx React.DOM */`
React = require 'react'

{NCN} = require '../model/ncn'
{Geocoder, CurrentLocation} = require '../model/maps'
{ToiletList} = require '../ui/toilet-list'
{LocationInput} = require '../ui/location-input'

class ToiletsCtrl
  constructor: (@view) ->
    @ncn = new NCN '//ncn-ray851107.rhcloud.com'
    @geocoder = new Geocoder
  onSelect: ->
  onSubmit: (address) ->
    @geocoder.codeAddress(address)
      .then ([{location}]) =>
        @ncn.toilets.get
          circle: ($.extend location, radius: 2500)
      .then (list) =>
        @view.setState list: list
      .done()

ToiletsApp = React.createClass
  getInitialState: ->
    list: []
  componentWillMount: ->
    @ctrl = new ToiletsCtrl @
  onSelect: -> @ctrl.onSelect.apply @ctrl, arguments
  onSubmit: -> @ctrl.onSubmit.apply @ctrl, arguments
  render: -> `(
    <div>
      <header>
        <LocationInput onSubmit={this.onSubmit} />
      </header>
      <ToiletList list={this.state.list} onSelect={this.onSelect} />
    </div>
  )`

module.exports = {ToiletsApp, ToiletsCtrl}
