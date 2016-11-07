class CreateClassRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :class_rooms do |t|
      t.string :building_name
      t.string :room_number
      t.string :full_name

      t.timestamps
    end
  end
end
