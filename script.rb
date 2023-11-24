require 'csv'
require 'sqlite3'

# script for extracting data from csv into 
# sqlite db
# this is soo slow 
# you have to insert in batches

db = SQLite3::Database.open "dict.db"

query = "INSERT INTO words (word, def) VALUES (?, ?)"
CSV.foreach("dict.csv") do |row|
  # db.execute "INSERT INTO words (word, def) VALUES ('#{row[0]}', '#{row[2]}')"
  db.execute(query, row[0], row[2])
end

# halted here, will delete this, see if it works
# "A-","","A, as a prefix to English words, is derived from various sources. (1) It frequently signifies on or in (from an, a forms of AS. on), denoting a state, as in afoot, on foot, abed, amiss, asleep, aground, aloft, away (AS. onweg), and analogically, ablaze, atremble, etc. (2) AS. of off, from, as in adown (AS. ofd/ne off the dun or hill). (3) AS. a- (Goth. us-, ur-, Ger. er-), usually giving an intensive force, and sometimes the sense of away, on, back, as in arise, abide, ago. (4) Old English y- or i- (corrupted from the AS. inseparable particle ge-, cognate with OHG. ga-, gi-, Goth. ga-), which, as a prefix, made no essential addition to the meaning, as in aware. (5) French a (L. ad to), as in abase, achieve. (6) L. a, ab, abs, from, as in avert. (7) Greek insep. prefix / without, or privative, not, as in abyss, atheist; akin to E. un-."
# i dont know why this is cuasing issues 
# C:/Ruby32-x64/lib/ruby/gems/3.2.0/gems/sqlite3-1.6.8-x64-mingw-ucrt/lib/sqlite3/database.rb:165:in `initialize': near "s": syntax error (SQLite3::SQLException)
# this is not what is wrong 

=begin
he error message you're getting (near "s": syntax error) typically indicates a problem with an apostrophe (') in the data being inserted, as it might conflict with the single quotes used in the SQL query.

To handle potential issues with single quotes in your data, you can use SQL parameter binding to safely insert data into your SQLite database. Parameter binding helps prevent SQL injection and handles special characters in the data.

Here's an example of how you can modify your code to use parameter binding:
=end 

