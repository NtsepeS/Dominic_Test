import DS from 'ember-data';

export default DS.Model.extend({
  uplinkMax:   DS.attr('string'),
  downlinkMax: DS.attr('string'),
  uplinkMin:   DS.attr('string'),
  downlinkMin: DS.attr('string'),
  radio:       DS.belongsTo('radio', {async: true}),
});
