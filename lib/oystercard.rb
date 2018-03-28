class Oystercard
  attr_reader :balance
  attr_writer :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    raise "Too much, limit is £90." if (@balance + amount) > 90
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
