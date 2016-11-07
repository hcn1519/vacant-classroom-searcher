require 'csv'
namespace :import_classrooms_csv do
  task :create_classrooms => :environment do
    CSV.foreach("public/ClassRoom.csv", :headers => true) do |row|
      ClassRoom.create!(row.to_hash)
    end
  end
end
