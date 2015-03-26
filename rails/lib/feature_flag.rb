require 'singleton'

# Simple feature flags/toggles powered by environment variables.
#
# Checking for a feature:
#
#     FeatureFlag.enabled? 'awesome-sauce'
#
# will check for ENV["FEATURE_AWESOME_SAUCE"] being set and true.
class FeatureFlag
  include Singleton

  # Pass in a string or symbol to be checked against an environment
  # variable:
  #
  #     :name => FEATURE_NAME
  #     'foo-bar' => FEATURE_FOO_BAR
  def self.enabled?( feature )
    instance.enabled?( feature )
  end

  def enabled?( feature )
    suffix = feature.to_s.underscore.upcase
    key = "FEATURE_#{suffix}"

    self[ key ] == "true"
  end

  def []( key )
    ENV[ key ].to_s
  end

end
