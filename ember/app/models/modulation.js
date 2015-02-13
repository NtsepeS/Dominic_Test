import DS from 'ember-data';

export default DS.Model.extend({
  uplinkMax:         DS.attr('number'),
  downlinkMax:       DS.attr('number'),
  uplinkMin:         DS.attr('number'),
  downlinkMin:       DS.attr('number'),
});
