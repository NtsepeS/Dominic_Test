import Ember from 'ember';

export default Ember.ObjectController.extend({
  from: function(){
    return this.get('changes.firstObject.from');
  }.property('changes.[]'),
  to: function(){
    return this.get('changes.firstObject.to');
  }.property('changes.[]')
});