import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs: "service",
  vlanTypes: ['Provider Port', 'VLAN Transparent'],
  acceptableFrameTypes: ['Tagged Only', 'Untagged Only', 'Tagged and Untagged'],
  actions: {
    savePort: function() {
      var _this = this;
      debugger
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

