import DS from 'ember-data';

var SubGroupClassification = DS.Model.extend({
  name:                DS.attr('string'),
  groupClassification: DS.belongsTo('group-classification', {async: true}),
  subGroupPictureSets: DS.hasMany('sub-group-picture-set', {async: true})
});

export default SubGroupClassification;
