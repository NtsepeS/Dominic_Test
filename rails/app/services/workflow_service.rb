require "processmaker"

class WorkflowService

  DefaultRole = "PROCESSMAKER_OPERATOR"
  UserDefaults = {role: DefaultRole}

  def initialize
    ap Rails.application.secrets.PM_WSDL
    Processmaker.login(wsdl: Rails.application.secrets.PM_WSDL,
                       user_id: Rails.application.secrets.PM_ADMIN_USER,
                       password: Rails.application.secrets.PM_ADMIN_PASSWORD)
  end

  def add_user options = {}
    options.reverse_merge!(UserDefaults)
    Processmaker.create_user(options)
  end
end
