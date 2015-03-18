import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.resource('client-links', function(){
    this.route('new');
  });
  this.resource('client-link', { path: 'client-links/:clientLinkId' }, function(){
    this.route('edit');
    this.route('audit');

    this.route('overview', function() {
      this.route('edit');
    });

    this.route('client-side-ports');

    this.route('service-fragments', function() {
      this.route('new');
    });

    this.resource('service-fragment', { path: 'service-fragments/:service_fragment_id' }, function() {
      this.route('edit');

      this.route('services', function() {
        this.route('new');
      });

      this.resource('service', { path: 'services/:service_id' }, function() {
        this.route('edit');

        this.route('ports', function() {
          this.route('new');
        });

        this.resource('port', { path: 'ports/:port_id' }, function() {
          this.route('edit');
        });

      });

    });
  });
  this.resource('maps', { path: 'maps/core-nodes/' }, function() {
    this.route('view' , { path: ':coreNodeId' });
  });
});

export default Router;
