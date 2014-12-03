module OmniauthMocks

# https://github.com/intridea/omniauth/wiki/Integration-Testing
  def mock_auth_hash
    OmniAuth.config.mock_auth[:isoauth2] = auth_hash_fixture
  end

  def auth_hash_fixture
    OmniAuth::AuthHash.new({
      provider: 'isoauth2',
      uid: 'jdhghsdgagdasjgmdshgd',
      info: {
        name: 'New Test Guy',
        email: 'testguy@example.com',
        aliases: [{
          provider_id: 'test.guy',
          provider: 'ddad',
        },
        { provider_id: 'siebel.test.guy',
          provider: 'siebel',
        }
        ]
      },
      credentials: {
        token: 'kdlsgjhpdasgjnsdlkghads',
        expires_at: 1410863122
      }
    })
  end

end