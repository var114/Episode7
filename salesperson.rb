Dir["./lib/*.rb"].each {|file| require file }

require "benchmark"
require 'nokogiri'
require 'open-uri'

phil = SalesPerson.new
phil.schedule_city(Place.build("Burbank, CA"))
phil.schedule_city(Place.build("Dallas, TX"))
phil.schedule_city(Place.build("El Paso, TX"))
phil.schedule_city(Place.build("Austin, TX"))
phil.schedule_city(Place.build("Lubbock, TX"))
phil.schedule_city(Place.build("Brooklyn, NY"))
phil.schedule_city(Place.build("Griffith, Park"))
phil.schedule_city(Place.build("Berkeley, San Francisco"))
phil.schedule_city(Place.build("Los Angeles, CA"))
phil.schedule_city(Place.build("San Diego, CA"))
starting_point = "Austin, TX"
puts phil.route(starting_point)


texas_cities = []
texas = Nokogiri::HTML(open('http://www.texas.gov/en/discover/Pages/topic.aspx?topicid=/government/localgov'))
texas.css(" .topic-subcategory-link a").map do |node|
  texas_cities << node.content
end

puts "Count for cities in Texas #{texas_cities.count}"
#puts texas_cities


bench_vals = [2]
bench_vals.each do |val|
  current = SalesPerson.new
  texas_cities.shuffle.take(val).each do |city|
    current.schedule_city(Place.build(city))


the_route = []
puts "\nBenchmarking results for #{val} cities:"
  Benchmark.bm do |x|
    x.report do
      the_route = current.route("Austin, TX")
  end
end
 puts "The route:"
  puts the_route

  end
end
