import Ember from 'ember';
import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin';
import config from 'cops/config/environment';

export default Ember.Controller.extend(LoginControllerMixin, {
  authenticator: "authenticator:session",
  isidLoginURL: config.isidLoginURL
});
