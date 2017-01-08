require './ticket_gate'
describe TicketGate do
  describe "#1 150円の切符を購入し梅田で入場、十三で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(150)
      umeda = TicketGate.new("梅田")
      ticket = umeda.enter(ticket)
      juso = TicketGate.new("十三")
      ticket = juso.exit(ticket)

      expect(ticket.used?).to eq true
    end
  end

  describe "#2 150円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      umeda = TicketGate.new("梅田")
      ticket = umeda.enter(ticket)
      shonai = TicketGate.new("庄内")

      expect{shonai.exit(ticket)}.to raise_error(NotEnoughFareTicketError)
      # expect(shonai.exit(ticket)).to raise_error(AlreadyEnteredTicketError)

    end
  end

  describe "#3 180円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(180)
      umeda = TicketGate.new("梅田")
      ticket = umeda.enter(ticket)
      shonai = TicketGate.new("庄内")
      ticket = shonai.exit(ticket)

      expect(ticket.used?).to eq true
    end
  end

  describe "#4 220円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(220)
      umeda = TicketGate.new("梅田")
      ticket = umeda.enter(ticket)
      shonai = TicketGate.new("庄内")
      ticket = shonai.exit(ticket)

      expect(ticket.used?).to eq true
    end
  end

  describe "#5 180円の切符を購入し梅田で入場、岡町で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(180)
      umeda = TicketGate.new("梅田")
      ticket = umeda.enter(ticket)
      okamachi = TicketGate.new("岡町")

      expect{okamachi.exit(ticket)}.to raise_error(NotEnoughFareTicketError)
    end
  end

  describe "#6 220円の切符を購入し梅田で入場、岡町で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(220)
      umeda = TicketGate.new("梅田")
      ticket = umeda.enter(ticket)
      okamachi = TicketGate.new("岡町")
      ticket = okamachi.exit(ticket)

      expect(ticket.used?).to eq true
    end
  end

  describe "#7 150円の切符を購入し十三で入場、岡町で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      juso = TicketGate.new("十三")
      ticket = juso.enter(ticket)
      okamachi = TicketGate.new("岡町")

      expect{okamachi.exit(ticket)}.to raise_error(NotEnoughFareTicketError)
    end
  end

  describe "#8 180円の切符を購入し十三で入場、岡町で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(180)
      juso = TicketGate.new("十三")
      ticket = juso.enter(ticket)
      okamachi = TicketGate.new("岡町")
      ticket = okamachi.exit(ticket)

      expect(ticket.used?).to eq true
    end
  end

  describe "#9-#8 180円の切符を購入し岡町で入場、十三で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(180)
      okamachi = TicketGate.new("岡町")
      ticket = okamachi.enter(ticket)
      juso = TicketGate.new("十三")
      ticket = juso.exit(ticket)

      expect(ticket.used?).to eq true
    end
  end

  describe "#9-#7 150円の切符を購入し岡町で入場、十三で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      okamachi = TicketGate.new("岡町")
      ticket = okamachi.enter(ticket)
      juso = TicketGate.new("十三")

      expect{juso.exit(ticket)}.to raise_error(NotEnoughFareTicketError)
    end
  end

  describe "#10 150円の切符を購入し梅田で入場、梅田で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      umeda_in = TicketGate.new("梅田")
      ticket = umeda_in.enter(ticket)
      umeda_out = TicketGate.new("梅田")

      expect{umeda_out.exit(ticket)}.to raise_error(ExitSameEnterStationError)
    end
  end

  describe "#11 150円の切符を購入し梅田で入場、さらに梅田で再入場した結果" do
    it "入場できない" do
      ticket = Ticket.new(150)
      umeda = TicketGate.new("梅田")
      ticket = umeda.enter(ticket)

      expect{umeda.enter(ticket)}.to raise_error(AlreadyEnteredTicketError)
    end
  end

  describe "#12 150円の切符を購入し梅田で入場、十三で出場し、再度十三で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      umeda = TicketGate.new("梅田")
      ticket = umeda.enter(ticket)
      juso = TicketGate.new("十三")
      ticket = juso.exit(ticket)

      expect{juso.exit(ticket)}.to raise_error(AlreadyExitTicketError)
    end
  end

  describe "#13 150円の切符を購入し改札を通さず入場して、梅田で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      juso = TicketGate.new("十三")

      expect{juso.exit(ticket)}.to raise_error(TicketWithoutEnteredError)
    end
  end
end

