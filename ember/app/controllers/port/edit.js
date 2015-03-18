import Ember from 'ember';
import VlanTypes from 'cops/models/vlan-types';
import AcceptableFrameTypes from 'cops/models/acceptable-frame-types';

export default Ember.ObjectController.extend({
  vlanTypes: VlanTypes,
  acceptableFrameTypes: AcceptableFrameTypes,
  actions: {
    updatePort: function() {
      var _this = this;
      this.get('model').save().then( function() {
        _this.transitionToRoute('port', _this.get('model.id'));
      });
    }
  }
});
