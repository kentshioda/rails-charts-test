# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('db/ppy.txt') do |info|
  RealEstate.create(
    place: info[0],
    price: info[1],
    year: info[2],
    square_meter: info[3]
  )
end

CSV.foreach('db/ec_timedata.txt') do |info|
  RecordNumber.create(
    company: info[0],
    date: info[1],
    count: info[2]
  )
end
