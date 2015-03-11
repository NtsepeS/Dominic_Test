import DS from 'ember-data';

export default DS.Model.extend({
  uplinkRssi:         DS.attr('string'),
  downlinkRssi:       DS.attr('string'),
  uplinkCni:          DS.attr('string'),
  downlinkCni:        DS.attr('string'),
  txPower:            DS.attr('string'),
  stepAttenuator:     DS.attr('string')
});
