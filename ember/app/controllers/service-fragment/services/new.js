import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';

export default Ember.Controller.extend({
  needs: "service-fragment",
  lineSpeeds: LineSpeeds,

  actions: {
    saveService: function() {
      var _this = this,
        service = this.store.createRecord('service', {
          linetag:         _this.get('newLinetag'),
          lineSpeed:       _this.get('newServiceLineSpeed'),
          vlan:            _this.get('newVlan'),
          serviceFragment: _this.get('controllers.service-fragment.model')
        });

      service.save().then( function() {
        _this.resetProperties();
        _this.transitionToRoute('service-fragment');
      });
    }
  },

  resetProperties: function() {
    this.setProperties({ newLinetag: null,
                         newServiceLineSpeed: null,
                         newVlan: null });
  }
});




