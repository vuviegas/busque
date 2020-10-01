class CreateTravelLines < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_lines do |t|
      t.string :identification_number
      t.string :origin
      t.string :destination
      t.string :departure_at
      t.string :arrival_at
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
