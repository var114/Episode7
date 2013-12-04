require_relative "./map"
class CalculatesRoute

  attr_reader :total_distance, :total_time, :display

  def self.calculate(points, start_point)
    remaining_points = points
    route = []
    route << remaining_points.slice!(remaining_points.index(start_point))
    until remaining_points == [] do
      @total_distance = 0
      next_point = shortest_distance(route.last, remaining_points)
      route << remaining_points.slice!(remaining_points.index(next_point.fetch(:point)))
      @total_distance += next_point.fetch(:distance)
    end
    route
    #@total_time = (@total_distance/55)
    display = {route: route, distance: @total_distance}
  end

  def self.shortest_distance(form, possible)
    distances = possible.map do |point|
      {point: point, distance: Map.distance_between(form, point)}
    end
    point = distances.sort{|a,b| a.fetch(:distance) <=> b.fetch(:distance)}.first
  end

end