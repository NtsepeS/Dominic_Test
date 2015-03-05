import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs: ['client-link/edit'],

  actions: {
    removePicture: function() {
      var _this   = this;
      var picture = _this.get('model');
      picture.destroyRecord();
    }
  }

});
