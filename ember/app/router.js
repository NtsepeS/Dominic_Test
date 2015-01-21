import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('statuses');
  this.resource('client-links', function(){
    this.route('new');
  });
  this.resource('client-link', { path: 'client-links/:clientLinkId' }, function(){
    this.route('edit')
  });
});

export default Router;
