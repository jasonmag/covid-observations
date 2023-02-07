# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
require 'date'

csv_text = File.read(Rails.root.join('lib','seeds','covid_19_data.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
    data = row.to_h
    # handle different date time format
    begin
        data['LastUpdate'] = DateTime.strptime("0" + data['LastUpdate'],'%m/%d/%Y %H:%M')
    rescue
        begin            
            data['LastUpdate'] = DateTime.strptime(data['LastUpdate'],'%Y-%m-%dT%H:%M:%S')
        rescue
            data['LastUpdate'] = DateTime.strptime(data['LastUpdate'],'%Y-%m-%d %H:%M:%S')
        end
    end

    c = CovidObservation.create(data)

    puts "#{c.SNo},#{c.ObservationDate},#{c.ProvinceState},#{c.CountryRegion},#{c.LastUpdate},#{c.Confirmed},#{c.Deaths},#{c.Recovered}"
end

puts "Row count #{CovidObservation.count} in the Covid Observation table."
