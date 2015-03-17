import DS from 'ember-data';

export default DS.Model.extend({
  name:             DS.attr('string'),
  status:           DS.belongsTo('status', { async: true }),
  city:             DS.belongsTo('city', { async: true }),
  baseStationUnits: DS.hasMany('base-station-unit', {async: true}),
  location:         DS.belongsTo('location', {async: true}),

  clientLinks: function() {
    // This returns a flattened list of clientlinks for this core-node
    var clientLinks = [],
        baseStationUnits = this.get('baseStationUnits');

    baseStationUnits.forEach( function(baseStationUnit){
      baseStationUnit.get('baseStationSectors').forEach( function(baseStationSector) {
        baseStationSector.get('clientLinks').forEach(function (clientLink){
          clientLinks.push(clientLink);
        });
      });
    });

    return clientLinks;
  }.property('baseStationUnits'),

  latitude: function() {
    return this.get('location.geometry.latitude');
  }.property('location'),

  longitude: function() {
    return this.get('location.geometry.longitude');
  }.property('location')
});
