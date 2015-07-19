require_relative '../deaf_grandma.rb'

describe Grandma do
  describe 'Grandma.respond_to' do
    it "should respond correctly to speaking normally" do
      expect(Grandma.respond_to('Hi, Grandma.')).to eql("HUH?  SPEAK UP, SONNY!")
    end
    it "should respond correctly to shouting" do
      expect(Grandma.respond_to('HI, GRANDMA.')[0..12]).to eql("NO, NOT SINCE")
    end
  end
end
