import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['client-link'],

  clientLinkId:          Ember.computed.alias('controllers.client-link.id'),
  groupClassificationId: Ember.computed.alias('model.groupClassification.id'),

  subGroupPictureSets: function() {
    var clientLink = this.get('controllers.client-link'),
         pictureSetsRelation = this.get('model.subGroupPictureSets'),
         pictureSets = [];

    pictureSetsRelation.then(function(sets) {
      var ours = sets.filterBy('clientLink.id', clientLink.get('id'));
      return pictureSets.setObjects( ours );
    });

    return pictureSets;
  }.property('model.subGroupPictureSets.isFulfilled'),

  subGroupPictureSet: function() {
    return this.get('subGroupPictureSets.firstObject');
  }.property('subGroupPictureSets.[]')
});
