import DS from 'ember-data';

export default DS.Model.extend({
  uplinkRssi:         DS.attr('number'),
  downlinkRssi:       DS.attr('number'),
  uplinkCnr:          DS.attr('number'),
  downlinkCnr:        DS.attr('number'),
  txPower:            DS.attr('number'),
  stepAttenuator:     DS.attr('number'),
  radio:              DS.belongsTo('radio', {async: true})
});
