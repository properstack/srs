var Search = React.createClass({
	
  render: function() {


    return (
      <div class="row text-center">

        <input onChange={this.props.onChange} className={this.props.searchClass} autoFocus id="focusedInput" type="text" placeholder="Search" style={this.props.searchStyles} value={this.props.value} />

      </div>      
    )
  }
})