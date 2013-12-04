require_relative '../lib/sales_person'
require_relative '../lib/calculates_route'
require 'rspec'

  describe SalesPerson do
    it "should be able to schedule many cities" do
      city = stub
      subject.schedule_city(city)
      subject.cities.should include(city)
    end

    it "should not include the same city" do
      city = stub
      city = stub
      subject.schedule_city(city)
      subject.schedule_city(city)
      subject.cities.count.should eq(1)
    end

    it "should find a starting point" do
      cities = [stub, stub, stub]
      start = stub
      subject.find_city(start).should eq(start)
    end
# route needs to use CalcuatesRoute.calculate method to return the correct 
# arrangement of cities
    it "should be able to calcuate the route via CalculatesRoute" do
      start = stub("Austin, TX")
      point = stub("Los Angeles, CA")
      cities = [start, point]
      subject.stub(:cities) {cities}
      CalculatesRoute.should_receive(:calculate).with(cities, start)
      #subject.route
    end

    it "should return the route from CalcuatesRoute" do
      start = [stub]
      route_stub = [stub, stub]
      cities = [stub, stub, stub]
      CalculatesRoute.stub(:calculate) {[start, route_stub]}
      subject.route.should eq([stub, stub, stub])


    end
  end
