import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('statuses');
  this.resource('client-links');
  this.resource('client-link', { path: 'client-links/:client_link_id' });
  this.resource('client-links', { path: 'client-links/new' })
});

export default Router;
