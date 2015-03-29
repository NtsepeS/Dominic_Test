import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    pictureUploaded: function(data) {
      this.store.pushPayload(data);
    },
    expandAlbum: function(album){
      this.transitionToRoute('album', album.id)
    }
  }
});
