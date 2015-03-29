import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['client-link'],


  picturez: function() {
    var pictures = this.get('model.pictures').sortBy('dateTaken');
    return pictures;
  }.property('model.pictures.isFulfilled'),


  pic: function() {
    var pictures = this.get('model.pictures').sortBy('dateTaken');
    return pictures.get('lastObject');
  }.property('model.pictures.[]'),

  count: function(){
     return this.get('model.pictures.length');
  }.property('model.pictures.[]')

});
