import Ember from 'ember';

export default Ember.ObjectController.extend({
  vlanTypes: ['Provider Port', 'VLAN Transparent'],
  acceptableFrameTypes: ['Tagged Only', 'Untagged Only', 'Tagged and Untagged'],
  actions: {
    updatePort: function() {
      this.get('model').save().then(
        this.transitionToRoute('port', this.get('model.id'))
      );
    }
  }
});
