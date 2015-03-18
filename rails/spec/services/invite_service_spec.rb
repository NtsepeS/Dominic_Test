require "rails_helper"

RSpec.describe InviteService do
  let(:request) {
    double("ActionDispatch::Request", protocol: "http://", host_with_port: "cops.dev")
  }

  before(:each) do
    connection = Faraday.new do |builder|
      builder.adapter :test do |stubs|
        params = {
          email:      "admin@mailinator.com",
          invitee:    "Joe",
          invitor:    "Jill",
          system_url: "http://cops.dev/users/auth/isoauth2"
        }
        response = {
          id:     "1",
          action: "invite",
          status: "new",
          email:  "admin@mailinator.com"
        }.to_json
        stubs.post("/isid/invite", params) { |env|
          [ 200, {}, response ]
        }
      end
    end
    allow(subject).to receive(:connection).and_return(connection)
  end

  it "should create an authorization" do
    expect {
      subject.call( "admin", "admin@mailinator.com", "Joe", "Jill", request )
    }.to change {
      Authorization.count
    }.by( 1 )
  end

  it "should send an invite" do
    subject.call( "admin", "admin@mailinator.com", "Joe", "Jill", request )

    expect( Authorization.last.invite_id ).to be_present
  end

end
