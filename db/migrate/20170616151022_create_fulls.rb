class CreateFulls < ActiveRecord::Migration[5.1]
  def change
    create_table :fulls do | t |
      t.string :sunday, null: false, default: "inactive"
      t.string :monday, null: false, default: "inactive"
      t.string :tuesday, null: false, default: "inactive"
      t.string :wednesday, null: false, default: "inactive"
      t.string :thursday, null: false, default: "inactive"
      t.string :friday, null: false, default: "inactive"
      t.string :saturday, null: false, default: "inactive"
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
