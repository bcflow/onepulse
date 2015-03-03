var IndexPage = React.createClass({
  render: function() {
    return (
      <div className="container">
        <div className="main-logo">onepulse</div>
        <div className="header col-md-12">
        <div className="main-subheader col-md-4">&nbsp;</div>
        <div className="main-subheader col-md-4">hello, world. what is on your mind?</div>  
        <div className="main-menu col-md-4"><span className="nav-text-links"><a rel="leanModal" name="login" href="#login"><span className="nav-text-links-pre">[+]</span>login/signup </a>
        <a rel="leanModal" name="login" href="#login"><span className="nav-text-links-pre">[+]</span>how this works</a></span>
          </div>
        </div>
        <section>
          <div className="container">
            <SentenceList sentences={this.props.sentences} />
          </div>
        </section>
      </div>
    );
  }
});