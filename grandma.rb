class Grandma
  def self.respond_to(message)
    if message.match(/^[^a-z]*$/)
      "NO, NOT SINCE " + Random.new.rand(1930..1950).to_s
    else
      "HUH?  SPEAK UP, SONNY!"
    end
  end
end
