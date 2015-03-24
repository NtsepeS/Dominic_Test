import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    remove: function() {
      var _this = this,
          model = this.get('model');

      model.destroyRecord().then(function() {
        _this.transitionTo('authorizations.index');
      });
    }
  }
});
