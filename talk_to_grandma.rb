require './grandma.rb'

bye_count = 0

while bye_count < 3
  print "You: "
  message = gets.chomp!
  bye_count += 1 if message == "BYE"
  puts "Grandma: " + Grandma.respond_to(message) if bye_count < 3
end

puts "Grandma: GOODBYE, SONNY!"
