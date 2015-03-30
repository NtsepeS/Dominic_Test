import Ember from 'ember';

export default Ember.ArrayController.extend({
  persisted: function() {
    return this.get('model').filterBy('isNew', false);
  }.property('model.@each.isLoaded')
});
