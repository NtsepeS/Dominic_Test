import Ember from 'ember';

export default Ember.ArrayController.extend({

  selectedNodes: function() {
    var nodes = this.get('model');

    // filter here

    return nodes;
  }.property('model.[]'),

  actions: {
    test: function() {
      console.log('ACTIUON!!!!!!!!!!!!!!!');
    }
  }
});
