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
    client_links: [clientLink(
    {
      branch: "Adcorp",
      client_id: 1
    })],
    clients:[
    {
      id: 1,
      name: "Upington"
    }]
  }));

  visit('/client-links');

  andThen(function() {
    assert.equal(currentPath(), 'client-links.index');

    var links = find(".c-client-link-list-item");
    assert.equal( links.length, 1 );
    var name = links.find(".c-client-link-list-item__name");
    assert.equal( name.text(), "Upington - Adcorp" );
  });
});

test('clicking on an entry in the client links table should navigate to the details', function(assert) {
  server.get('/api/v1/client_links', json(200, {
    client_links: [clientLink(
    {
      branch: "Adcorp",
      client_id: 1
    })],
    clients:[
    {
      id: 1,
      name: "Upington"
    }]
  }));

  visit('/client-links');

  andThen(function() {
    var name = find(".c-client-link-list-item__name:eq(0)");
    assert.equal( name.text(), "Upington - Adcorp" );
  });
  click(".c-client-link-list-item:eq(0)");
  andThen(function(){
    assert.equal(currentPath(), 'client-link.overview.index');
    var heading = find(".c-index-overview h2");
    assert.equal( heading.text(), "Overview" );
  });
});


test('clinking on add new client link should navigate to the new client link page', function(assert) {
  server.get('/api/v1/client_links', json(200, {
    client_links: [clientLink(
    {
      branch: "Adcorp",
      client_id: 1
    })],
    clients:[
    {
      id: 1,
      name: "Upington"
    }]
  }));

  server.get('/api/v1/link_types', json(200,
    {link_types:[{id:1, name:"Normal"}]}
  ));

  server.get('/api/v1/base_station_sectors', json(200,
    {base_station_sectors:[{id:1,name:"Sector 1"}]}
  ));

  server.get('/api/v1/antennas', json(200,
    {antennas:[{id:1,size:"30cm",item_code:"abc",location_id:1,equipment_id:null}]}
  ));

  server.get('/api/v1/network_operators', json(200,
    {network_operators: [{ id: 1, name: "Internet Solutions"}]}
  ));

  server.get('/api/v1/clients', json(200,
    {clients: [{id: 1,name: "Bridgestone"}]}
  ));

  server.get('/api/v1/statuses', json(200,
    {statuses:[{id:1, name:"Operational"}]}
  ));

  visit('/client-links');

  click('.qa-add-client-link');

  andThen(function() {
    assert.equal(currentPath(), 'client-links.new');
  });
});


test('clinking on save client link should navigate to the new client link edit page', function(assert) {
  server.get('/api/v1/client_links', json(200, {
    client_links: [clientLink(
    {
      branch: "Adcorp",
      client_id: 1
    })],
    clients:[
    {
      id: 1,
      name: "Upington"
    }]
  }));

  server.get('/api/v1/link_types', json(200,
    {link_types:[{id:1, name:"Normal"}]}
  ));

  server.get('/api/v1/base_station_sectors', json(200,
    {base_station_sectors:[{id:1,name:"Sector 1"}]}
  ));

  server.get('/api/v1/antennas', json(200,
    {antennas:[{id:1,size:"30cm",item_code:"abc",location_id:1,equipment_id:null}]}
  ));

  server.get('/api/v1/network_operators', json(200,
    {network_operators: [{ id: 1, name: "Internet Solutions"}]}
  ));

  server.get('/api/v1/clients', json(200,
    {clients: [{id: 1,name: "Bridgestone"}]}
  ));

  server.get('/api/v1/statuses', json(200,
    {statuses:[{id:1, name:"Operational"}]}
  ));

  visit('/client-links/new');

  andThen(function() {
    fillIn('.clientlink__branch', 'Happy branch');
    fillIn('.clientlink__client', 'Upington');
    assert.equal(currentPath(), 'client-links.new');
  });

  server.post('/api/v1/client_links', json(200,
    {"client_link":{"id":16,"name":null,"branch":"Happy branch","circuit_number":null,"mac_address":null,"msad_number":null,"activation_date":null,"distance":null,"solution_identifier":null,"billing_account":null,"service_account":null,"service_account_site":null,"created_at":"2015-03-31T08:46:17.191Z","updated_at":"2015-03-31T08:46:17.191Z","client_id":1,"link_type_id":null,"antenna_id":null,"radio_id":null,"network_operator_id":null,"status_id":null,"album_ids":[],"service_fragment_ids":[]},"clients":[{"id":2,"name":"Adcorp","created_at":"2015-03-31T05:33:03.948Z","updated_at":"2015-03-31T05:33:03.948Z"}],"link_types":[],"antennas":[],"radios":[],"network_operators":[],"statuses":[],"albums":[],"service_fragment":[]}
  ));

  click('.qa-save');

  andThen(function() {
    assert.equal(currentPath(), 'client-link.overview.edit');
  });
});

