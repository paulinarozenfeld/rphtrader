class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :body, null: false
      t.references :user, null: false, index: true

      t.timestamps
    end
  end
end
