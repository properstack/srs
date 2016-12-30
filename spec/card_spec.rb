require "rails_helper"


describe Card do
  it "instantiates with question and answer" do
    instance = Card.new
    expect(instance.answer).to eq(nil)
  end
end
