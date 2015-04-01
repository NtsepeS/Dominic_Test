import DS from 'ember-data';

var SubGroupClassification = DS.Model.extend({
  name:                DS.attr('string'),
  groupClassification: DS.belongsTo('group-classification', {async: true}),
  albums:              DS.hasMany('album', {async: true})
});

export default SubGroupClassification;
