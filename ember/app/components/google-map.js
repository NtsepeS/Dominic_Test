import Ember from 'ember';

export default Ember.Component.extend({
  insertMap: function() {
    var container = this.$(".map-canvas"),
        coreNodes = this.get("coreNodes");

    var options = {
      center: new google.maps.LatLng(-26.1229025, 28.029034,12),
      zoom: 6,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(container[0], options);

    var decomed_image = 'assets/images/icon-outage.svg',
        active_image =  'assets/images/icon-cleared.svg',
        commissioning_image = 'assets/images/icon-threshold.svg';

    coreNodes.forEach(function(coreNode) {
      var image = null;

      switch (coreNode.get('status')) {
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

      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(coreNode.get('latitude'), coreNode.get('longitude')),
        map: map,
        icon: image,
        title: coreNode.get('name')
      });

    });

    var clienLinkCoordinates = [
      new google.maps.LatLng(-26.7217916, 27.8487259),
      new google.maps.LatLng(-26.2145598, 27.964365),
      new google.maps.LatLng(-25.7586499, 28.219682)
    ];

    var path = new google.maps.Polyline({
      path: clienLinkCoordinates,
      geodesic: true,
      strokeColor: '#FF0000',
      strokeOpacity: 1.0,
      strokeWeight: 2
    });

    path.setMap(map);
  }.on('didInsertElement')
});
