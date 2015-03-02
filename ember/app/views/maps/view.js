import Ember from 'ember';

export default Ember.View.extend({
  filterOperational: Ember.computed.alias('controller.filterOperational'),
  filterUnderConstruction: Ember.computed.alias('controller.filterUnderConstruction'),
  filterDecommissioned: Ember.computed.alias('controller.filterDecommissioned'),
  filterCommissioning: Ember.computed.alias('controller.filterCommissioning'),
  filterToBeDecommissioned: Ember.computed.alias('controller.filterToBeDecommissioned'),
  filterWaitingForFieldServiceEngineerReport: Ember.computed.alias('controller.filterWaitingForFieldServiceEngineerReport'),
  filterWaitingForFieldServicesQAApproval: Ember.computed.alias('controller.filterWaitingForFieldServicesQAApproval'),
  filterWaitingForISQAApproval: Ember.computed.alias('controller.filterWaitingForISQAApproval'),
  filterClientLinks: Ember.computed.alias('controller.filterClientLinks'),

  toggleOperational: function() {
    $('.operational').toggleClass('disabled');
  }.observes('filterOperational'),

  toggleUnderConstruction: function() {
    $('.under-construction').toggleClass('disabled');
  }.observes('filterUnderConstruction'),

  toggleDecommissioned: function() {
    $('.decommissioned').toggleClass('disabled');
  }.observes('filterDecommissioned'),

  toggleCommissioning: function() {
    $('.commissioning').toggleClass('disabled');
  }.observes('filterCommissioning'),

  toggleToBeDecommissioned: function() {
    $('.to-be-decommissioned').toggleClass('disabled');
  }.observes('filterToBeDecommissioned'),

  toggleWaitingForFieldServiceEngineerReport: function() {
    $('.waiting-for-field-service-engineer-report').toggleClass('disabled');
  }.observes('filterWaitingForFieldServiceEngineerReport'),

  toggleWaitingForFieldServicesQAApproval: function() {
    $('.waiting-for-field-services-qa-approval').toggleClass('disabled');
  }.observes('filterWaitingForFieldServicesQAApproval'),

  toggleWaitingForISQAApproval: function() {
    $('.waiting-for-is-qa-approval').toggleClass('disabled');
  }.observes('filterWaitingForISQAApproval'),

  toggleClientLinks: function() {
    $('.client-link').toggleClass('disabled');
  }.observes('filterClientLinks')
});
