require 'sqlite3'

input_word = ARGV 

if input_word.length == 0
  raise "What do i look up?"
end

if input_word.length > 1 
  raise "No more than 1 words"
end 

# i should add some error handling incase 
db = SQLite3::Database.open '.\db\dictionary.db'

w = input_word.first .capitalize

query = 'SELECT def FROM words WHERE word = ?'
result = (db.execute query, w).first
# They are multiple definitions on certain words, ill just show up the first one 
db.close

if result.nil?
  raise "Are you sure you did not misspell?\nIf not then word is not in database"
end

puts "\n #{w} \n #{result.first} \n\n"
