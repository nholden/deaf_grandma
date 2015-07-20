require './grandma.rb'

grandma = Grandma.new

while true
  print "You: "
  response = grandma.respond_to(gets.chomp!)
  break if grandma.bye_count >= 3
  puts "Grandma: " + response
end

puts "Grandma: GOODBYE, SONNY!"
