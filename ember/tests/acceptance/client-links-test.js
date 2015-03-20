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
      url: "/api/v1/client_links",
      proxy: "/mocks/client-links"
    });
  },

  afterEach: function() {
    $.mockjax.clear();
    Ember.run(application, 'destroy');
  }
});

test('visiting /client-links should show a list of links', function(assert) {
  visit('/client-links');

  andThen(function() {
    assert.equal(currentPath(), 'client-links.index');

    var links = find("table.js-client-links-table tbody tr");
    assert.equal( links.length, 1 );
    var name = links.find("td:eq(0)");
    assert.equal( name.text(), "Upington" );
  });
});

test('clicking on an entry in the client links table should navigate to the details', function(assert) {
  visit('/client-links');

  andThen(function() {
    var name = find("table.js-client-links-table tbody td:eq(0)");
    assert.equal( name.text(), "Upington" );
  });
  click("table.js-client-links-table tbody tr:eq(0)");
  andThen(function(){
    assert.equal(currentPath(), 'client-link.index');
    var heading = find("#site_information h2");
    assert.equal( heading.text(), "Site Information" );
  });
});
