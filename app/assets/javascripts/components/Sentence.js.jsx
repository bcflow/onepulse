var Sentence = React.createClass({
  getDefaultProps: function() {
    return {
      onSubmitBlip: function() { console.log(arguments) }
    }
  },
  //pass sentence and new blip to submit function
  addBlip: function(e) {
    e.preventDefault();
    var blipBody = this.refs.newBlip.getDOMNode().value
    this.props.onSubmitBlip(this.props.details, blipBody);
  },

  //send sentence to List to set it to dismissed
  dismissSentence: function(e) {
    e.preventDefault();
    this.props.onDismiss(this.props.details);
  },

  render: function() {  
    var phrase = this.props.details.body,
        phrase_display = phrase.split("*"),
        before = phrase_display[0],
        after = phrase_display[1],
        positionClass,
        stats;

    if (this.props.isActive) {
      positionClass = "active-sentence"
    } else if (this.props.isNext) {
      positionClass = "next-sentence"
    } else if (this.props.isNnext) {
      positionClass = "nnext-sentence"
    }

    //find stats for sentence if answered from json and push them into array ["word", x%]
    if (this.props.details.answered) {
      var words = [];
          index = 0;
          index2 = 1;
          //statistics -> Object with array inside
      this.props.details.statistics.forEach(function(statistic) {
        var key = statistic[index];
        var value = statistic[index2];


        words.push(<li key={index} className="stats-list"><span className="stats-list-word">{key} </span>
          <span className="stats-list-percent">{value + "%"}</span> </li>);
          index = index +1;
          index2 = index2 +1;
      })

      stats = <div><span className="stats-list-header">others said:</span> {words}</div>
    }

    if (this.props.isActive) {
      nextButton = <div className="next-button" onClick={this.dismissSentence}>V</div>

    }
    if (this.props.isNext) {
      nextButton = <div></div>
    }
    if (this.props.isNnext) {
      nextButton = <div></div>
    }



    return (

 
      <div className={"blipForm " + positionClass}>
        {before}

        <form onSubmit={this.addBlip}>
          <input type="text"
                 ref="newBlip" />
        </form>

        {after}
        {nextButton}
        <br/>
        <ul>{stats}</ul>

      </div>
      )
  }
});      
