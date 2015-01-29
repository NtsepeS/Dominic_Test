import DS from 'ember-data';

var SubGroupClassification = DS.Model.extend({
  name:                DS.attr('string'),
  groupClassification: DS.belongsTo('group-classification', {async: true})
});

SubGroupClassification.reopenClass({
  FIXTURES: [
  {
    id:                  2,
    name:                'LOS',
    groupClassification: 1
  }
  ]
});

export default SubGroupClassification;
