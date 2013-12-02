class CalculatesRoute

  def self.calculate(points, starting_point)
    
    remaining_points = points
    route = []
    route << remaining_points.slice!(remaining_points.index(starting_point))
    until remaining_points == [] do
      next_point = shortest_distance(route.last, remaining_points)
      puts "from: #{route.last} ... to: #{next_point}"
      route << remaining_points.slice!(remaining_points.index(next_point))      
    end
      # p route
  end

  def self.shortest_distance(from, possible)
    distances = possible.map do |point|
      {point: point, distance: Map.distance_between(from, point)}
    end
      distances.sort{|a,b| a.fetch(:distance) <=> b.fetch(:distance)}.first.fetch(:point)
  end
end