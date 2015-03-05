var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;

var Sentence = React.createClass({
  getDefaultProps: function() {
    return {
      onSubmitBlip: function() { console.log(arguments) }
    }
  },
  getInitialState: function() {
    return { submitted: false }
  },
  setFocus: function () {
    if (this.props.isActive) {
        this.refs.newBlip.getDOMNode().focus();
    }
  },
  componentDidMount: function() {
    this.setFocus();
  },
  //pass sentence and new blip to submit function
  addBlip: function(e) {

    //check if user is logged in here if not show a prompt and return

    e.preventDefault();
    this.setState({submitted: true})
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
        filter,
        stats;


    if (this.props.isActive) {
      positionClass = "active-sentence"
    } else if (this.props.isNext) {
      positionClass = "next-sentence"
    } else if (this.props.isNnext) {
      positionClass = "nnext-sentence"
    }
    if ($('.active-sentence').length == 1 && this.props.isActive && !this.state.submitted) {
      positionClass = "active-sentence enter-active-sentence"
      var self = this;
      setTimeout(function() {
        self.forceUpdate(function() { self.setFocus() });
      }, 50)
    }

    //find stats for sentence if answered from json and push them into array ["word", x%]
    if (this.props.details.answered) {
      var words = [];
          index = 0;
          index2 = 1;
          //statistics -> Object with array inside
      this.props.details.statistics.forEach(function(statistic, i) {
        var key = statistic[index];
        var value = statistic[index2];


        words.push(<li key={i} className="stats-list"><span className="stats-list-word">{key} </span>
          <span className="stats-list-percent">{value + "%"}</span> </li>);
          // index = index +1; //didn't exist
          // index2 = index2 +1;
      })

      link = "/sentences/" + this.props.details.id + "/stats";
      stats = 
      <div className="stats-list-container"><div className="stats-list-header">the rest of the world said:</div> {words} <a href={link} data-toggle="modal" data-target="#myModal" data-remote="true"><span className="nav-text-links"><span className="nav-text-links-pre">[+]</span>full stats</span></a></div>
    }

    if (this.props.isActive) {
      nextButton = <div className="next-button" onClick={this.dismissSentence}><span className="next">next</span></div>
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
        <ul>{stats}</ul>
       </div>

    )
  }
});      
