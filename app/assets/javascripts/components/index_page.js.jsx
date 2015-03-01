var IndexPage = React.createClass({
  render: function() {
    return (
      <div>
        <header>
          <div className="container header">
            <h1 className="main-logo">one pulse</h1>
            <span className="main-subheader"><em>hello, world. what is on your mind?</em></span>
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