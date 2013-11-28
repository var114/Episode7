require_relative "../lib/calculates_route.rb"
require_relative "../lib/place.rb"

describe CalculatesRoute do
    let(:dallas) { Place.build("Dallas, TX")}
    let(:austin) { Place.build("Austin, TX")}
    let(:lubbock) { Place.build("Lubbock, TX")}
    let(:el_paso) { Place.build("El Paso, TX")}

  it "should calculate the route" do
    starting_point = austin
    inputs = [austin, dallas, el_paso, lubbock]
    expected = [austin, dallas, lubbock, el_paso]
    CalculatesRoute.calculate(inputs, starting_point).should eq(expected)

  end
end