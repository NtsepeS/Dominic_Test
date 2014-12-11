import Ember from 'ember';

export default Ember.View.extend({
  templateName: 'links',

  didInsertElement : function() {
    Ember.run.scheduleOnce('afterRender', this, function(){
      this.$('.js-client-links').dataTable();
    });
  },

});
