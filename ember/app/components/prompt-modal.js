import Ember from 'ember';
import layout from '../templates/components/prompt-modal';

export default Ember.Component.extend({
  layout: layout,
  actions: {
    deleteItem: function() {
      this.sendAction();
    }
  },

  willDestroyElement: function() {
    $('.modal-backdrop').remove();
  }
});
