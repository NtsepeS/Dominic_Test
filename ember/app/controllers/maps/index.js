import Ember from 'ember';

export default Ember.ArrayController.extend({
  filterOperational: true,
  filterUnderConstruction: true,
  filterDecommissioned: true,
  filterCommissioning: true,
  filterToBeDecommissioned: true,
  filterWaitingForFieldServiceEngineerReport: true,
  filterWaitingForFieldServicesQAApproval: true,
  filterWaitingForISQAApproval: true,
  filterClientLinks: true,

  filterCollection: function() {
    return {
      "Operational": this.get('filterOperational'),
      "Under Construction": this.get('filterUnderConstruction'),
      "Decommissioned": this.get('filterDecommissioned'),
      "Commissioning": this.get('filterCommissioning'),
      "To Be Decommissioned": this.get('filterToBeDecommissioned'),
      "Waiting for Field Service Engineer Report": this.get('filterWaitingForFieldServiceEngineerReport'),
      "Waiting for Field Services QA Approval": this.get('filterWaitingForFieldServicesQAApproval'),
      "Waiting for IS QA Approval": this.get('filterWaitingForISQAApproval'),
      "ClientLinks": this.get('filterClientLinks')
    };
  }.property('model.[]', 'filterOperational','filterUnderConstruction', 'filterDecommissioned',
             'filterCommissioning', 'filterToBeDecommissioned','filterWaitingForFieldServiceEngineerReport',
             'filterWaitingForFieldServicesQAApproval', 'filterWaitingForISQAApproval', 'filterClientLinks')
});
