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
      city = stub
      city.stub(name: "Austin, TX")
      subject.schedule_city(city)
      subject.find_city("Austin, TX").should eq(city)
    end
    it "should be able to calcuate the route via CalculatesRoute" do
      start = stub(name: "Austin, TX")
      point = stub(name: "Los Angeles, CA")
      cities = [start, point]
      subject.stub(:cities) {cities}
      CalculatesRoute.should_receive(:calculate).with(cities, start)
      subject.route("Austin, TX")
    end

    it "should return the route from CalcuatesRoute" do
      route = [stub("Austin, Tx"), stub("Los Angeles, CA")]
      start = stub("Austin, TX")
      cities = [stub, stub, stub]
      CalculatesRoute.stub(:calculate) {route}
      CalculatesRoute.stub(:route).and_return(route)
      subject.route.(start).should eq(route)


    end
  end
