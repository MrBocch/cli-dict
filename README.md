# CLI Dictionary 

Got the dictionary (here)[https://www.bragitoff.com/2016/03/english-dictionary-in-csv-format/]

(ruby sqlite interface)[https://rubygems.org/gems/sqlite3]

should i use a virtual enviorment?

OBJECTIVE
CLI-APP
where i could look up a word, and get back its 
definition, 

Im planning on storing all the words and definitions 
using sqlite3

In the csv a new line would look like this 

```"Abhominal","a.","Inhuman."```

I dont like the middle part and i want it gone
but what if i just dont show it in the database

Thinking i will have only one table, 

words 
| id | word | definition |

CREATE TABLE words (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   word TEXT,
   def TEXT
);

i want to make script that adds every line from csv
into this database

CREATE INDEX idx_word ON words(word);
creating a index made so much more quicker? how do i test that? 