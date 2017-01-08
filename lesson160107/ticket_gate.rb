require './ticket'
require './ticket_errors'

class TicketGate
  STATIONS_LIST = ["梅田", "十三", "庄内", "岡町"].freeze

  attr_accessor :message

  def initialize station
    @station = station
    @message = nil
  end

  def enter ticket
    raise AlreadyEnteredTicketError unless ticket.from_station.nil?

    ticket.from_station = @station
    ticket
  end

  def exit ticket
    raise TicketWithoutEnteredError if ticket.from_station.nil?
    raise AlreadyExitTicketError unless ticket.to_station.nil?
    raise ExitSameEnterStationError if self.exit_enter_samed?(ticket.from_station)

    raise NotEnoughFareTicketError if ticket.price < self.required_price(ticket.from_station)

    ticket.to_station = @station
    ticket
  end

  def required_price from_station
    distance = (STATIONS_LIST.index(@station) - STATIONS_LIST.index(from_station)).abs
    case distance
    when 1 then 150
    when 2 then 180
    when 3 then 220
    end
  end

  def exit_enter_samed? station
    station == @station
  end
end

