import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    updateRadio: function(){
      var _this = this;

      _this.model.save().then(function(){
        _this.transitionToRoute('client-link.radio');
      });
    }
  }
});
