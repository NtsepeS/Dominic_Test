require "processmaker"

class WorkflowService

  UserDefaults = {role: 'PROCESSMAKER_OPERATOR' }

  def initialize
    Processmaker.login(wsdl: Rails.application.secrets.PM_WSDL,
                       user_id: Rails.application.secrets.PM_ADMIN_USER,
                       password: Rails.application.secrets.PM_ADMIN_PASSWORD)
  end

  def add_user(options = {})
    options.reverse_merge!(UserDefaults)
    Processmaker.create_user(options)
  end
end
