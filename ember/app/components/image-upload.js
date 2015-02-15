import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function() {
    Em.assert('should have an url', this.get('url'));
    return this.$('#imageupload').fileupload({
      url: this.get('url')
    })
  },

  willDestroyElement: function() {
    return this.$('#imageupload').fileupload('destroy');
  }

})
