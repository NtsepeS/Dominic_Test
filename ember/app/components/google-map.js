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

    coreNodes.forEach(function(coreNode) {
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(coreNode.get('latitude'), coreNode.get('longitude')),
        map: map,
        title: coreNode.get('name')
      });
    });
  }.on('didInsertElement')
});
