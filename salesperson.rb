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
puts phil.cities
puts '------------------------'
puts phil.route(starting_point)


texas_cities = []
texas = Nokogiri::HTML(open('http://www.texas.gov/en/discover/Pages/topic.aspx?topicid=/government/localgov'))
texas.css(" .topic-subcategory-link a").map do |node|
   texas_cities << node.content

  #puts node.content
end


bench_var = [2, 3]
  bench_var.each do |var|
    content = SalesPerson.new
    texas_cities.shuffle.take(var).each do |city|
      content.schedule_city(Place.build(city))
  end

  Benchmark.bm do |x|
    x.report do
    starting_point = "Austin, Texas"
    y = content.route(starting_point)
    puts y
    end
  end
end



