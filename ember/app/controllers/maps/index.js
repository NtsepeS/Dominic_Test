import Ember from 'ember';

export default Ember.ArrayController.extend({

  selectedNodes: function() {
    var nodes = this.get('model');

    // filter here
    return nodes;
  }.property('model.[]'),

  actions: {
    toggle: function(option) {
      var filteredModel =  this.get('model').filterBy('status.name', option);
    }
  }
});
