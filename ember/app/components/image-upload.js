import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function() {
    var self = this;
    Em.assert('should have an url', self.get('url'));

    return self.$('#imageupload').fileupload({
      disableImageResize: /Android(?!.*Chrome)|Opera/
        .test(window.navigator && navigator.userAgent),
      imageMaxWidth: 1000,
      imageMaxHeight: 1000,
      formData: {client_link_id: self.model.id},
      url: self.get('url'),

      progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .bar').css('width', progress + '%');
        $('#progress .bar').text(progress + '%');
      },

      done: function(e, data) {
        console.log(data.result)
         var width  = '100px'
         var height = '100px'
         var markdown = '<img src="' + data.result.image.url + '" width="' + width + '" height="' + height + '">';
         $('.image-section').append(markdown)
      }

    })
  },

  willDestroyElement: function() {
    return this.$('#imageupload').fileupload('destroy');
  }

})
