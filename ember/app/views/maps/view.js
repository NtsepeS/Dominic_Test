import Ember from 'ember';

export default Ember.View.extend({
  toggleOperational: function() {
    $('.operational').toggleClass('disabled');
  }.observes('controller.filterOperational'),

  toggleUnderConstruction: function() {
    $('.under-construction').toggleClass('disabled');
  }.observes('controller.filterUnderConstruction'),

  toggleDecommissioned: function() {
    $('.decommissioned').toggleClass('disabled');
  }.observes('controller.filterDecommissioned'),

  toggleCommissioning: function() {
    $('.commissioning').toggleClass('disabled');
  }.observes('controller.filterCommissioning'),

  toggleToBeDecommissioned: function() {
    $('.to-be-decommissioned').toggleClass('disabled');
  }.observes('controller.filterToBeDecommissioned'),

  toggleWaitingForFieldServiceEngineerReport: function() {
    $('.waiting-for-field-service-engineer-report').toggleClass('disabled');
  }.observes('controller.filterWaitingForFieldServiceEngineerReport'),

  toggleWaitingForFieldServicesQAApproval: function() {
    $('.waiting-for-field-services-qa-approval').toggleClass('disabled');
  }.observes('controller.filterWaitingForFieldServicesQAApproval'),

  toggleWaitingForISQAApproval: function() {
    $('.waiting-for-is-qa-approval').toggleClass('disabled');
  }.observes('controller.filterWaitingForISQAApproval'),

  toggleClientLinks: function() {
    $('.client-link').toggleClass('disabled');
  }.observes('controller.filterClientLinks')
});
