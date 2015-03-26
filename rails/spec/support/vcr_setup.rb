require 'webmock/rspec'
require 'vcr'

WebMock.allow_net_connect!

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
