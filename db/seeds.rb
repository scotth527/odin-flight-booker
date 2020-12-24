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

flights = Flight.create([
    { from_airport: 1,
      to_airport: 2,
      flight_duration: 60,
      start_datetime: "2020-12-24 21:33:02"
    },
    { from_airport: 2,
      to_airport: 1,
      flight_duration: 180,
      start_datetime: "2020-12-31 21:33:02"
    },
])
