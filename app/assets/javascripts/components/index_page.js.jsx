var IndexPage = React.createClass({
  render: function() {
    return (
      <div className="container">
        <section>
          <div>
            <SentenceList sentences={this.props.sentences} />
          </div>
        </section>
      </div>
    );
  }
});