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

    this.route('site-information');
    this.route('siebel');
    this.route('service-fragments');
    this.resource('service-fragments', { path: 'service-fragments/:service_fragment_id' }, function() {
      this.route('edit');


      this.route('services');
      this.resource('service', { path: 'services/:service_id' }, function() {
        this.route('edit');
        this.route('ports');
        this.resource('port', { path: 'ports/:port_id' }, function() {

        });
      });
    });
  });
});

export default Router;
