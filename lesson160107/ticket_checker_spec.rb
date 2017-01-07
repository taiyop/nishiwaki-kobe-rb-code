require './ticket_checker'

# INPUT: 金額：150円 入場：梅田　出場：十三 結果：出場できる
describe TicketGate do
  describe "#1 150円の切符を購入し梅田で入場、十三で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(150)
      go_in_ticket_checker = TicketGate.new("梅田")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("十三")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).to be_nil
    end
  end

  describe "#2 150円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      umeda = TicketGate.new("梅田")
      ticket = umeda.go_in(ticket)
      shounai = TicketGate.new("庄内")
      ticket = shounai.go_out(ticket)

      expect(shounai.message).not_to be_nil
    end
  end

  describe "#3 180円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(180)
      go_in_ticket_checker = TicketGate.new("梅田")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("庄内")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).to be_nil
    end
  end

  describe "#4 220円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(220)
      go_in_ticket_checker = TicketGate.new("梅田")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("庄内")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).to be_nil
    end
  end

  describe "#5 180円の切符を購入し梅田で入場、岡町で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(180)
      go_in_ticket_checker = TicketGate.new("梅田")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("岡町")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).not_to be_nil
    end
  end

  describe "#6 220円の切符を購入し梅田で入場、岡町で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(220)
      go_in_ticket_checker = TicketGate.new("梅田")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("岡町")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).to be_nil
    end
  end

  describe "#7 150円の切符を購入し十三で入場、岡町で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      go_in_ticket_checker = TicketGate.new("十三")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("岡町")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).not_to be_nil
    end
  end

  describe "#8 180円の切符を購入し十三で入場、岡町で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(180)
      go_in_ticket_checker = TicketGate.new("十三")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("岡町")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).to be_nil
    end
  end

  describe "#9-#8 180円の切符を購入し岡町で入場、十三で出場した結果" do
    it "出場できる" do
      ticket = Ticket.new(180)
      go_in_ticket_checker = TicketGate.new("岡町")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("十三")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).to be_nil
    end
  end

  describe "#9-#7 150円の切符を購入し岡町で入場、十三で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      go_in_ticket_checker = TicketGate.new("岡町")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("十三")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).not_to be_nil
    end
  end

  describe "#10 150円の切符を購入し梅田で入場、梅田で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      umeda_in = TicketGate.new("梅田")
      ticket = umeda_in.go_in(ticket)
      umeda_out = TicketGate.new("梅田")
      ticket = umeda_out.go_out(ticket)

      expect(umeda_out.message).not_to be_nil
    end
  end

  describe "#11 150円の切符を購入し梅田で入場、さらに梅田で再入場した結果" do
    it "入場できない" do
      ticket = Ticket.new(150)
      go_in_ticket_checker = TicketGate.new("梅田")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_in_ticket_checker2 = TicketGate.new("梅田")
      ticket = go_in_ticket_checker2.go_in(ticket)

      expect(go_in_ticket_checker2.message).not_to be_nil
    end
  end

  describe "#12 150円の切符を購入し梅田で入場、十三で出場し、再度十三で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      go_in_ticket_checker = TicketGate.new("梅田")
      ticket = go_in_ticket_checker.go_in(ticket)
      go_out_ticket_checker = TicketGate.new("十三")
      ticket = go_out_ticket_checker.go_out(ticket)
      go_out_ticket_checker2 = TicketGate.new("十三")
      ticket = go_out_ticket_checker2.go_out(ticket)

      expect(go_out_ticket_checker2.message).not_to be_nil
    end
  end

  describe "#13 150円の切符を購入し改札を通さず入場して、梅田で出場した結果" do
    it "出場できない" do
      ticket = Ticket.new(150)
      go_out_ticket_checker = TicketGate.new("十三")
      ticket = go_out_ticket_checker.go_out(ticket)

      expect(go_out_ticket_checker.message).not_to be_nil
    end
  end
end

