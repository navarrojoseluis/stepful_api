# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

c1 = User.create!(name: 'Alex', type: 'Coach')
User.create!(name: 'David', type: 'Coach')
User.create!(name: 'Theo', type: 'Student')
User.create!(name: 'Monica', type: 'Student')

start_time = Time.now
end_time = start_time + 2.hours
Slot.create!(coach: c1, start_time:, end_time:)
