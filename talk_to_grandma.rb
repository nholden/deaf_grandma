require './grandma.rb'

grandma = Grandma.new
puts 'Grandma: HELLO, SONNY!'

until grandma.heard_bye? 
  print 'You: '
  puts 'Grandma: ' + grandma.respond_to(gets.chomp!)
end
