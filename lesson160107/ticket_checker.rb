STATIONS_LIST = ["梅田", "十三", "庄内", "岡町"]

class Ticket
  attr_accessor :price
  attr_reader :from_station, :to_station

  def initialize
    @from_station = nil
    @to_station = nil
  end

  def set_from_station station_name
    if @from_station.nil?
      @from_station = station_name
      true
    else
      puts "再入場出来ません"
      false
    end
  end

  def set_to_station station_name
    if @to_station.nil?
      @to_station = station_name
      true
    else
      puts "再出場出来ません"
      false
    end
  end
end

class TicketChecker
  attr_accessor :ticket

  def required_price
    distance = STATIONS_LIST.index(@ticket.to_station) - STATIONS_LIST.index(@ticket.from_station)
    case distance.abs
    when 1 then 150
    when 2 then 180
    when 3 then 220
    when 0 then nil
    end
  end

  def go_out_enabled?
    diff_price = @ticket.price - self.required_price
    if self.required_price.nil?
      puts "乗車駅と同じ駅です。"
      false
    else
      diff_price >= 0 ? true : false
    end
  end
end

