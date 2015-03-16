import Ember from 'ember';

export default Ember.Mixin.create({
  toggleOperational: function() {
    this.$('.operational').toggleClass('disabled');
  }.observes('controller.filterOperational'),

  toggleUnderConstruction: function() {
    this.$('.under-construction').toggleClass('disabled');
  }.observes('controller.filterUnderConstruction'),

  toggleDecommissioned: function() {
    this.$('.decommissioned').toggleClass('disabled');
  }.observes('controller.filterDecommissioned'),

  toggleCommissioning: function() {
    this.$('.commissioning').toggleClass('disabled');
  }.observes('controller.filterCommissioning'),

  toggleToBeDecommissioned: function() {
    this.$('.to-be-decommissioned').toggleClass('disabled');
  }.observes('controller.filterToBeDecommissioned'),

  toggleWaitingForFieldServiceEngineerReport: function() {
    this.$('.waiting-for-field-service-engineer-report').toggleClass('disabled');
  }.observes('controller.filterWaitingForFieldServiceEngineerReport'),

  toggleWaitingForFieldServicesQAApproval: function() {
    this.$('.waiting-for-field-services-qa-approval').toggleClass('disabled');
  }.observes('controller.filterWaitingForFieldServicesQAApproval'),

  toggleWaitingForISQAApproval: function() {
    this.$('.waiting-for-is-qa-approval').toggleClass('disabled');
  }.observes('controller.filterWaitingForISQAApproval'),

  toggleClientLinks: function() {
    this.$('.client-link').toggleClass('disabled');
  }.observes('controller.filterClientLinks')
});
