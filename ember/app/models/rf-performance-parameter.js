import DS from 'ember-data';

export default DS.Model.extend({
  uplinkRssi:         DS.attr('string'),
  downlinkRssi:       DS.attr('string'),
  uplinkCnr:          DS.attr('string'),
  downlinkCnr:        DS.attr('string'),
  txPower:            DS.attr('string'),
  stepAttenuator:     DS.attr('string'),
  radio:              DS.belongsTo('radio', {async: true})
});
