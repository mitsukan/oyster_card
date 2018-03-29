class Oystercard
  attr_reader :balance, :in_journey, :station_entry
  attr_writer :balance, :in_journey, :station_entry
  MINBAL = 1
  MAXBAL = 90

  def initialize(balance = 0, in_journey = false, station_entry = nil)
    @balance = balance
    @in_journey = in_journey
    @station_entry = station_entry
  end

  def top_up(amount)
    raise "Too much, limit is £90." if (@balance + amount) > MAXBAL
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise "Not enough funds!" if @balance < MINBAL
    @station_entry = station
    @in_journey = true
  end

  def touch_out
    deduct(MINBAL)
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
