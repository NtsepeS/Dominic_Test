import Ember from 'ember';

export default Ember.ArrayController.extend({
  filterOperational: false,
  filterDecommissioned: false,
  filterCommissioning: false,
  selectedNodes: function() {
    var nodes = this.get('model');
    var filteredModel =  this.get('model');
    if (this.get('filterOperational')) {
      console.log('Im in the if!!!!');
      filteredModel =  filteredModel.filterBy('status.name', 'Operational');
    }

    // filter here
    return filteredModel;
  }.property('model.[]', 'filterOperational'),

  actions: {
    toggle: function(option) {
      this.set('filterOperational', true);
      console.log('TOGGLE!!!'+ this.get('filterOperational'));
    }
  }
});
