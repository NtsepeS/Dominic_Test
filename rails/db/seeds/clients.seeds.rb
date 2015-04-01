require 'csv'

Client.delete_all
CSV.foreach(File.join(File.dirname(__FILE__), "constant_data", "clients.csv"), :headers => true, :col_sep => ';') do |row|
  Client.create(name: row["Title"])
end
