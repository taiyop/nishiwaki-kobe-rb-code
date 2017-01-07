STATIONS_LIST = ["梅田", "十三", "庄内", "岡町"]

class Ticket
  attr_accessor :price, :from_station, :to_station

  def initialize price
    @price = price
    @from_station = nil
    @to_station = nil
  end
end

class TicketGate
  attr_accessor :message

  def initialize station
    @station = station
    @message = nil
  end

  def go_in ticket
    if ticket.from_station.nil?
      ticket.from_station = @station
    else
      @message = "再入場出来ません"
    end
    ticket
  end

  def go_out ticket
    if ticket.from_station.nil?
       @message = "入場時に改札を通っていません。"
    else
      if ticket.to_station.nil?
        if self.required_price(ticket.from_station).nil?
          @message = "乗車駅と同じ駅です。"
        else
          if ticket.price < self.required_price(ticket.from_station)
            @message = "乗車賃が足りません"
          else
            ticket.to_station = @station
          end
        end
      else
        @message = "再出場出来ません"
      end
    end
    ticket
  end

  def required_price from_station
    distance = STATIONS_LIST.index(@station) - STATIONS_LIST.index(from_station)
    case distance.abs
    when 1 then 150
    when 2 then 180
    when 3 then 220
    when 0 then nil
    end
  end
end

