require './lib/oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}
  # let(:class) {double :class}
  it "has a balance" do
    expect(oystercard.balance).to eq(0)
  end

  describe "#top_up" do

    it "adds money to balance" do
      expect(oystercard.top_up(10)).to eq(10)
    end

    it 'throws an error if exeeds max' do
      oystercard2 = Oystercard.new(90)
      expect{ oystercard2.top_up(1) }.to raise_error "Too much, limit is £90."
    end

  # book = instance_double("Book", :pages => 250)
  # # "Book" is a description
  # #pages is the method, 250 is the result.
  #
  # card = double("card", :top_up => 50)
  end

end
