import Ember from 'ember';

export default Ember.Component.extend({
  markers: [],
  paths: [],
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
        map         = this.get('map'),
        filters     = this.get('filters');

    coreNodes.forEach(function(coreNode) {
      if (_this.shouldDraw(coreNode)){
        _this.drawMarker(coreNode, map, true);
        if (filters.ClientLinks) {
          _this.drawClientLinks(coreNode, map);
        }
      }
    });
  },

  shouldDraw: function(coreNode){
    var filters     = this.get('filters');
    return filters[coreNode.get('status.name')];
  },

  redraw: function() {
    this.clearMarkers();
    this.drawMarkers();
  }.observes('nodes.[]','filters'),

  drawMarker: function(node, map, isCoreNode) {
    var image     = this.getImage(node, isCoreNode);

    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(node.get('latitude'), node.get('longitude')),
      map: map,
      icon: image,
      title: node.get('name')
    });

    var markers = this.get('markers');
    markers.push(marker);
    this.set('markers', markers);
  },

  getImage: function(node, isCoreNode) {
    //OPTIONAL PARAMATERS!!!!
    if (isCoreNode) {
      return node.get('status.getCoreNodeStatusImage');
    }
    else {
      return node.get('status.getStatusImage');
    }
  },

  drawClientLinks: function(coreNode ,map) {
    var _this       = this,
        clientLinks = coreNode.get('clientLinks');

    clientLinks.forEach(function(clientLink){
      var clienLinkCoordinates = [];

      _this.drawMarker(clientLink, map, false);
      clienLinkCoordinates.push(new google.maps.LatLng(coreNode.get('latitude'), coreNode.get('longitude')));
      clienLinkCoordinates.push(new google.maps.LatLng(clientLink.get('latitude'), clientLink.get('longitude')));

      var path = new google.maps.Polyline({
        path: clienLinkCoordinates,
        geodesic: true,
        strokeColor: clientLink.get('status.getColour'),
        strokeOpacity: 0.5,
        strokeWeight: 2
      });

      var paths = _this.get('paths');
      paths.push(path);
      _this.set('paths', paths);

      path.setMap(map);
    });
  },

  clearMarkers: function() {
    var markers = this.get('markers');
    markers.forEach( function(marker) {
      marker.setMap(null);
    });
    this.set('markers', []);

    var paths = this.get('paths');
    paths.forEach( function(path) {
      path.setMap(null);
    });
    this.set('paths', []);
  },

  willDestroyElement: function() {
    console.warn('Remove Google Map component from DOM');
  }
});
