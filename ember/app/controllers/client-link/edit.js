import Ember from 'ember';

export default Ember.ObjectController.extend({
  lineSpeeds: [0.25, 0.5, 0.75, 1, 1.5, 2, 3, 4 ,5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 18 ,20, 25, 30, 35, 40, 45, 50],
  serviceTypes: ['Voice (rtPS)', 'Data 1:1 (nrtPS)', 'Data 1:2 (BE Plus)', 'Broadband (BE)'],
  physicalModes: ['4QAM2/3', '4QAM', '16QAM', '64QAM'],
  addServiceFragment: false,
  addService: false,
  actions: {
    acceptChanges: function() {
      var self = this;
      var editedClientLink = self.get('model');
      editedClientLink.save().then(function(result){
        self.transitionToRoute('client-link', result.id);
      });



      // debugger

      // var editedClientLink      = self.get('model');
      // var editedServiceFragment = self.get('model.serviceFragments');
      // var promise = editedServiceFragment.save().then(function() {
      //     //editedClientLink.get('serviceFragments').pushObject(editedServiceFragment);// Add serviceFragment to clientlink.
      //     return editedClientLink.save();// Save the clientlink.
      // });
      // promise.then(function(response) {
      //   self.transitionToRoute('client-link', result.id);
      // });
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
