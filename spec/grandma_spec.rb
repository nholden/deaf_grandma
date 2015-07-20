require_relative '../grandma.rb'

describe Grandma do
  describe 'Grandma.respond_to' do
    not_shouted_messages = ["Hi, Grandma.", "Are you feeling 100%?"]
    shouted_messages = not_shouted_messages.map { |message| message.upcase }

    context 'when message is not shouted' do
      not_shouted_messages.each do |message|
        it "should respond correctly" do
          expect(Grandma.respond_to(message)).to eql("HUH?  SPEAK UP, SONNY!")
        end
      end
    end

    context 'when message is shouted' do
      shouted_messages.each do |message|
        it "should respond correctly" do
          expect(Grandma.respond_to(message)[0..12]).to eql("NO, NOT SINCE")
        end
        it "should respond with a year between 1930 and 1950" do
          expect(Grandma.respond_to(message)[-4..-1].to_i).to be_between(1930, 1950)
        end
      end
    end

  end
end
