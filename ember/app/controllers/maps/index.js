import Ember from 'ember';

export default Ember.ArrayController.extend({
  filterOperational: true,
  filterDecommissioned: true,
  filterCommissioning: true,
  filterClientLinks: true,

  filterCollection: function() {
    return {
      "Operational": this.get('filterOperational'),
      "Decommissioned": this.get('filterDecommissioned'),
      "Commissioning": this.get('filterCommissioning'),
      "ClientLinks": this.get('filterClientLinks')
    }
  }.property('model.[]', 'filterOperational','filterDecommissioned', 'filterCommissioning', 'filterClientLinks')
});
