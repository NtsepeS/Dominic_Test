import Ember from 'ember';

export default Ember.View.extend({
  toggleOperational: function() {
    Ember.$('.operational').toggleClass('disabled');
  }.observes('controller.filterOperational'),

  toggleUnderConstruction: function() {
    Ember.$('.under-construction').toggleClass('disabled');
  }.observes('controller.filterUnderConstruction'),

  toggleDecommissioned: function() {
    Ember.$('.decommissioned').toggleClass('disabled');
  }.observes('controller.filterDecommissioned'),

  toggleCommissioning: function() {
    Ember.$('.commissioning').toggleClass('disabled');
  }.observes('controller.filterCommissioning'),

  toggleToBeDecommissioned: function() {
    Ember.$('.to-be-decommissioned').toggleClass('disabled');
  }.observes('controller.filterToBeDecommissioned'),

  toggleWaitingForFieldServiceEngineerReport: function() {
    Ember.$('.waiting-for-field-service-engineer-report').toggleClass('disabled');
  }.observes('controller.filterWaitingForFieldServiceEngineerReport'),

  toggleWaitingForFieldServicesQAApproval: function() {
    Ember.$('.waiting-for-field-services-qa-approval').toggleClass('disabled');
  }.observes('controller.filterWaitingForFieldServicesQAApproval'),

  toggleWaitingForISQAApproval: function() {
    Ember.$('.waiting-for-is-qa-approval').toggleClass('disabled');
  }.observes('controller.filterWaitingForISQAApproval'),

  toggleClientLinks: function() {
    Ember.$('.client-link').toggleClass('disabled');
  }.observes('controller.filterClientLinks')
});
