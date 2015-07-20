require_relative '../grandma.rb'

describe Grandma do
  describe 'respond_to' do
    before(:each) do
      @grandma = Grandma.new
    end

    not_shouted_messages = ['Hi, Grandma.', 'Are you feeling 100%?']
    shouted_messages = not_shouted_messages.map { |message| message.upcase }

    context 'when message is not shouted' do
      not_shouted_messages.each do |message|
        it 'should respond correctly' do
          expect(@grandma.respond_to(message)).to eql('HUH?  SPEAK UP, SONNY!')
        end
        it 'should reset bye_count' do
          @grandma.respond_to('BYE')
          expect{@grandma.respond_to(message)}.to change {@grandma.bye_count}.by(-1)
        end 
      end
    end

    context 'when message is shouted' do
      shouted_messages.each do |message|
        it 'should respond correctly' do
          expect(@grandma.respond_to(message)[0..12]).to eql('NO, NOT SINCE')
        end
        it 'should respond with a year between 1930 and 1950' do
          expect(@grandma.respond_to(message)[-4..-1].to_i).to be_between(1930, 1950)
        end
        it 'should reset bye_count' do
          @grandma.respond_to('BYE')
          expect{@grandma.respond_to(message)}.to change {@grandma.bye_count}.by(-1)
        end 
      end
    end

    context 'when message is BYE' do
      context 'when did not hear BYE' do
        it 'should add 1 to bye_count' do
          expect{@grandma.respond_to('BYE')}.to change {@grandma.bye_count}.by(1)
        end
        it 'should respond correctly' do
          expect(@grandma.respond_to('BYE')[0..12]).to eql('NO, NOT SINCE')
        end
      end
   
      context 'when heard BYE' do
        before(:each) do
          allow(@grandma).to receive(:heard_bye?).and_return(true)
        end

        it 'should add 1 to bye_count' do
          expect{@grandma.respond_to('BYE')}.to change {@grandma.bye_count}.by(1)
        end
        it 'should respond correctly' do
          expect(@grandma.respond_to('BYE')).to eql('GOODBYE, SONNY!')
        end
      end
    end
  end

  describe 'heard_bye?' do
    before(:each) do
      @grandma = Grandma.new
    end

    context 'when bye_count is 0' do
      it 'should return false' do
        expect(@grandma.heard_bye?).to eql(false)
      end
    end

    context 'when bye_count is 3' do
      before(:each) do
        @grandma.instance_variable_set(:@bye_count, 3)
      end

      it 'should return true' do
        expect(@grandma.heard_bye?).to eql(true)
      end
    end
  end
end
