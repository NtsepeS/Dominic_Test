import Ember from 'ember';

export default Ember.View.extend({
  templateName: 'picture-uploader',

  didInsertElement: function() {
    var _this = this;
    _this.url = '/api/v1/pictures';

    Ember.assert('should have an url', _this.get('url'));

    return _this.$('.js-picture-upload').fileupload({

      formData: {
        client_link_id:              _this.get('controller.clientLinkId'),
        sub_group_classification_id: _this.get('controller.id'),
        group_classification_id:     _this.get('controller.groupClassificationId'),
      },

      url: _this.get('url'),

      done: function(e, data) {
        _this.get('controller').send("pictureUploaded", data.result);
      }

    });
  },

  willDestroyElement: function() {
    return this.$('.js-picture-upload').fileupload('destroy');
  }

});
