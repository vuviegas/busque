class ChangeDescriptionOnAlerts < ActiveRecord::Migration[6.0]
  def change
    change_column :alerts, :description, :text
  end
end
