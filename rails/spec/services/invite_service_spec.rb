require "rails_helper"

RSpec.describe InviteService do
  it "should send an invite" do
    connection = Faraday.new do |builder|
      builder.adapter :test do |stubs|
        params = {
          email: "admin@mailinator.com",
          invitee: "Joe",
          invitor: "Jill",
          system_url: "http://cops.dev/users/auth/isoauth2"
        }
        response = {
          invite_id: "1"
        }.to_json
        stubs.post("/isid/invite", params) { |env|
          [ 200, {}, response ]
        }
      end
    end

    allow(subject).to receive(:connection).and_return(connection)

    subject.call( "admin", "admin@mailinator.com", "Joe", "Jill" )
  end

  it "should create an authorization"
end
