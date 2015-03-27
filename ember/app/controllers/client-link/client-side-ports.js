import Ember from 'ember';

export default Ember.Controller.extend({
  hasPorts: false,

  _updatePortExists: function() {
    var _hasPorts = false;
    this.get('model.serviceFragments').forEach(function(serviceFragment) {
      serviceFragment.get('services').forEach(function(service) {
        if (!Ember.isEmpty(service.get('ports')))
        {
          _hasPorts = true;
        }
      });
    });

    this.set('hasPorts', _hasPorts);
  }
});
