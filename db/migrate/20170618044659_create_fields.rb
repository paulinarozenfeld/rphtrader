class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.string :pharmacist, null: false
      t.string :intern, null: false
      t.string :technician, null: false
      t.string :cashier, null: false
      t.references :user, null: false, index: true

      t.timestamps
    end
  end
end
