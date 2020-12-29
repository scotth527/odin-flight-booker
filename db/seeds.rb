# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = Airport.create([
    { airport_code: "SFO", address:"123 Fake Street", name:"San Francisco International"},
    { airport_code: "MIA", address:"124 Fake Street", name:"Miami International"},
])
#
p "Testing"

# p "Airports"
# p Airport.first
# p Airport.last
#
flights = Flight.create([
    {
        from_airport_id: airports.first.id,
        to_airport_id: airports.last.id,
        flight_duration: 60,
        start_datetime: "2020-12-24 21:33:02"
    },
    {
        from_airport_id: airports.last.id,
        to_airport_id: airports.first.id,
        flight_duration: 60,
        start_datetime: "2020-12-24 21:33:02"
    }
])
#
p flights

flights.each do  |flight|
    p "~~~~~~~~~~~~~"
    p flight.errors.full_messages
end
