require './ticket_checker'

# INPUT: 金額：150円 入場：梅田　出場：十三 結果：出場できる
describe TicketChecker do
  describe "#1 150円の切符を購入し梅田で入場、十三で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new
      ticket.set_from_station "梅田"
      ticket.set_to_station "十三"
      ticket.price = 150

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq true
    end
  end

  describe "#2 150円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new
      ticket.set_from_station "梅田"
      ticket.set_to_station "庄内"
      ticket.price = 150

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq false

    end
  end

  describe "#3 180円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new
      ticket.set_from_station "梅田"
      ticket.set_to_station "庄内"
      ticket.price = 180

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq true

    end
  end

  describe "#4 220円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new
      ticket.set_from_station "梅田"
      ticket.set_to_station "庄内"
      ticket.price = 220

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq true

    end
  end

  describe "#5 180円の切符を購入し梅田で入場、岡町で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new
      ticket.set_from_station "梅田"
      ticket.set_to_station "岡町"
      ticket.price = 180

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq false

    end
  end

  describe "#6 220円の切符を購入し梅田で入場、岡町で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new
      ticket.set_from_station "梅田"
      ticket.set_to_station "岡町"
      ticket.price = 220

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq true
    end
  end

  describe "#7 150円の切符を購入し十三で入場、岡町で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new
      ticket.set_from_station "十三"
      ticket.set_to_station "岡町"
      ticket.price = 150

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq false
    end
  end

  describe "#8 180円の切符を購入し十三で入場、岡町で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new
      ticket.set_from_station "十三"
      ticket.set_to_station "岡町"
      ticket.price = 180

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq true
    end
  end

  describe "#9-#8 180円の切符を購入し岡町で入場、十三で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new
      ticket.set_from_station "岡町"
      ticket.set_to_station "十三"
      ticket.price = 180

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq true
    end
  end

  describe "#9-#7 150円の切符を購入し岡町で入場、十三で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new
      ticket.set_from_station "岡町"
      ticket.set_to_station "十三"
      ticket.price = 150

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq false
    end
  end

  describe "#10 150円の切符を購入し岡町で入場、十三で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new
      ticket.set_from_station "岡町"
      ticket.set_to_station "十三"
      ticket.price = 150

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq false
    end
  end

  describe "#11 150円の切符を購入し梅田で入場、さらに梅田で再入場した結果" do
    it "入場できない" do
      ticket = Ticket.new
      ticket.set_from_station "梅田"
      ticket.price = 150

      expect(ticket.set_from_station "梅田").to eq false
    end
  end

  describe "#12 150円の切符を購入し梅田で入場、十三で出場し、再度十三で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new
      ticket.set_from_station "梅田"
      ticket.set_to_station "十三"
      ticket.price = 150

      expect(ticket.set_to_station "十三").to eq false
    end
  end

  describe "#13 150円の切符を購入し改札を通さず入場して、梅田で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new
      ticket.set_to_station "梅田"
      ticket_price = 150

      ticket_checker = TicketChecker.new
      ticket_checker.ticket = ticket

      expect(ticket_checker.go_out).to eq false
    end
  end
end

