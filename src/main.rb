require 'sqlite3'

if ARGV.length == 0
  puts "\nHow to use me"
  puts "cli-dict <word>"
  return
end

if ARGV.length > 1 
  puts "\nOne word at a time please"
  return
end 

def search word
  db_file = File.join(__dir__, 'dictionary.db')
  db = SQLite3::Database.open db_file
  query = 'SELECT def FROM words WHERE word = ?'

  result = (db.execute query, word).flatten

  db.close

  return result
end


w = ARGV.first.capitalize
result = search w

if result.nil? or result.empty?
  puts "\nAre you sure you did not misspell \"#{w}\"\n"
  puts "If not then \"#{w}\" is not in database"
  return
end

puts "\n #{w}" 

result.each do |d|
  puts "\n- #{d}\n"  
end
