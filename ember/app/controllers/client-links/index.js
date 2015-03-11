import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    viewClientLink: function(link) {
      var _this = this;
      _this.transitionToRoute('client-link', link.id);
    }
  }
});
