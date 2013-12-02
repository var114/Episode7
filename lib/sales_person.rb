class SalesPerson

  attr_reader :cities 

  def initialize
    @cities = [] 
  end

  def schedule_city(city)
    @cities << city unless @cities.include?(city)
    p @cities

  end

  def find_point(start_name)
    @cities.find{|city| city if city.name == start_name }

  end

  def route(starting_point)
    CalculatesRoute.calculate(cities, find_point(starting_point))
  end

end