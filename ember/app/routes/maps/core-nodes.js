import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      // DS.strore.findAll('core-node')
      coreNodes: [
        Ember.Object.create({ id: 1, name: 'Vanderbijlpark', latitude: -26.7217916, longitude: 27.8487259, status: "active" }),
        Ember.Object.create({ id: 2, name: 'Pretoria', latitude: -25.7586499 , longitude: 28.219682, status: "decommissioned" }),
        Ember.Object.create({ id: 3, name: 'Johannesburg', latitude: -26.2145598, longitude: 27.964365, status: "comissioning" })
      ],
      // DS.store.findAll('client-link')
      clientLinks: [
        Ember.Object.create({ name: "Pick 'n Pay", latitude: -33.9149861, longitude: 18.6560594, status: "active", coreNodeId: 3}),
        Ember.Object.create({ name: 'Wimpy', latitude: -29.8483794, longitude: 30.9924624, status: "active", coreNodeId: 3}),
        Ember.Object.create({ name: 'Steers', latitude: -28.7238759, longitude: 24.7232065, status: "active", coreNodeId: 3})
      ]
    };
  }
});
