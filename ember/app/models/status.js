import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),

  getColour: function() {
    return {
      "Operational": '#649131',
      "Under Construction": '#EEA506',
      "Decommissioned": '#D8DDE1',
      "Commissioning": '#3D96EF',
      "To Be Decommissioned": '#A50077',
      "Waiting for Field Service Engineer Report": '#DD3E00',
      "Waiting for Field Services QA Approval": '#310031',
      "Waiting for IS QA Approval": '#D2493C'
    }[this.get('name')] || [this.get('Decommissioned')];
  }.property('name'),

  getStatusImage: function() {
    return {
      "Operational": 'assets/images/operational.svg',
      "Under Construction": 'assets/images/under-construction.svg',
      "Decommissioned": 'assets/images/decommissioned.svg',
      "Commissioning": 'assets/images/commissioning.svg',
      "To Be Decommissioned": 'assets/images/to-be-decommissioned.svg',
      "Waiting for Field Service Engineer Report": 'assets/images/waiting-for-field-service-engineer-report.svg',
      "Waiting for Field Services QA Approval": 'assets/images/waiting-for-field-services-qa-approval.svg',
      "Waiting for IS QA Approval": 'assets/images/waiting-for-is-qa-approval.svg'
    }[this.get('name')] || 'assets/images/decommissioned.svg';
  }.property('name'),

  getCoreNodeStatusImage: function() {
    return {
      "Operational": 'assets/images/core_node_operational.svg',
      "Under Construction": 'assets/images/core_node_under_construction.svg',
      "Decommissioned": 'assets/images/core_node_decommissioned.svg'
    }[this.get('name')] || 'assets/images/core_node_decommissioned.svg';
  }.property('name')
});
