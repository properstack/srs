var CheatPage = React.createClass({
  
  getInitialState: function() {
    return {value: '', cards: []}
  },

  newArray: function(string) {
	  var newArray = [];
    var cardArray = this.props.cards
		for(var i = 0; i < cardArray.length; i++) {
      
      var queryWordArray = string.split(" ")

      queryWordArray = queryWordArray.map(function(element){ return cardArray[i].question.indexOf(element) > -1 || cardArray[i].answer.indexOf(element) > -1 })

		  if ( queryWordArray.every(function(element, index, array){ return element }) ) {
		    newArray.push(cardArray[i])
		  }

		}
		return newArray
  },

  handleChange: function(event) {  
    this.setState({value: event.target.value}, function() {

      if (this.state.value.length > 2) {
        this.setState({cards: this.newArray(this.state.value) })
	      this.searchClass = "form-control input-sm"
	      this.searchStyles = {margin:"0 auto",cursor: "auto",textAlign:"center",maxWidth:"300px"}
	    } else {
	      this.setState({cards:[]})
	      this.searchClass = "form-control"
	      this.searchStyles = {padding: "8px 10px", borderRadius:3, boxShadow: "rgba(0, 0, 0, 0.498039) 1px 1px 4px",margin:"220px auto 0",cursor: "auto",textAlign:"center",maxWidth:"350px"}
	    }

    })
  },

  searchStyles : {padding: "8px 10px", borderRadius:3, boxShadow: "rgba(0, 0, 0, 0.498039) 1px 1px 4px",margin:"0 auto",cursor: "auto",textAlign:"center",maxWidth:"350px", marginTop:220},

  searchClass: "form-control",

  render: function() {
	  return (
	  <div>

        <Search searchStyles={this.searchStyles} searchClass={this.searchClass} onChange={this.handleChange} value={this.state.value} />
        <Cheat cards={this.state.cards} /> 

      </div>
	  )
	}

})