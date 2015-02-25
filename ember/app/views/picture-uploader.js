import Ember from 'ember';

export default Ember.View.extend({
  templateName: 'picture-uploader',

  didInsertElement: function() {
    var _this = this;
    _this.url = '/api/v1/pictures';

    Ember.assert('should have an url', _this.get('url'));

    return _this.$('.js-picture-upload').fileupload({
      url: _this.get('url')
    });
  },

  willDestroyElement: function() {
    return this.$('.js-picture-upload').fileupload('destroy');
  }

});
