class ClassRoom < ApplicationRecord
  has_many :class_times

  def self.import(file)
    CSV.foreach("public/ClassRoom.csv", headers: true) do |row|
      classroom = ClassRoom.find_or_create_by(id: row.to_hash[:id])
      classroom.update_attributes(row.to_hash)
    end
  end
end
