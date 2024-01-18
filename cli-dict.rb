require 'sqlite3'

input_word = ARGV 

if input_word.length == 0
  puts "\nHow to use me"
  puts "cli-dict <word>"
  return
end

if input_word.length > 1 
  puts "\nOne word at a time please"
  return
end 

current_dir = __dir__
db_file = File.join(current_dir, 'dictionary.db')

# i should add some error handling incase 
db = SQLite3::Database.open db_file

w = input_word.first .capitalize

query = 'SELECT def FROM words WHERE word = ?'
result = (db.execute query, w).first
# They are multiple definitions on certain words, ill just show up the first one 
db.close

if result.nil?
  puts "\nAre you sure you did not misspell \"#{input_word.first}\"\n"
  puts "If not then word is not in database"
  return
end

puts "\n #{w} \n #{result.first} \n\n"
