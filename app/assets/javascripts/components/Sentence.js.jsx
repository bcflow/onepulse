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
    this.props.onSubmitBlip(this.props.details, blipBody);
  },

  render: function() {  
    var phrase = this.props.details.body,
        phrase_display = phrase.split("*"),
        before = phrase_display[0],
        after = phrase_display[1],
        positionClass;

    if (this.props.isActive) {
      positionClass = "active-sentence"
    } else if (this.props.isNext) {
      positionClass = "next-sentence"
    } else if (this.props.isNnext) {
      positionClass = "nnext-sentence"
    }


    return (
      <div className={"blipForm " + positionClass}>
        {before}

        <form onSubmit={this.addBlip}>
          <input type="text"
                 ref="newBlip" />
        </form>

        {after}
      </div>
      )
  }
});      
