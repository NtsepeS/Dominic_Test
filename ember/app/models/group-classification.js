import DS from 'ember-data';

var GroupClassification = DS.Model.extend({
  name:                    DS.attr('string'),
  subGroupClassifications: DS.hasMany('sub-group-classifications')
});

export default GroupClassification;
