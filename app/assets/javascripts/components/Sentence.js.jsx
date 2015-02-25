var Sentence = React.createClass({
  getInitialState: function() {
    return {
      //
    }
  },

  addBlip: function() {
    var blipBody = this.refs.newBlip.getDOMNode().value
    var sentenceId = this.props.details.id;
    var thisSentenceComponent = this;

// Processing by BlipsController#create as JSON
//   Parameters: {"sentence_id"=>"10"}

    $.ajax({
      url: '/sentences/' + sentenceId + '/blips',
      type: 'POST',
      dataType: 'json',
      data: {blip: {body: blipBody}}
      // error: function() {
      //   alert('Could not send blip to server!')
      // }
      });
  },

  render: function() { 

    var phrase = this.props.details.body
     
      $("div").each(function() {
      $('div.blipForm').replaceWith($('div.blipForm').text().replace(/_/, 'meow'));
      });

    var phrase_display = phrase.split("_");

    
    
    return (
      <div className="blipForm">
        {phrase_display}
        <form onSubmit={this.addBlip}>
          <input type="text"
                 ref="newBlip" />
        <button>Send Message</button>
        </form>
      </div>
      )
  }
});


  // <%#= form_for [sentence, Blip.new], url: sentence_blips_path(sentence) do |f| %>
  //   <tr>
  //     <td><%#= sentence.body.gsub("_", f.text_field(:body)).html_safe %></td>
  //   <tr>
  // <% #end %>