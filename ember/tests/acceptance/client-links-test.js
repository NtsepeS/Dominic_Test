import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'cops/tests/helpers/start-app';

var application;

module('Acceptance: ClientLinks', {
  beforeEach: function() {
    application = startApp();
    authenticateSession();

    $.mockjax({
      url: "/api/v1/client_links/1",
      proxy: "/mocks/clients/1"
    })
  },

  afterEach: function() {
    $.mockjax.clear();
    Ember.run(application, 'destroy');
  }
});

test('visiting /client-links', function(assert) {
  visit('/client-links');

  andThen(function() {
    assert.equal(currentPath(), 'client-links');

    // Insert a real test here
  });
});
