class CreatePassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.timestamps
      t.references :booking, null: false, foreign_key: true
    end
  end
end
