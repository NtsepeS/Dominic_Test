import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function() {
    Em.assert('should have an url', this.get('url'));
    return this.$('#imageupload').fileupload({
      formData: {client_link_id: this.id},
      url: this.get('url')
    })
  },

  willDestroyElement: function() {
    return this.$('#imageupload').fileupload('destroy');
  }

})
