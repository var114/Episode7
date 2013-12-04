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
    @cities.find{|city| city if city.name == start_name}
  end

  def route(start)
    display = CalculatesRoute.calculate(cities, find_city(start))
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
