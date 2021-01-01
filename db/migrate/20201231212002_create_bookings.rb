class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :passenger, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true
      t.string :seat_preference

      t.timestamps
    end
  end
end
