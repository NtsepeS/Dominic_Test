import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function() {
    var self = this;
    Em.assert('should have an url', self.get('url'));

    return self.$('#imageupload').fileupload({
      disableImageResize: /Android(?!.*Chrome)|Opera/
        .test(window.navigator && navigator.userAgent),
      imageMaxWidth: 900,
      imageMaxHeight: 900,
      formData: {client_link_id: self.model.id},
      url: self.get('url'),

      progressall: function (e, data) {
        var valeur = parseInt(data.loaded / data.total * 100, 10);
        self.$('.progress-bar').css('width', valeur+'%').attr('aria-valuenow', valeur);
        // self.$('.progress .bar').css('width', progress + '%');
        self.$('.progress-bar').text(valeur + '%');
      },

      done: function(e, data) {
        console.log(data.result)
         var width  = '100px'
         var height = '100px'
         var markdown = '<img src="' + data.result.image.url + '" width="' + width + '" height="' + height + '">';
         self.$('.image-section').append(markdown)
      }

    })
  },

  willDestroyElement: function() {
    return this.$('#imageupload').fileupload('destroy');
  }

})
