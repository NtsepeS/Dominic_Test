class InviteService
  attr_reader :errors

  def call( role, email, name, from, request )
    @role    = role
    @email   = email
    @name    = name
    @from    = from
    @request = request

    transaction do
      catch(:abort) do
        build
        send_invitation
        save
        @completed = true
      end
    end
  end

  def successful?
    !!@completed
  end

  private

  def build
    @authorization = Authorization.new(
      email:       @email,
      name:        @name,
      invited_by:  @from,
      role:        @role
    )
  end

  def send_invitation
    begin

      response = connection.post("/isid/invite", {
        email:      @email,
        invitee:    @name,
        invitor:    @from,
        system_url: system_url
      })

      json = MultiJson.load( response.body )
      @authorization.invite_id = json["id"]

    rescue Faraday::TimeoutError
      @errors = { network: "Connection timeout" }
      throw :abort
    end
  end

  def system_url
    @request.protocol + @request.host_with_port + "/users/auth/isoauth2"
  end

  def save
    @authorization.save
  end

  def connection
    @_connection ||= Faraday.new(Rails.application.secrets.SSO_SITE) do |c|
      username = Rails.application.secrets.SSO_CONSUMER_KEY
      password = Rails.application.secrets.SSO_CONSUMER_SECRET

      c.request :url_encoded
      c.request :basic_auth, username, password
      c.response :logger, Rails.logger
      c.adapter Faraday.default_adapter
    end
  end

  def transaction
    ActiveRecord::Base.transaction do
      yield

      raise ActiveRecord::Rollback unless successful?
    end
  end

end
