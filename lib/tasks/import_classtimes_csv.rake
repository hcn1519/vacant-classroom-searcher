require 'csv'
namespace :import_classtimes_csv do
  task :create_classtimes => :environment do
    CSV.foreach("public/ClassTime.csv", :headers => true) do |row|
      ClassTime.create!(row.to_hash)
    end
  end
end
