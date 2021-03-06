class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.references :from_airport, null: false, foreign_key: { to_table: :airports}, index: true
      t.references :to_airport, null: false, foreign_key: { to_table: :airports}, index: true
      ### Flight duration in minutes
      t.integer :flight_duration
      t.datetime :start_datetime

      t.timestamps
    end
  end
end
