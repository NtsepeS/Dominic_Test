import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['client-link/edit'],

  actions: {
    removePicture: function() {
      var _this   = this;
      var picture = _this.get('model');
      picture.destroyRecord();
    },

    expand: function() {
      var pswpElement = document.querySelectorAll('.pswp')[0];

      // build items array with the appropriate indexes
      var photoswipePictures = [];
      var pictures           = this.model.get('album.pictures');
      var index, i = 0;

      pictures.forEach(function(picture) {
        index = i;
        picture.set('index', i);
        photoswipePictures.push({
              src: picture.get('url'),
              w:   picture.get('width'),
              h:   picture.get('height')
            });
        i++;
      });

      var items = photoswipePictures;

      // define options (if needed)
      var options = {
          index: this.model.get('index')
      };

      // Initializes and opens PhotoSwipe
      var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
      gallery.init();
    }
  }

});
