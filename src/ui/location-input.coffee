React = require('react')

LocationInput = React.createClass
  render: -> `(
    <form>
      <input type="text" onChange={this.props.onChange} placeholder={this.props.placeholder}></input>
      <input type="button" onClick={this.props.onSubmit}></input>
    </form>
  )`

module.exports = {LocationInput}
