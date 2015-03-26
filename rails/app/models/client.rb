class Client < ActiveRecord::Base
  has_paper_trail

  has_many :client_links
end
