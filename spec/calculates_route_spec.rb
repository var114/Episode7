require_relative "../lib/calculates_route"
require_relative "../lib/place.rb"

  describe CalculatesRoute do
    let(:austin) {Place.build("Austin, TX")}
    let(:dallas) {Place.build("Dallas, TX")}
    let(:el_paso) {Place.build("El Paso, TX")}
    let(:lubbock) {Place.build("Lubbock, TX")}

    it "should be able to calculate the route" do
    start = austin
    inputs = [austin, dallas, el_paso, lubbock]
    expected = [austin, dallas, lubbock, el_paso]
    CalculatesRoute.calculate(inputs, start).should eq(expected)

  end
end