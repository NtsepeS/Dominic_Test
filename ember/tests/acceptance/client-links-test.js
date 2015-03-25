import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'cops/tests/helpers/start-app';
import Pretender from 'pretender';
import json from '../helpers/json';

var application, server;

module('Acceptance: ClientLinks', {
  beforeEach: function() {
    server = new Pretender();
    application = startApp();
    authenticateSession();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
    server.shutdown();
  }
});

// FactoryGirl like setup
var i = 0;
function clientLink(attrs) {
  return Ember.merge(JSON.parse(JSON.stringify({
    id: i++
  })), attrs);
}

test('visiting /client-links should show a list of links', function(assert) {
  server.get('/api/v1/client_links', json(200, {
    client_links: [
      clientLink({ name: "Upington" })
    ]
  }));

  visit('/client-links');

  andThen(function() {
    assert.equal(currentPath(), 'client-links.index');

    var links = find(".c-client-link-list-item");
    assert.equal( links.length, 1 );
    var name = links.find(".c-client-link-list-item__name");
    assert.equal( name.text(), "Upington" );
  });
});

test('clicking on an entry in the client links table should navigate to the details', function(assert) {
  server.get('/api/v1/client_links', json(200, {
    client_links: [
      clientLink({ name: "Upington" })
    ]
  }));

  visit('/client-links');

  andThen(function() {
    var name = find(".c-client-link-list-item__name:eq(0)");
    assert.equal( name.text(), "Upington" );
  });
  click(".c-client-link-list-item:eq(0)");
  andThen(function(){
    assert.equal(currentPath(), 'client-link.index');
    var heading = find("#site_information h2");
    assert.equal( heading.text(), "Site Information" );
  });
});

