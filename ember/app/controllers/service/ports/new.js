import Ember from 'ember';
import VlanTypes from 'cops/models/vlan-types';
import AcceptableFrameTypes from 'cops/models/acceptable-frame-types';

export default Ember.Controller.extend({
  needs: "service",
  vlanTypes: VlanTypes,
  acceptableFrameTypes: AcceptableFrameTypes,

  actions: {
    savePort: function() {
       var _this = this,
            port = this.store.createRecord('port', {
              vlanType:            _this.get('newVlanType'),
              acceptableFrameType: _this.get('newAcceptableFrameType'),
              defaultVlan:         _this.get('newdefaultVlan'),
              service:             _this.get('controllers.service.model')
            });

      port.save().then( function() {
        _this.resetProperties();
        _this.transitionToRoute('service');
      });
    }
  },

  resetProperties: function() {
    this.setProperties({ newVlanType: null,
                         newAcceptableFrameType: null,
                         newdefaultVlan: null });
  }
});

