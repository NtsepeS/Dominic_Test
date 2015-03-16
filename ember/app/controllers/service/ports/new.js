import Ember from 'ember';
import VlanTypes from 'cops/models/vlan-types';
import AcceptableFrameTypes from 'cops/models/acceptable-frame-types';

export default Ember.ObjectController.extend({
  needs: "service",
  vlanTypes: VlanTypes,
  acceptableFrameTypes: AcceptableFrameTypes,
  actions: {
    savePort: function() {
       var port = this.store.createRecord('port', {
          vlanType: this.get('newVlanType'),
          acceptableFrameType: this.get('newAcceptableFrameType'),
          defaultVlan: this.get('newdefaultVlan'),
          service: this.get('controllers.service.model')
        });

        port.save().then(
          this.transitionToRoute('service')
        );
    }
  }
});

