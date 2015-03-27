import Ember from 'ember';

export default Ember.Controller.extend({
  needs: "client-link",

  presetName: false,

  actions: {
    saveRFPerformance: function() {
      var _this                  = this;
      var rfPerformanceParameter = this.get('model');

      rfPerformanceParameter.set('radio', _this.get('model.radio'));

      rfPerformanceParameter.save().then(function(){
        _this.transitionToRoute('client-link.rf-performance-parameters');
      }).catch(function() {
        console.log('one of the saves failed');
      });
    }
  }

});
