var IndexPage = React.createClass({
  render: function() {
    return (
      <div>
        <section>
          <div>
            <SentenceList sentences={this.props.sentences} />
          </div>
        </section>
      </div>
    );
  }
});