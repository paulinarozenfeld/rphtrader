class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mobile, :string, default: ""
    add_column :users, :home, :string, default: ""
    add_column :users, :city, :string, default: ""
    add_column :users, :zip, :string, default: ""
  end
end
