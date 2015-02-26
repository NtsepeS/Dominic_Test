import Ember from 'ember';

export default Ember.ArrayController.extend({
  filterOperational: true,
  filterDecommissioned: true,
  filterCommissioning: true,


  filterCollection: function() {
    return {
      "Operational": this.get('filterOperational'),
      "Decommissioned": this.get('filterDecommissioned'),
      "Commissioning": this.get('filterCommissioning'),
    }

  }.property('model.[]', 'filterOperational','filterDecommissioned', 'filterCommissioning'),

  actions: {
    toggleOperational: function() {
      this.set('filterOperational', !this.get('filterOperational'));
    },
    toggleDecommissioned: function() {
      this.set('filterDecommissioned', !this.get('filterDecommissioned'));
    },
    toggleCommissioning: function() {
      this.set('filterCommissioning', !this.get('filterCommissioning'));
    }
  }
});
