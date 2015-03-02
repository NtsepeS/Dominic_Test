import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs: ['client-link/edit'],

  actions: {
    expand: function() {
      var pswpElement = document.querySelectorAll('.pswp')[0];

      // build items array

      var photoswipePictures = [];
      var pictures           = this.model.get('album.pictures');

      pictures.forEach(function(picture) {
        photoswipePictures.push({
              src: picture.get('url'),
              w: 1000,
              h: 750
            });
      });
      var items = photoswipePictures;

      // define options (if needed)
      var options = {
          // optionName: 'option value'
          // for example:
          index: 0 // start at first slide
      };

      // Initializes and opens PhotoSwipe
      var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
      gallery.init();
   }
}

});
