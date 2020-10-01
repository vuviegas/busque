class CreateBusTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :bus_travels do |t|
      t.date :departure_on
      t.date :arrival_on
      t.references :travel_line, null: false, foreign_key: true

      t.timestamps
    end
  end
end
