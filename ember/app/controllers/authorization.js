import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    remove: function() {
      var _this = this,
          model = this.get('model'),
          flash = Ember.get(this, "flashes");

      model.destroyRecord().then(function() {
        flash.success("Authorization has been removed.");
        _this.transitionTo('authorizations.index');
      });
    }
  }
});
