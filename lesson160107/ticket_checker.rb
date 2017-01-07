STATIONS_LIST = ["梅田", "十三", "庄内", "岡町"]

class TicketChecker
  attr_accessor :from_station, :to_station, :purchased_ticket_price

  def required_price
    distance = STATIONS_LIST.index(@to_station) - STATIONS_LIST.index(@from_station)
    case distance.abs
    when 1 then 150
    when 2 then 180
    when 3 then 220
    when 0 then nil
    end
  end

  def go_out_enabled?
    diff_price = @purchased_ticket_price - self.required_price
    if self.required_price.nil?
      puts "乗車駅と同じ駅です。"
      false
    else
      diff_price >= 0 ? true : false
    end
  end
end

