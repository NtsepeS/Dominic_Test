import DS from 'ember-data';

export default DS.Model.extend({
  name:         DS.attr('string'),
  itemCode:     DS.attr('string'),
  icasaSticker: DS.attr('string'),
  modulations:  DS.hasMany('modulation', {async: true}),
});
