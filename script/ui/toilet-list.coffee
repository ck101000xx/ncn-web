`/** @jsx React.DOM */`
ToiletItem = React.createClass
  render: -> `(
    <li onClick={this.props.clicks.push}>
      {this.props.toilet.name} {this.props.toilet.address}
    </li>
  )`

ToiletList = React.createClass
  getInitialState:
    toilets: []
  componentDidMount:
    @props.toilets.onValue (ts) ->
      @setState toilets: ts
  render: ->
    items = @state.toilets.map (toilet) ->
      `<ToiletItem toilet={toilet} clicks={this.props.selects} />`
    return `(
      <ul>
        {items}
      </ul>
    )`

module.exports = {ToiletList}
