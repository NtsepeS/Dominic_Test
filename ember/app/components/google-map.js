import Ember from 'ember';

export default Ember.Component.extend({
  insertMap: function() {
    var container   = this.$(".map-canvas"),
        coreNodes   = this.get('model'),
        _this       = this;

    var options = {
      center: new google.maps.LatLng(-30.3190936, 25.0385684),
      zoom: 6,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(container[0], options);

    coreNodes.forEach(function(coreNode) {
      _this.drawMarker(coreNode, map);
      _this.drawClientLinks(coreNode, map);
    });

  }.on('didInsertElement'),

  drawMarker: function(marker, map) {
    var image     = this.determineStatusImage(marker.get('status.name'));

    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(marker.get('latitude'), marker.get('longitude')),
      map: map,
      icon: image,
      title: marker.get('name')
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
        _this       = this,
        clientLinks = coreNode.get('clientLinks');

    clientLinks.forEach(function(clientLink){
      _this.drawMarker(clientLink, map);
      clienLinkCoordinates.push(new google.maps.LatLng(coreNode.get('latitude'), coreNode.get('longitude')));
      clienLinkCoordinates.push(new google.maps.LatLng(clientLink.get('latitude'), clientLink.get('longitude')));
    })

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
