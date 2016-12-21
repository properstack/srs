
var Card = React.createClass({

  render: function() {
    return (
       

	  <div className="col-sm-2" key={this.props.key}>
		<div className="panel panel-default">
		  <div className="panel-body">
		    {this.props.question}
		  </div>
		  <div className="panel-body" style={{borderTop:"1px solid #eeeeee"}}>
		    {this.props.answer}
		  </div>
		</div>
	  </div>




    )
  }
});
