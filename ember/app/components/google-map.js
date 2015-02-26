import Ember from 'ember';

export default Ember.Component.extend({
  markers: [],
  didInsertElement: function() {
    var container   = this.$(".map-canvas");

    var options = {
      center: new google.maps.LatLng(-30.3190936, 25.0385684),
      zoom: 6,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(container[0], options);
    this.set('map', map);

    this.drawMarkers();
  },

  drawMarkers: function() {
    var coreNodes   = this.get('nodes'),
        _this       = this,
        map         = this.get('map');

    coreNodes.forEach(function(coreNode) {
      _this.drawMarker(coreNode, map);
      _this.drawClientLinks(coreNode, map);
    });
  },

  redraw: function() {
    console.log('Im redrawing');
    this.clearMarkers();
    this.drawMarkers();
  }.observes('nodes.[]'),

  statusImages: function(){
    return {
      "Operational": "assets/images/icon-cleared.svg",
      "Decommissioned": "assets/images/icon-outage.svg",
      "Commissioning": "assets/images/icon-threshold.svg"
    };
  },

  statusColour: function(){
    return {
      "Decommissioned": '#F34D01',
      "Operational": '#0091D0',
      "Commissioning": '#6F266F'
    };
  },

  drawMarker: function(marker, map) {
    var image     = this.fetch(marker.get('status.name'), this.statusImages(), "assets/images/icon-outage.svg");

    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(marker.get('latitude'), marker.get('longitude')),
      map: map,
      icon: image,
      title: marker.get('name')
    });

    var markers = this.get('markers');
    markers.push(marker);
    this.set('markers', markers);

  },

  fetch: function(item, mapping_hash, default_value) {
    return mapping_hash[item] || default_value;
  },

  drawClientLinks: function(coreNode ,map) {
    var _this       = this,
        clientLinks = coreNode.get('clientLinks');

    clientLinks.forEach(function(clientLink){
      var clienLinkCoordinates = [];

      _this.drawMarker(clientLink, map);
      clienLinkCoordinates.push(new google.maps.LatLng(coreNode.get('latitude'), coreNode.get('longitude')));
      clienLinkCoordinates.push(new google.maps.LatLng(clientLink.get('latitude'), clientLink.get('longitude')));

      var path = new google.maps.Polyline({
        path: clienLinkCoordinates,
        geodesic: true,
        strokeColor: _this.fetch(clientLink.get('status.name'), _this.statusColour(), '#F34D01'),
        strokeOpacity: 0.5,
        strokeWeight: 2
      });

      path.setMap(map);
    })


  },

  clearMarkers: function() {
    console.log('clearing markers');
    var markers = this.get('markers');
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    this.set('markers', []);
  },

  willDestroyElement: function() {
    console.warn('Remove Google Map component from DOM');
  }
});
