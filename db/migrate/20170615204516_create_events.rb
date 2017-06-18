class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :unparsed_date, null: false
      t.references :user, null: false, index: true
    end
  end
end
