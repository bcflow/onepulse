var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;

var Sentence = React.createClass({
  getDefaultProps: function() {
    return {
      onSubmitBlip: function() { console.log(arguments) }
    }
  },

  addBlip: function(e) {
    e.preventDefault();
    var blipBody = this.refs.newBlip.getDOMNode().value
    //pass sentence and new blip to submit function
    this.props.onSubmitBlip(this.props.details, blipBody);
  },

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

    if (this.props.details.answered) {
      var words = [];
      this.props.details.statistics.forEach(function(statistic) {
        words.push(<div>{statistic.word}: {statistic.frequency}</div>)
      })

      stats = <div>{words}</div>
    }

    return (
      <div className={"blipForm " + positionClass}>
        {before}

        <form onSubmit={this.addBlip}>
          <input type="text"
                 ref="newBlip" />
        </form>

        {after}

        <button onClick={this.dismissSentence}>next</button>
        <br/>
        {stats}
      </div>
      )
  }
});      
