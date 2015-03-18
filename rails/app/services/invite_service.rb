class InviteService

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
    response = connection.post("/isid/invite", {
      email:      @email,
      invitee:    @name,
      invitor:    @from,
      system_url: system_url
    })

    json = MultiJson.load( response.body )
    @authorization.invite_id = json["id"]
  end

  def system_url
    @request.protocol + @request.host_with_port + "/users/auth/isoauth2"
  end

  def save
    @authorization.save
  end

  def connection
    @_connection ||= Faraday.new(Rails.application.secrets.SSO_SITE) do |c|
      c.request :url_encoded
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
