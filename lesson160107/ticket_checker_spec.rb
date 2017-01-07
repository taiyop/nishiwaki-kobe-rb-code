require './ticket_checker'

# INPUT: 金額：150円 入場：梅田　出場：十三 結果：出場できる
describe TicketChecker do
  describe "#1 150円の切符を購入し梅田で入場、十三で出場した結果" do
    it "出場できる" do
      ticket_checker = TicketChecker.new
      ticket_checker.from_station = "梅田"
      ticket_checker.to_station = "十三"
      ticket_checker.purchased_ticket_price = 150

      expect(ticket_checker.go_out_enabled?).to eq true
    end
  end

  describe "#2 150円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できない" do
      ticket_checker = TicketChecker.new
      ticket_checker.from_station = "梅田"
      ticket_checker.to_station = "庄内"
      ticket_checker.purchased_ticket_price = 150

      expect(ticket_checker.go_out_enabled?).to eq false

    end
  end

  describe "#3 180円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できる" do
      ticket_checker = TicketChecker.new
      ticket_checker.from_station = "梅田"
      ticket_checker.to_station = "庄内"
      ticket_checker.purchased_ticket_price = 180

      expect(ticket_checker.go_out_enabled?).to eq true

    end
  end

  describe "#4 220円の切符を購入し梅田で入場、庄内で出場した結果" do
    it "出場できる" do
      ticket_checker = TicketChecker.new
      ticket_checker.from_station = "梅田"
      ticket_checker.to_station = "庄内"
      ticket_checker.purchased_ticket_price = 220

      expect(ticket_checker.go_out_enabled?).to eq true

    end
  end

  describe "#5 180円の切符を購入し梅田で入場、岡町で出場した結果" do
    it "出場できない" do
      ticket_checker = TicketChecker.new
      ticket_checker.from_station = "梅田"
      ticket_checker.to_station = "岡町"
      ticket_checker.purchased_ticket_price = 180

      expect(ticket_checker.go_out_enabled?).to eq false

    end
  end

  describe "#6 220円の切符を購入し梅田で入場、岡町で出場した結果" do
    it "出場できる" do
      ticket_checker = TicketChecker.new
      ticket_checker.from_station = "梅田"
      ticket_checker.to_station = "岡町"
      ticket_checker.purchased_ticket_price = 220

      expect(ticket_checker.go_out_enabled?).to eq true
    end
  end

  describe "#7 150円の切符を購入し十三で入場、岡町で出場した結果" do
    it "出場できない" do
      ticket_checker = TicketChecker.new
      ticket_checker.from_station = "十三"
      ticket_checker.to_station = "岡町"
      ticket_checker.purchased_ticket_price = 150

      expect(ticket_checker.go_out_enabled?).to eq false
    end
  end

  describe "#8 180円の切符を購入し十三で入場、岡町で出場した結果" do
    it "出場できる" do
      ticket_checker = TicketChecker.new
      ticket_checker.from_station = "十三"
      ticket_checker.to_station = "岡町"
      ticket_checker.purchased_ticket_price = 180

      expect(ticket_checker.go_out_enabled?).to eq true
    end
  end

  # describe "#9 180円の切符を購入し十三で入場、岡町で出場した結果" do
  #   it "出場できる" do
  #     ticket_checker = TicketChecker.new
  #     ticket_checker.from_station = "十三"
  #     ticket_checker.to_station = "岡町"
  #     ticket_checker.purchased_ticket_price = 180
  #
  #     expect(ticket_checker.go_out_enabled?).to eq true
  #   end
  # end

end

