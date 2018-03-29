require './lib/oystercard'

describe Oystercard do
  # let(:class) {double(:label)} #the symbol in the let statement is just shitty rspec syntaxing.
  it "has a balance" do
    expect(subject.balance).to eq(0)
  end

  it "has a journey tracker" do
    expect(subject.in_journey).to eq(false)
  end

  describe "#top_up" do

    it "adds money to balance" do
      expect(subject.top_up(10)).to eq(10)
    end

    it 'throws an error if exeeds max' do
      oystercard = Oystercard.new(90)
      expect{ oystercard.top_up(1) }.to raise_error "Too much, limit is £90."
    end

  end

  describe "#deduct" do
    it "deducts money using touch_out" do
    oystercard = Oystercard.new(40)
    station = double(:station_entry)
    oystercard.touch_in(station)
    oystercard.touch_out
    expect( oystercard.balance ).to eq(39)
    end
  end

  describe "#in_journey?" do
    it "returns @in_journey" do
      expect(subject.in_journey?).to eq (false)
    end
  end

  describe "#touch_in" do
    it "verifies a touch in" do
      subject.top_up(10)
      station = double(:station_entry)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(true)
    end

    it "allows touch in if above minimum balance" do
      subject.top_up(10)
      station = double(:station_entry)
      subject.touch_in(station)
      expect(subject.in_journey).to eq(true)
    end

    it "rejects touch in if below minimum balance" do
      station = double(:station_entry)
      expect{ subject.touch_in(station) }.to raise_error "Not enough funds!"
    end

    it "saves a record of a station" do
      station = double(:station_entry)
      subject.top_up(40)
      subject.touch_in(station)
      expect(subject.station_entry).to eq(station)
    end

  end

  describe "#touch_out" do
    it "verifies a touch out" do
      subject.top_up(10)
      station = double(:station_entry)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.in_journey?).to eq(false)
    end

    it "expect touching out to reduce balance by minimum fare" do
      subject.top_up(10)
      station = double(:station_entry)
      subject.touch_in(station)
      expect {subject.touch_out}.to change{subject.balance}.by(-1)
    end

    it "sets station_entry to nil" do
      subject.top_up(10)
      station = double(:station_entry)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.station_entry).to be_nil
    end

  end
end



# book = instance_double("Book", :pages => 250)
# # "Book" is a description
# #pages is the method, 250 is the result.
#
# card = double("card", :top_up => 50)
