require './lib/oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}
  # let(:class) {double :class}
  it "has a balance" do
    expect(oystercard.balance).to eq(0)
  end

  it "has a journey tracker" do
    expect(oystercard.in_journey).to eq(false)
  end

  describe "#top_up" do

    it "adds money to balance" do
      expect(oystercard.top_up(10)).to eq(10)
    end

    it 'throws an error if exeeds max' do
      oystercard2 = Oystercard.new(90)
      expect{ oystercard2.top_up(1) }.to raise_error "Too much, limit is £90."
    end

  end

  describe "#deduct" do
    it "deducts money" do
    oystercard3 = Oystercard.new(40)
    oystercard3.deduct(5)
    expect( oystercard3.balance ).to eq(35)
    end
  end

  describe "#in_journey?" do
    it "returns @in_journey" do
      expect(subject.in_journey?).to eq (false)
    end
  end

  describe "#touch_in" do
    it "verifies a touch in" do
      subject.touch_in
      expect(subject.in_journey?).to eq(true)
    end
  end

  describe "#touch_out" do
    it "verifies a touch out" do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq(false)
    end
  end
end





# book = instance_double("Book", :pages => 250)
# # "Book" is a description
# #pages is the method, 250 is the result.
#
# card = double("card", :top_up => 50)
