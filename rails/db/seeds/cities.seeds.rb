require 'csv'

City.delete_all
CSV.foreach(File.join(File.dirname(__FILE__), "constant_data", "cities.csv"), :headers => true, :col_sep => ';') do |row|
  City.create(name: row["Title"])
end