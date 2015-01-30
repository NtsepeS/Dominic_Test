/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp();


// Use `app.import` to add additional libraries to the generated
// output files.

app.import('bower_components/jquery/dist/jquery.js');
app.import('bower_components/bootstrap/dist/js/bootstrap.js');
app.import('bower_components/bootstrap/dist/css/bootstrap.css');
app.import('bower_components/jquery-file-upload/js/vendor/jquery.ui.widget.js');
app.import('bower_components/jquery-file-upload/js/jquery.iframe-transport.js');
app.import('bower_components/jquery-file-upload/js/jquery.fileupload.js');
app.import('bower_components/jquery-file-upload/css/jquery.fileupload.css');
app.import('bower_components/bootstrap/dist/fonts/glyphicons-halflings-regular.woff', {
  destDir: 'fonts'
});
app.import('bower_components/bootstrap/dist/fonts/glyphicons-halflings-regular.svg', {
  destDir: 'fonts'
});
app.import('bower_components/bootstrap/dist/fonts/glyphicons-halflings-regular.ttf', {
  destDir: 'fonts'
});
app.import('bower_components/bootstrap/dist/fonts/glyphicons-halflings-regular.eot', {
  destDir: 'fonts'
});
app.import('bower_components/datatables/media/js/jquery.dataTables.js');
app.import('bower_components/datatables/media/css/jquery.dataTables.css');
app.import('bower_components/datatables/media/images/sort_desc.png', {
  destDir: 'images'
});
app.import('bower_components/datatables/media/images/sort_asc.png', {
  destDir: 'images'
});
app.import('bower_components/datatables/media/images/sort_both.png', {
  destDir: 'images'
});
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.

module.exports = app.toTree();
