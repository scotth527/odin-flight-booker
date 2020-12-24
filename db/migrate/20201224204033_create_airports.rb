class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.string :airport_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
