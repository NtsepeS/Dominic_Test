import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      locations: [
        Ember.Object.create({ name: 'Vanderbijlpark', latitude: -26.7217916, longitude: 27.8487259 }),
        Ember.Object.create({ name: 'Pretoria', latitude: -25.7586499 , longitude: 28.219682 }),
        Ember.Object.create({ name: 'Johannesburg', latitude: -26.2145598, longitude: 27.964365 })
      ]
    };
  }
});
