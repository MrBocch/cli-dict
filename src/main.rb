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

current_dir = __dir__
db_file = File.join(current_dir, 'dictionary.db')

# i should add some error handling incase 
db = SQLite3::Database.open db_file

w = ARGV.first.capitalize

query = 'SELECT def FROM words WHERE word = ?'
result = (db.execute query, w).flatten

db.close

if result.nil? or result.empty?
  puts "\nAre you sure you did not misspell \"#{w}\"\n"
  puts "If not then \"#{w}\" is not in database"
  return
end

puts "\n #{w}" 

result.each do |d|
  puts "\n- #{d}\n"  
end
