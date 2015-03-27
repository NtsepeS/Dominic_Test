import Ember from 'ember';

export default Ember.Mixin.create({
  toggleOperational: function() {
    this.$('.operational').toggleClass('is-disabled');
  }.observes('controller.filterOperational'),

  toggleUnderConstruction: function() {
    this.$('.under-construction').toggleClass('is-disabled');
  }.observes('controller.filterUnderConstruction'),

  toggleDecommissioned: function() {
    this.$('.decommissioned').toggleClass('is-disabled');
  }.observes('controller.filterDecommissioned'),

  toggleCommissioning: function() {
    this.$('.commissioning').toggleClass('is-disabled');
  }.observes('controller.filterCommissioning'),

  toggleToBeDecommissioned: function() {
    this.$('.to-be-decommissioned').toggleClass('is-disabled');
  }.observes('controller.filterToBeDecommissioned'),

  toggleWaitingForFieldServiceEngineerReport: function() {
    this.$('.waiting-for-field-service-engineer-report').toggleClass('is-disabled');
  }.observes('controller.filterWaitingForFieldServiceEngineerReport'),

  toggleWaitingForFieldServicesQAApproval: function() {
    this.$('.waiting-for-field-services-qa-approval').toggleClass('is-disabled');
  }.observes('controller.filterWaitingForFieldServicesQAApproval'),

  toggleWaitingForISQAApproval: function() {
    this.$('.waiting-for-is-qa-approval').toggleClass('is-disabled');
  }.observes('controller.filterWaitingForISQAApproval'),

  toggleClientLinks: function() {
    this.$('.client-link').toggleClass('is-disabled');
  }.observes('controller.filterClientLinks')
});
