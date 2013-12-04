require_relative "../lib/place"
require_relative "../lib/map"
require 'geocoder'


describe Map do 
  describe ":search" do
    it "should be able to search in geocoder" do
      Geocoder.should_receive(:search).with("austin, tx")
      Map.search("austin, tx")
    end

    it "should use the first item in the array" do
      austin = stub("Austin")
      dallas = stub("Dallas")
      Geocoder.stub(:search) {[austin, dallas]}
      Map.search("austin, tx").should eq(austin)
    end
  end

  describe ":distance" do
    it "should measure the accurate distance between points" do
    alpha = stub
    beta = stub
      Geocoder::Calculations.should_receive(:distance_between).with(alpha, beta)
      Map.distance_between(alpha, beta)
    end
  end


end