import Ember from 'ember';
import SaveClienLink from 'cops/mixins/save-client-link';

export default Ember.ObjectController.extend(SaveClienLink, {
  saveModel: function() {
    var _this         = this;
    _this.get('model').save().then(function(result) {
      _this.transitionToRoute('client-link.overview', result.id);
    });
  },

  actions: {
    updateOverview: function() {
      this.saveAssociated();
    }
  }
});





