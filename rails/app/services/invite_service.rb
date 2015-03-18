class InviteService

  def call( role, email, name, from )
    @role  = role
    @email = email
    @name  = name
    @from  = from

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
      system_url: "http://cops.dev/users/auth/isoauth2"
    })

    json = MultiJson.load( response.body )
    invite_id = json["invite_id"]

    @authorization.invite_id = invite_id
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
