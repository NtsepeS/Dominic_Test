import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function() {
    Em.assert('should have an url', this.get('url'));
    return this.$('#imageupload').fileupload({
      formData: {client_link_id: this.id},
      url: this.get('url'),
      progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .bar').css('width', progress + '%');
        $('#progress .bar').text(progress + '%');
      },
      done: function(e, data){
        // debugger
        console.log(data.result)
      }
    })
  },

  willDestroyElement: function() {
    return this.$('#imageupload').fileupload('destroy');
  }

})
