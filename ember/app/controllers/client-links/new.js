import Ember from 'ember';
import SaveClienLink from 'cops/mixins/save-client-link';

export default Ember.ObjectController.extend(SaveClienLink, {
  showWarning: false,

  saveModel: function() {
    var _this         = this;
    this.get('model').save().then(function(result){
      _this.transitionToRoute('client-link.overview.edit', result.id);
    });
  },

  actions: {
    updateOverview: function() {
      this.saveAssociated();
    },

    showWarning: function() {
      this.set('showWarning', true);
    }
  }
});
