import SessionAuthenticator from 'cops/authenticators/session';

export default {
  name: 'authentication',
  before: 'simple-auth',

  initialize: function(container) {
    container.register('authenticator:session', SessionAuthenticator);
  }
};
