class RemoveBusTravelFromPassengers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :passengers, :bus_travel, null: false, foreign_key: true
  end
end
