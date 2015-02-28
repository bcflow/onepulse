var SentenceList = React.createClass({
  getInitialState: function() {
    return {
      sentences: this.props.sentences
    }
  },

  addBlip: function(sentence, value) {
    var i = this.state.sentences.indexOf(sentence),
        sentences = this.state.sentences,
        self = this;

    $.post(
      '/sentences/' + sentence.id + '/blips',
       {blip: {body: value}},
       function(response) {
         sentences[i].answered = true;
         self.setState({sentences: sentences});
       });
  },
 
  topThreeUnansweredSentences: function() {
    var unanswered = _.where(this.state.sentences, {answered: false}); 
    return unanswered.slice(0, 3);
  },

  render: function() {
    var unanswered = this.topThreeUnansweredSentences(),
        sentences = [],
        index = 0;


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
