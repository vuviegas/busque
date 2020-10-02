class CreatePassengerTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :passenger_trips do |t|
      t.integer :seat
      t.string :arrival_spot
      t.references :passenger, null: false, foreign_key: true
      t.references :bus_travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
