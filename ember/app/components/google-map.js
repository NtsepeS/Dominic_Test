import Ember from 'ember';
/* global google */

export default Ember.Component.extend({
  classNames: "map-canvas",
  markers: [],
  paths:   [],

  didInsertElement: function() {
    this.setupMap();
    this.drawMarkers();
  },

  setupMap: function() {
    var options = {
      center: new google.maps.LatLng(-30.3190936, 25.0385684),
      zoom: 6,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(this.element, options);
    this.set('map', map);
  },

  drawMarkers: function() {
    var coreNodes   = this.get('nodes'),
        _this       = this,
        map         = this.get('map'),
        filters     = this.get('filters');

    coreNodes.forEach(function(coreNode) {
      if (_this.filterbyStatus(coreNode)){
        _this.drawMarker(coreNode, map, true);
        if (filters.ClientLinks) {
          _this.drawClientLinks(coreNode, map);
        }
      }
    });
  },

  filterbyStatus: function(coreNode){
    var filters = this.get('filters');
    return filters[coreNode.get('status.name')];
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
        strokeColor: _this.getColour(clientLink.get('status.name')),
        strokeOpacity: 0.5,
        strokeWeight: 2
      });

      var paths = _this.get('paths');
      paths.push(path);
      _this.set('paths', paths);

      path.setMap(map);
    });
  },

  drawMarker: function(node, map, isCoreNode) {
    isCoreNode    = isCoreNode || false;
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

  redraw: function() {
    this.clearMarkers();
    this.drawMarkers();
  }.observes('nodes.[]','filters'),

  getImage: function(node, isCoreNode) {
    var _this = this;
    if (isCoreNode) {
      return _this.getCoreNodeStatusImage(node.get('status.name'));
    }
    else {
      return _this.getStatusImage(node.get('status.name'));
    }
  },

  getColour: function(statusName) {
    return {
      "Operational": '#649131',
      "Under Construction": '#EEA506',
      "Decommissioned": '#D8DDE1',
      "Commissioning": '#3D96EF',
      "To Be Decommissioned": '#A50077',
      "Waiting for Field Service Engineer Report": '#DD3E00',
      "Waiting for Field Services QA Approval": '#310031',
      "Waiting for IS QA Approval": '#D2493C'
    }[statusName] || '#D8DDE1';
  },

  getStatusImage: function(statusName) {
    return {
      "Operational": 'assets/images/operational.svg',
      "Under Construction": 'assets/images/under-construction.svg',
      "Decommissioned": 'assets/images/decommissioned.svg',
      "Commissioning": 'assets/images/commissioning.svg',
      "To Be Decommissioned": 'assets/images/to-be-decommissioned.svg',
      "Waiting for Field Service Engineer Report": 'assets/images/waiting-for-field-service-engineer-report.svg',
      "Waiting for Field Services QA Approval": 'assets/images/waiting-for-field-services-qa-approval.svg',
      "Waiting for IS QA Approval": 'assets/images/waiting-for-is-qa-approval.svg'
    }[statusName] || 'assets/images/decommissioned.svg';
  },

  getCoreNodeStatusImage: function(statusName) {
    return {
      "Operational": 'assets/images/core_node_operational.svg',
      "Under Construction": 'assets/images/core_node_under_construction.svg',
      "Decommissioned": 'assets/images/core_node_decommissioned.svg'
    }[statusName] || 'assets/images/core_node_decommissioned.svg';
  },

  willDestroyElement: function() {
    console.warn('Remove Google Map component from DOM');
  }
});
