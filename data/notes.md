# NOTES 

Got the dictionary [here](https://www.bragitoff.com/2016/03/english-dictionary-in-csv-format/)

I found a even more intensive dictionary 
[here](https://github.com/benjihillard/English-Dictionary-Database)

why are their words missing from the db when i import csv into table?

they are 188536 lines in csv but only 177ish in db? (word wrapping?), how do i find the difference?

[ruby sqlite interface](https://rubygems.org/gems/sqlite3)

.mode box is so cool, how do i make some thing similar?

should i use a virtual enviorment? 


CREATE INDEX idx_word ON words(word);
creating a index made so much more quicker? how do i test that? 

maybe i dont need a id, just taking up uneccasry space