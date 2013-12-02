Dir["./lib/*.rb"].each {|file| require file }

phil = SalesPerson.new
phil.schedule_city(Place.build("Dallas, TX"))
phil.schedule_city(Place.build("El Paso, TX"))
phil.schedule_city(Place.build("Burbank, CA"))
phil.schedule_city(Place.build("Austin, TX"))
phil.schedule_city(Place.build("Lubbock, TX"))
#phil.schedule_city(Place.build("Brooklyn, NY"))
#phil.schedule_city(Place.build("Los Angeles, CA"))
#phil.schedule_city(Place.build("San Diego, CA"))

starting_point = "Austin, TX"
#puts phil.route(starting_point)








