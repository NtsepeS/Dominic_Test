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
  });
  this.route('admin', function(){
    this.route('authorization', function(){
      this.route('add');
      this.route('view', { path: 'view/:userId' })
    });
  });
});

export default Router;
