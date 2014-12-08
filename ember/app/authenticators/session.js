import Ember from 'ember';
import Base from 'simple-auth/authenticators/base';

export default Base.extend({
  authenticate: function() {
    return Ember.$.getJSON('/api/v1/me');
  },
  restore: function() {
    return Ember.$.getJSON('/api/v1/me');
  },
  invalidate: function() {
    return Ember.$.get('/auth/sign_out');
  }
});
