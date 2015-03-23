import Ember from 'ember';
import layout from '../templates/components/alert-message';

export default Ember.Component.extend({
  layout: layout,
  classNames: ['alert'],
  classNameBindings: ['alertType'],
  alertType: "content.alertType"
});
