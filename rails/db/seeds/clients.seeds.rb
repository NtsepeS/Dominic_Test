require 'csv'

CSV.foreach(File.join(File.dirname(__FILE__), "constant_data", "clients.csv"), :headers => true, :col_sep => ';') do |row|
  Client.find_or_create_by(name: row["Title"])
end
