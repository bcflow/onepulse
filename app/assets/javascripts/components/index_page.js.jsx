var IndexPage = React.createClass({
  render: function() {
    return (
      <div>
        <header>
          <div className="container">
          <h1>one pulse</h1>
            <em>hello, world. what is on your mind?</em>
          </div>
        </header>

        <section>
          <div className="container">
            { /* render all of the sentences */ }
            <SentenceList sentences={this.props.sentences} />
          </div>
        </section>
      </div>
    );
  }
});