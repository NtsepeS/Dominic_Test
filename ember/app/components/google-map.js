import Ember from 'ember';

export default Ember.Component.extend({
  insertMap: function() {
    var container   = this.$(".map-canvas"),
        coreNodes   = this.get("coreNodes"),
        clientLinks = this.get("clientLinks"),
        _this       = this;

    var options = {
      center: new google.maps.LatLng(-26.1229025, 28.029034,12),
      zoom: 6,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(container[0], options);

    coreNodes.forEach(function(coreNode) {
      _this.drawCoreNode(coreNode, map);
    });

    _this.drawClientLinks(clientLinks, map);
  }.on('didInsertElement'),

  drawCoreNode: function(coreNode, map) {
    var image = this.determineStatusImage(coreNode.get('status'));
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(coreNode.get('latitude'), coreNode.get('longitude')),
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
      case "active":
        image = active_image;
        break;
      case "decommissioned":
        image = decomed_image;
        break;
      case "comissioning":
        image = commissioning_image;
        break;
      default:
        image = decomed_image;
        break;
    }
    return image;
  },

  drawClientLinks: function(clientLinks ,map) {
    // clientLinks = this.get("clientLinks"); // THIS NEEDS TO BE FETECHED FROM MODELS

    var clienLinkCoordinates = [];

    debugger

    clientLinks.forEach(function(clientLink) {
      clienLinkCoordinates.push(new google.maps.LatLng(clientLink.get('latitude'), clientLink.get('longitude')));
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
