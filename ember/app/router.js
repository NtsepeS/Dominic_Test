import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('links');
  this.route('login');
  this.route('form');
  this.route('statuses');
});

export default Router;
