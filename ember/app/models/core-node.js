import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  city: DS.attr('string'),
  status: DS.belongsTo('status', { async: true }),
  baseStationUnit: DS.hasMany('base-station-unit', {async: true}),
  location: DS.belongsTo('location', {async: true}),

  clientLinks: function() {
    // This returns a flattened list of clientlinks for this core-node
    var clientLinks = [],
        baseStationUnits = this.get('baseStationUnit');

    baseStationUnits.forEach( function(baseStationUnit){
      baseStationUnit.get('baseStationSector').forEach( function(baseStationSector) {
        baseStationSector.get('clientLink').forEach(function (clientLink){
          clientLinks.push(clientLink);
        });
      });
    });

    return clientLinks;
  }.property('baseStationUnit'),

  latitude: function() {
    return this.get('location.geometry.latitude');
  }.property('location'),

  longitude: function() {
    return this.get('location.geometry.longitude');
  }.property('location')
});
