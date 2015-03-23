import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    pictureUploaded: function(data) {
      this.store.pushPayload(data);
    }
  }
});
