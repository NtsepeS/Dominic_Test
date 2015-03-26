import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';

export default Ember.Controller.extend({
  needs: "service-fragment",
  lineSpeeds: LineSpeeds,

  actions: {
    saveService: function() {
      var _this = this,
        service = this.store.createRecord('service', {
          linetag:         _this.get('selectedLinetag'),
          lineSpeed:       _this.get('selectedServiceLineSpeed'),
          vlan:            _this.get('selectedVlan'),
          serviceFragment: _this.get('controllers.service-fragment.model')
        });

      service.save().then( function() {
        _this.resetProperties();
        _this.transitionToRoute('service-fragment');
      });
    }
  },

  resetProperties: function() {
    this.setProperties({ selectedLinetag: null,
                         selectedServiceLineSpeed: null,
                         selectedVlan: null });
  }
});




