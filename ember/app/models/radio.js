import DS from 'ember-data';

export default DS.Model.extend({
  name:                    DS.attr('string'),
  itemCode:                DS.attr('string'),
  icasaSticker:            DS.attr('boolean'),
  modulations:             DS.hasMany('modulation', {async: true}),
  rfPerformanceParameters: DS.hasMany('rf-performance-parameters', {async: true})
});

