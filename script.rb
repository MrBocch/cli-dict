require 'sqlite3'

input_word = ARGV 

if input_word.length == 0
  raise "What do i look up?"
end

if input_word.length > 1 
  raise "No more than 1 words"
end 

w = input_word.first 

p w

# before index 
# lookup Vanity 60ms

# after index 