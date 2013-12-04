require_relative "./calculates_route"

class SalesPerson

  attr_reader :cities

  def initialize
    @cities = []
  end

  def schedule_city(city)
    @cities << city unless @cities.include?(city)
  end
 
  def find_city(start_name)
    found = cities.select{|city| city if city.name == start_name}
    found.first
  end

  def route(start)
    city = find_city(start)
    display = CalculatesRoute.calculate(cities, city)
    results = {route: display.fetch(:route), time: traveling_time(display.fetch(:distance))}
    z = []
    x = results.fetch(:route) 
    y = results.fetch(:time)
    z = [x, y]
    return z
  end

  def traveling_time(distance)
    time = distance/55
  end

end
