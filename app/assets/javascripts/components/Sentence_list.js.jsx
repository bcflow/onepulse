var SentenceList = React.createClass({

  render: function() {
    var sentences = [];

    this.props.sentences.forEach(function(sentence) {
      sentences.push(<Sentence key={sentence.id}
                               details={sentence} />)
    });


    return (
      <div>{sentences}</div>
    )
  }
});




      // sentences.push(<Sentence key={sentence.body}
      //                  details={sentence} />)