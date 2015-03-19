import Ember from 'ember';

export default Ember.ObjectController.extend({
  showInfo: false,
  actions: {
    updateOverview: function() {
      var _this         = this;

      this.get('model').save().then(function(result){
        _this.transitionToRoute('client-link.overview.edit', result.id);
      });
    },

    showInfo: function() {
      this.set('showInfo', true);
    }
  }
});
