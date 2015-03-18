require "devise/test_helpers"

module Devise::TestHelpers

  # Allow us to quickly login with a factory name...
  def sign_in_with_factory( resource_or_scope, resource = nil )
    if resource_or_scope.is_a?( Symbol ) && resource.nil?
      resource_or_scope = :user
      resource = FactoryGirl.create( resource_or_scope )
    end

    sign_in_without_factory( resource_or_scope, resource )
  end

  alias_method_chain :sign_in, :factory

end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end
