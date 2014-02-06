`/** @jsx React.DOM */`
LocationInput = React.createClass
  componentWillMount: ->
    @keys = new Bacon.Bus
    @changes = new Bacon.Bus
    @clicks = new Bacon.Bus
    enters = @keys
      .map '.keyCode'
      .filter (code) -> code is 13
    submits = @changes
      .map '.target.value'
      .toProperty()
      .smapledBy @clicks.merge enters
    @props.submits.plug submits
  render: -> `(
    <form>
      <input type="text" onChange={this.changes.push} onKeyPress={this.keys.push}></input>
      <input type="button" onClick={this.clicks.push}></input>
    </form>
  )`

module.exports = {LocationInput}
