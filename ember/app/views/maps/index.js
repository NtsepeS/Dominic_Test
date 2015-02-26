import Ember from 'ember';

export default Ember.View.extend({
  filterOperational: Ember.computed.alias('controller.filterOperational'),
  filterDecommissioned: Ember.computed.alias('controller.filterDecommissioned'),
  filterCommissioning: Ember.computed.alias('controller.filterCommissioning'),

  toggleOperational: function() {
    $('#operational-option').toggleClass('disabled');
  }.observes('filterOperational'),
  toggleDecommissioned: function() {
    $('#decommissioned-option').toggleClass('disabled');
  }.observes('filterDecommissioned'),
  toggleCommissioning: function() {
    $('#commissioning-option').toggleClass('disabled');
  }.observes('filterCommissioning'),
});
