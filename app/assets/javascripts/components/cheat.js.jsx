
var Cheat = React.createClass({

  render: function() {
    
    var allCards = this.props.cards.map(function(card, i) {
      return <Card key={'card_' + i} answer={card.answer} question={card.question} />
    });

    return (

      <div>
        {allCards}
      </div>

    )
  }
});
