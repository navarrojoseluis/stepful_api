class CreateSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :slots do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :coach, null: false, foreign_key: { to_table: :users }
      t.references :student, foreign_key: { to_table: :users }
      t.integer :rate
      t.text :note

      t.timestamps
    end
  end
end
