var IndexPage = React.createClass({
  render: function() {
    return (
      <div>
        <section>
          <div className="container">
            <SentenceList sentences={this.props.sentences} />
          </div>
        </section>
      </div>
    );
  }
});

$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });       