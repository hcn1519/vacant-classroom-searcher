class CreateClassTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :class_times do |t|
      t.integer :class_room_id
      t.string :dayoftheWeek
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
