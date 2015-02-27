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
  }.property('name')
});
