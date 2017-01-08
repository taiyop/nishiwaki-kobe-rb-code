class AlreadyEnteredTicketError < StandardError
end

class AlreadyExitTicketError < StandardError
end

class TicketWithoutEnteredError < StandardError
end

class ExitSameEnterStationError < StandardError
end

class NotEnoughFareTicketError < StandardError
end
