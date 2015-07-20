class Grandma
  attr_accessor :bye_count

  def initialize
    @bye_count = 0
  end 

  def heard_bye?
    if @bye_count < 3
      false
    else
      true
    end
  end

  def respond_to(message)
    if message == 'BYE'
      @bye_count += 1
    else
      @bye_count = 0
    end

    if message == 'BYE' and heard_bye?
      "GOODBYE, SONNY!"
    elsif message == message.upcase
      "NO, NOT SINCE #{rand(1930..1950)}"
    else
      'HUH?  SPEAK UP, SONNY!'
    end
  end
end
