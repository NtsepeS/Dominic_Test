require 'csv'

City.delete_all
CSV.foreach("#{Rails.root}/db/seeds/constant_data/cities.csv", :headers => true, :col_sep => ';') do |row|
  City.create(name: row["Title"])
end