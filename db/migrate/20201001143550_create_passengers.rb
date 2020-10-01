class CreatePassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.string :full_name
      t.date :date_of_birth
      t.string :gender
      t.string :cpf
      t.string :identification_number
      t.string :identification_state
      t.references :bus_travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
