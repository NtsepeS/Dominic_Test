import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    expandAlbum: function(album){
      this.transitionToRoute('album', album.id);
    }
  }
});
