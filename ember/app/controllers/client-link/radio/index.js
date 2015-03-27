import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    saveRadio: function(){
      var _this = this;
      var radio = _this.store.createRecord('radio', {});

      radio.save().then(function(){
        var clientLink = _this.get('model');
        clientLink.set('radio', radio);
        clientLink.save();
      });
    }
  }
});
