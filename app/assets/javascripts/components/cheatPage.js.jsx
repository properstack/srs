var CheatPage = React.createClass({
  
  getInitialState: function() {
    return {value: '', cards: []}
  },

  newArray: function(string) {
		var newArray = [];
    var cardArray = this.props.cards
		for(var i = 0; i < cardArray.length; i++) {
		    if (cardArray[i].question.indexOf(string) != -1 || cardArray[i].answer.indexOf(string) != -1) {
		        newArray.push(cardArray[i])
		    }
		}
		return newArray
  },

  handleChange: function(event) {  
    this.setState({value: event.target.value}, function() {

      if (this.state.value!="") {
        this.setState({cards: this.newArray(this.state.value) })
	      this.searchClass = "form-control input-sm"
	      this.searchStyles.marginTop = 0
	      this.searchStyles = {margin:"0 auto",cursor: "auto",textAlign:"center",maxWidth:"300px"}
	    } else {
	      this.setState({cards:[]})
	      this.searchClass = "form-control"
	      this.searchStyles = {padding: "8px 10px", borderRadius:3, boxShadow: "rgba(0, 0, 0, 0.498039) 1px 1px 4px",margin:"0 auto",cursor: "auto",textAlign:"center",maxWidth:"350px", marginTop:220}
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