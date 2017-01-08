class Ticket
  attr_accessor :price, :from_station, :to_station

  def initialize price
    @price = price
    @from_station = nil
    @to_station = nil
  end

  def used?
    !@to_station.nil?
  end
end
