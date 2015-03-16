import Ember from 'ember';
import VlanTypes from 'cops/models/vlan-types';
import AcceptableFrameTypes from 'cops/models/acceptable-frame-types';

export default Ember.ObjectController.extend({
  vlanTypes: VlanTypes,
  acceptableFrameTypes: AcceptableFrameTypes,
  actions: {
    updatePort: function() {
      this.get('model').save().then(
        this.transitionToRoute('port', this.get('model.id'))
      );
    }
  }
});
