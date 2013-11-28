require_relative '../lib/sales_person'
require_relative '../lib/calculates_route'

describe SalesPerson do
it "should have many cities" do
  city = stub
  subject.schedule_city(city)
  subject.cities.should include(city)
end

it "should keep the cities only scheduled once" do
  city = stub
  expect{
    subject.schedule_city(city)
    subject.schedule_city(city)
  }.to change(subject.cities,:count).by(1)

end

it "should find the starting_point" do
  cities = [stub, stub, stub]
  starting_point = [stub]
  subject.find_point(starting_point).should eq(starting_point)

end

it "should calculate route via the CalculatesRoute" do   
  start = stub("Austin, TX")   
  point = stub("Los Angeles, CA")
  cities = [start, point]
  subject.stub(:cities) { cities }
  CalculatesRoute.should_receive(:calculate).with(cities, start)
  #subject.route(start)
end

it "should returns the route from CalculatesRoute" do 
  route_stub = [stub, stub]
  start = [stub]
  CalculatesRoute.stub(:calculate) { route_stub }
  subject.route.should eq(route_stub)  
end

end

 