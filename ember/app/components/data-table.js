import Ember from 'ember';

export default Ember.Component.extend({

  didInsertElement: function() {
    this.initializeTable();
  },

  initializeTable: function() {
    var table = this.$('table').DataTable({
      "aaSorting": [[ 0, "desc" ]]
    });
    this.set('table', table);
  },

  willDestroyElement: function() {
    var table = this.get('table');
    if (table) {
      table.destroy();
    }
  }
});
