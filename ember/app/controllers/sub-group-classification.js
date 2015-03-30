import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['client-link'],

  clientLinkId:          Ember.computed.alias('controllers.client-link.id'),
  groupClassificationId: Ember.computed.alias('model.groupClassification.id'),

  albums: function() {
    var clientLink = this.get('controllers.client-link'),
         pictureSetsRelation = this.get('model.albums'),
         pictureSets = [];

    pictureSetsRelation.then(function(sets) {
      var ours = sets.filterBy('clientLink.id', clientLink.get('id'));
      return pictureSets.setObjects( ours );
    });

    return pictureSets;
  }.property('model.albums.isFulfilled'),

  album: function() {
    return this.get('albums.firstObject');
  }.property('albums.[]')
});
