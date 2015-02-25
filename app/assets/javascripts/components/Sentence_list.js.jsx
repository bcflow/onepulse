var SentenceList = React.createClass({

  render: function() {
    var sentences = [];

    this.props.sentences.forEach(function(sentence) {
      sentences.push(<Sentence key={sentence.id}
                               body={sentence.body} />)
    });

    return (
      <div>{sentences}</div>
    )
  }
});


      // sentences.push(<Sentence key={sentence.body}
      //                  details={sentence} />)