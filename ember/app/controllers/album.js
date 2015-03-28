import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['client-link'],


  pictures: function() {
    var clientLink = this.get('controllers.client-link'),
         albums = this.get('model.albums'),
         pictures = this.get('model.pictures')
         pictures = pictures.sortBy('dateTaken');
    return pictures
  }.property('model.pictures.isFulfilled'),

});
