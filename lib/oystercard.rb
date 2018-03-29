class Oystercard
  attr_accessor :balance, :station_entry, :in_journey
  attr_reader :journey_history
  DEFAULT_BAL = 0
  MINBAL = 1
  MAXBAL = 90

  def initialize(balance = DEFAULT_BAL)
    @balance = balance
    @in_journey = false
    @station_entry = nil
    @journey_history = []
  end

  def top_up(amount)
    raise "Too much, limit is £90." if (balance + amount) > MAXBAL
    @balance += amount
  end

  def in_journey?
    in_journey
  end

  def touch_in(entry_station)
    raise "Not enough funds!" if balance < MINBAL
    @station_entry = entry_station
    @in_journey = true
  end

  def touch_out(exit_station)
    deduct(MINBAL)
    journey = {station_entry => exit_station}
    @journey_history.push(journey)
    @station_entry = nil
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
