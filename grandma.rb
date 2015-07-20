class Grandma
  attr_accessor :bye_count

  def initialize
    @bye_count = 0
  end 

  def respond_to(message)
    if message == "BYE"
      @bye_count += 1
    else
      @bye_count = 0
    end

    if message == message.upcase
      "NO, NOT SINCE " + Random.new.rand(1930..1950).to_s
    else
      "HUH?  SPEAK UP, SONNY!"
    end
  end
end
