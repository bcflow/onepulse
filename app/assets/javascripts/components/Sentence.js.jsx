var Sentence = React.createClass({
  getInitialState: function() {
    return {
      //body: this.props.body
    }
  },

  render: function() { 
    return (
      <div className="container">
        {this.props.body}  // add input field
      </div>
      )
  }
});