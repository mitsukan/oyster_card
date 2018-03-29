require './lib/station.rb'

describe Station do

  it "can take and store a zone" do
    holborn = Station.new("Holborn", 1)
    expect(holborn.zone).to eq(1)
  end

  it "can take a store a name" do
    holborn = Station.new("Holborn", 1)
    expect(holborn.name).to eq("Holborn")
  end

end
