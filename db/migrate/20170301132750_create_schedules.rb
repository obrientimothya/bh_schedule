class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.datetime :imported_at
      t.string :person
      t.string :day
      t.string :allocation

      t.timestamps
    end
    add_index :schedules, :imported_at
    add_index :schedules, :person
    add_index :schedules, :day
    add_index :schedules, :allocation
  end
end
