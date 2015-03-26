import Ember from 'ember';

  needs: ['client-link/edit'],
export default Ember.Controller.extend({

  clientLinkId:          Ember.computed.alias('controllers.client-link/edit.id'),
  groupClassificationId: Ember.computed.alias('model.groupClassification.id'),

  subGroupPictureSets: function() {
    var clientLink = this.get('controllers.client-link/edit'),
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
