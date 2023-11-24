require 'csv'
require 'sqlite3'

# i should test, which is faster

db = SQLite3::Database.open "testdic.db"

db.execute "BEGIN TRANSACTION;"

query = "INSERT INTO words (word, def) VALUES (?, ?)"
insert_q = db.prepare "INSERT INTO words (word, def) VALUES (?, ?)"

batch_size = 1000
CSV.foreach('dict.csv') do |row|
  insert_q.execute row[0], row[2]
  batch_size -= 1

  if batch_size.zero?
    db.execute "COMMIT; BEGIN TRANSACTION;"
    batch_size = 1000
  end
end

db.execute "COMMIT;"
insert_q.close

=begin
db.execute "INSERT INTO words (word, def) VALUES ('#{row[0]}', '#{row[2]}')"

he error message you're getting (near "s": syntax error) typically indicates a problem with an apostrophe (') in the data being inserted, as it might conflict with the single quotes used in the SQL query.

To handle potential issues with single quotes in your data, you can use SQL parameter binding to safely insert data into your SQLite database. Parameter binding helps prevent SQL injection and handles special characters in the data.

Here's an example of how you can modify your code to use parameter binding:

what i was doing wrong is, all the data in csv could be anything
you need to use prepared statements when dealing with data that could 
be anything, also protects you from SQL injects
=end 

=begin 
performance 

going line by line, writing to disk is very slow, use transactions
and batch processing, reducing writing to disk,

prepared statements, precompiled SQL statement 

this is so slow 
query = "INSERT INTO words (word, def) VALUES (?, ?)"
CSV.foreach("dict.csv") do |row|
  db.execute(query, row[0], row[2])
end

=end