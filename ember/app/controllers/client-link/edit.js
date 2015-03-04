import Ember from 'ember';

export default Ember.ObjectController.extend({
  lineSpeeds: [0.25, 0.5, 0.75, 1, 1.5, 2, 3, 4 ,5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 18 ,20, 25, 30, 35, 40, 45, 50],
  serviceTypes: ['Voice (rtPS)', 'Data 1:1 (nrtPS)', 'Data 1:2 (BE Plus)', 'Broadband (BE)'],
  physicalModes: ['4QAM2/3', '4QAM', '16QAM', '64QAM'],
  addServiceFragment: false,
  addService: false,
  actions: {
    acceptChanges: function() {
      var editedClientLink      = this.get('model');
      var editedServiceFragment = this.get('model.serviceFragments');

      var _this = this;
      editedClientLink.save().then(function(clientLink) {
        clientLink.get('serviceFragments').then(function(serviceFragment){
          serviceFragment.forEach(function(serviceFragment){
            serviceFragment.save();
          });
          _this.transitionToRoute('client-link', clientLink.id);
        });
      });
    },
    removeClientLink: function(){
      var self = this;
      var clientLink = this.get('model');
      clientLink.deleteRecord();
      clientLink.save().then(function(){
        self.transitionToRoute('client-links');
      });
    },

    addServiceFragment: function() {
      // TODO: toggle
      this.set('addServiceFragment', !this.get('addServiceFragment'));
    },

    addService: function() {
      // TODO: toggle
      this.set('addService', !this.get('addService'));
    }


  }
});
