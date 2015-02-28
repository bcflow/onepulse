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
        //why do we need to do this?
        self = this;

    $.post(
      '/sentences/' + sentence.id + '/blips',
       {blip: {body: value}},
       //set sentence we blipped into as answered
       //reset state to reload sentences state after post
       function(response) {
         sentences[i].answered = true;
         self.setState({sentences: sentences});
       });
  },
  //list unanswered sentences and take out the first 3 for display
  topThreeUnansweredSentences: function() {
    var unanswered = _.where(this.state.sentences, {answered: false}); 
    return unanswered.slice(0, 3);
  },

  render: function() {
    var unanswered = this.topThreeUnansweredSentences(),
        sentences = [],
        index = 0;

    //loop through sentences until we have 3 loaded    
    while (index <= (unanswered.length - 1)) {
      var sentence = unanswered[index];
      sentences.push(
        <Sentence key={sentence.id}
                  isActive={index == 0}
                  isNext={index == 1}
                  isNnext={index == 2}
                  onSubmitBlip={this.addBlip}
                  details={sentence} />
      )
      index = index + 1;
    }

    
    return (
      <div>{sentences}</div>
    )
  }
});
