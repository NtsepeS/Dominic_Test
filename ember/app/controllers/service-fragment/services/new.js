import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';

export default Ember.ObjectController.extend({
  needs: "service-fragment",
  lineSpeeds: LineSpeeds,
  actions: {
    saveService: function() {
      var service = this.store.createRecord('service', {
        linetag: this.get('newLinetag'),
        lineSpeed: this.get('newServiceLineSpeed'),
        vlan: this.get('newVlan'),
        serviceFragment: this.get('controllers.service-fragment.model')
      });

      service.save().then(
        this.transitionToRoute('service-fragment')
      );
    }
  }
});




