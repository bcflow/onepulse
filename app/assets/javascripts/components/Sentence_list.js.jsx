var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;


var SentenceList = React.createClass({
  getInitialState: function() {
    return {
      sentences: this.props.sentences
    }
  },
  //receives sentence and new blip from Sentence
  addBlip: function(sentence, value) {
    //see where in the loaded sentences we are
    var i = this.state.sentences.indexOf(sentence),
        sentences = this.state.sentences,
        // callback within a callback (post), the context changes inside the callback so we need to set this to self 
        self = this;

    $.post(
      '/sentences/' + sentence.id + '/blips',
       {blip: {body: value}}
       ),

    $.get(
      '/sentences/' + sentence.id,

       //set sentence we blipped into as answered
       //reset state to reload sentences state after post
       function(response) {
         sentences[i].answered = true;
         console.log(response);
         sentences[i].statistics = response;
         
         self.setState({sentences: sentences});
       });
  },

  //take in a sentence (sent from Sentence) and find current position in loaded sentences and set it to dismissed, then reload list
  dismissSentence: function(sentence) {
    var i = this.state.sentences.indexOf(sentence),
        sentences = this.state.sentences;
    
        sentences[i].dismissed = true;

        this.setState({sentences: sentences});

  },

  //list undismissed sentences and take out the first 3 for display
  topThreeRemainingSentences: function() {
    var unanswered = _.where(this.state.sentences, {dismissed: false}); 
    return unanswered.slice(0, 3);
  },

  render: function() {
    var remaining = this.topThreeRemainingSentences(),
        sentences = [],
        index = 0;

    //loop through sentences until we have 3 remaining sentences loaded    
    while (index <= (remaining.length - 1)) {
      var sentence = remaining[index];
      sentences.push(
        <Sentence key={sentence.id}
                  isActive={index == 0}
                  isNext={index == 1}
                  isNnext={index == 2}
                  onDismiss={this.dismissSentence}
                  onSubmitBlip={this.addBlip}
                  details={sentence} />
      )
      index = index + 1;
    }
    return (
      <div className="sentence-box">
        <ReactCSSTransitionGroup transitionName="animate">
        {sentences}
        </ReactCSSTransitionGroup>
      </div>
    )
  }
});
