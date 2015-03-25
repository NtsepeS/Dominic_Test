import Ember from 'ember';

export default Ember.View.extend({
  didInsertElement: function() {
    var ports = $('.js-port-table tbody tr.number-row').length;
    this.set('controller.noPorts', ports === 0);
  },

  willDestroyElement: function() {
    this.set('controller.noPorts', true);
  }
});
