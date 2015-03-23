import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'cops/tests/helpers/start-app';
import Pretender from 'pretender';
import json from '../helpers/json';

var application, server;

module('Acceptance: Authorizations', {
  beforeEach: function() {
    application = startApp();
    server = new Pretender();
    authenticateSession();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
    server.shutdown();
  }
});

// FactoryGirl like setup
var i = 0;
function authorization(attrs) {
  return Ember.merge(JSON.parse(JSON.stringify({
    id: i++
  })), attrs);
}

test('visiting /admin/authorizations shows the authorizations', function(assert) {
  server.get('/api/v1/authorizations',json(200,{
    authorizations: [
      authorization({name: "Joe", email: "joe@mailinator.com"})
    ]
  }));

  visit('/admin/authorizations');

  andThen(function() {
    assert.equal(currentPath(), 'admin.authorizations.index');
    var authz = find(".c-authz-list-item");
    assert.equal(authz.length, 1);
    var name = find(".c-authz-list-item__name:eq(0)");
    assert.equal(name.text(), "Joe" );
  });
});

test('visiting /admin/authorizations/:id shows authorization details', function(assert) {
  var joe = authorization({name: "Joe", email: "joe@mailinator.com", invited_by: "Justin"});
  server.get('/api/v1/authorizations',json(200,{
    authorizations: [
      joe
    ]
  }));

  visit('/admin/authorizations');

  andThen(function() {
    assert.equal(currentPath(), 'admin.authorizations.index');
    var name = find(".c-authz-list-item__name:eq(0)");
    assert.equal(name.text(), "Joe" );
  });

  click(".c-authz-list-item__name:eq(0)");

  andThen(function(){
    assert.equal(currentPath(), 'admin.authorizations.authorization');
    var details = find(".c-authz-details");
    assert.equal(details.length,1);
    var invitedBy = find(".c-authz-details__invited-by");
    assert.equal(invitedBy.text(), "Justin");
  });
});

test('visiting /admin/authorizations/:id shows authorization details', function(assert) {
  var joe = authorization({name: "Joe", email: "joe@mailinator.com", invited_by: "Justin"});
  server.get('/api/v1/authorizations',json(200,{
    authorizations: [
      joe
    ]
  }));

  visit('/admin/authorizations/'+joe.id);

  andThen(function() {
    assert.equal(currentPath(), 'admin.authorizations.authorization');
    var name = find(".c-authz-list-item__name:eq(0)");
    assert.equal(name.text(), "Joe" );
  });

  andThen(function(){
    var details = find(".c-authz-details");
    assert.equal(details.length,1);
    var invitedBy = find(".c-authz-details__invited-by");
    assert.equal(invitedBy.text(), "Justin");
  });
});
