require 'csv'

CSV.foreach(File.join(File.dirname(__FILE__), "constant_data", "cities.csv"), :headers => true, :col_sep => ';') do |row|
  City.find_or_create_by(name: row["Title"])
end