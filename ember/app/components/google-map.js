import Ember from 'ember';

export default Ember.Component.extend({
  insertMap: function() {
    var container   = this.$(".map-canvas"),
        coreNodes   = this.get('model'),
        _this       = this;

    var options = {
      center: new google.maps.LatLng(-26.1229025, 28.029034),
      zoom: 6,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(container[0], options);

    coreNodes.forEach(function(coreNode) {
      _this.drawCoreNode(coreNode, map);
      _this.drawClientLinks(coreNode, map);
    });

  }.on('didInsertElement'),



  drawCoreNode: function(coreNode, map) {
    var image     = this.determineStatusImage(coreNode.get('status.name')),
        latitude  = coreNode.get('location.geometry.latitude'),
        longitude = coreNode.get('location.geometry.longitude');

    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(latitude, longitude),
      map: map,
      icon: image,
      title: coreNode.get('name')
    });
  },

  determineStatusImage: function(status) {
    var decomed_image = 'assets/images/icon-outage.svg',
        active_image =  'assets/images/icon-cleared.svg',
        commissioning_image = 'assets/images/icon-threshold.svg';

    var image = null;

    switch (status) {
      case "Operational":
        image = active_image;
        break;
      case "Decommissioned":
        image = decomed_image;
        break;
      case "Commissioning":
        image = commissioning_image;
        break;
      default:
        image = decomed_image;
        break;
    }
    return image;
  },

  drawClientLinks: function(coreNode ,map) {
    var clienLinkCoordinates = [],
        coreNodeLatitude  = coreNode.get('location.geometry.latitude'),
        coreNodeLongitude = coreNode.get('location.geometry.longitude');

    var baseStationUnits = coreNode.get('baseStationUnit')

    baseStationUnits.forEach( function(baseStationUnit){
      var baseStationSectors = baseStationUnit.get('baseStationSector');
      baseStationSectors.forEach( function(baseStationSector) {
        var clientLinks = baseStationSector.get('clientLink');
        clientLinks.forEach(function(clientLink){
          var latitude  = clientLink.get('antenna.location.geometry.latitude'),
              longitude = clientLink.get('antenna.location.geometry.longitude');

          clienLinkCoordinates.push(new google.maps.LatLng(coreNodeLatitude, coreNodeLongitude));
          clienLinkCoordinates.push(new google.maps.LatLng(latitude, longitude));
        })
      })
    });

    var path = new google.maps.Polyline({
      path: clienLinkCoordinates,
      geodesic: true,
      strokeColor: '#FF0000',
      strokeOpacity: 1.0,
      strokeWeight: 2
    });

    path.setMap(map);
  }
});
