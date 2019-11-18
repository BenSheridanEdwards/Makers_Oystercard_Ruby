require "oystercard"
describe OysterCard do

  describe "#initialize" do
    it "should initialize the class with a balance of zero" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#top_up" do
    it "should add given amount to balance" do
      subject.top_up(10)
      expect(subject.balance).to eq(10)
    end

    it "Should not push balance above £90" do
      subject.top_up(OysterCard::LIMIT)
      message = "£100 maximum balance exceeded. Current Balance: #{subject.balance}"
      expect{subject.top_up 1 }.to raise_error message
    end
  end

  describe "#deduct" do
    it "should deduct a specified fare from the users balance, then return the remaining balance" do
      subject.top_up(30)
      expect(subject.deduct(10)).to eq(20)
    end
end

end