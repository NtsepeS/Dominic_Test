require 'csv'

Client.delete_all
CSV.foreach("#{Rails.root}/db/seeds/constant_data/clients.csv", :headers => true, :col_sep => ';') do |row|
  Client.create(name: row["Title"])
end
