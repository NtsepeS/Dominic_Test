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

    this.route('radio', function() {
      this.route('edit');
      this.route('new');
    });

    this.route('modulations', { path: 'radio/modulation'}, function() {
      this.route('new');
    });

    this.resource('modulation', { path: 'radio/modulation/:modulation_id' }, function() {
      this.route('edit');
    });

    this.route('rf-performance-parameters', { path: 'radio/rf-performance' }, function() {
      this.route('new');
    });

    this.resource('rf-performance-parameter', { path: 'radio/rf-performance/:rf_performance_parameter_id' }, function() {
      this.route('edit');
    });

    this.route('albums', function(){
      this.route('edit')
    });
    });

    this.route('quality-assurance', function() {
    });

    this.route('notes', function() {
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

  this.resource('admin', function(){
    this.resource('authorizations', function() {
      this.resource('authorization', { path: ':id' });
      this.route('new');
    });
  });

});

export default Router;
