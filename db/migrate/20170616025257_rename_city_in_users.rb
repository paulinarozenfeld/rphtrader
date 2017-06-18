class RenameCityInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :city, :position
  end
end
