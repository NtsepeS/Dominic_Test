require "processmaker"

class WorkflowService

  def initialize
    ap Rails.application.secrets.PM_WSDL
    Processmaker.login(wsdl: Rails.application.secrets.PM_WSDL,
                       user_id: Rails.application.secrets.PM_ADMIN_USER,
                       password: Rails.application.secrets.PM_ADMIN_PASSWORD)
  end

  def add_user options = {}
    Processmaker.create_user(options)
  end
end
