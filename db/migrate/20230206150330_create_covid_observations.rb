class CreateCovidObservations < ActiveRecord::Migration[7.0]
  def change
    create_table :covid_observations do |t|
      # SNo,ObservationDate,Province/State,Country/Region,Last Update,Confirmed,Deaths,Recovered
      t.string "SNo"
      t.string "ObservationDate"
      t.string "ProvinceState"
      t.string "CountryRegion"
      t.datetime "LastUpdate"
      t.integer "Confirmed"
      t.integer "Deaths"
      t.integer "Recovered"
      # t.timestamps
    end
  end
end
