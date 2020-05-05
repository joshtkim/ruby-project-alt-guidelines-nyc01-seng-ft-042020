
Reader.delete_all
Writer.delete_all
Webtoon.delete_all

#readers
r1 = Reader.create(name: "Josh", age: 27)
r2 = Reader.create(name: "Jessica", age: 30)
r3 = Reader.create(name: "Sonia:", age: 27)
r4 = Reader.create(name: "Kevin", age: 45)
r5 = Reader.create(name: "James", age: 19)

#writers
w1 = Writer.create(name: "Kevlin", years_of_experience: 4)
w2 = Writer.create(name: "Wonjae", years_of_experience: 5)
w3 = Writer.create(name: "Mira", years_of_experience: 1)
w4 = Writer.create(name: "Alexis", years_of_experience: 3)
w5 = Writer.create(name: "Jack", years_of_experience: 6)

#webtoons
Webtoon.create(title: "Baseball", writer_id: w1.id,reader_id: r1.id, release_day: "Monday")
Webtoon.create(title: "College Life", writer_id: w1.id,reader_id: r2.id, release_day: "Monday")
Webtoon.create(title: "The Secret Life of a Software Engineer", writer_id: w3.id,reader_id: r3.id, release_day: "Monday")
Webtoon.create(title: "Dungeons, Bosses, Adventures", writer_id: w5.id,reader_id: r4.id, release_day: "Monday")
Webtoon.create(title: "Galatic Battles on Stars", writer_id: w2.id,reader_id: r5.id, release_day: "Tuesday")
Webtoon.create(title: "Basketball", writer_id: w2.id,reader_id: r1.id, release_day: "Tuesday")
Webtoon.create(title: "The Fury of the 5", writer_id: w4.id,reader_id: r2.id, release_day: "Tuesday")
Webtoon.create(title: "Ping Pong Masters", writer_id: w5.id,reader_id: r3.id, release_day: "Wednesday")
Webtoon.create(title: "The Old, The New, and The Now", writer_id: w5.id,reader_id: r4.id, release_day: "Wednesday")
Webtoon.create(title: "Vampires and Werewolves", writer_id: w1.id,reader_id: r5.id, release_day: "Thursday")
Webtoon.create(title: "The Bastion", writer_id: w1.id,reader_id: r1.id, release_day: "Thursday")
Webtoon.create(title: "Legends of the League", writer_id: w2.id,reader_id: r2.id, release_day: "Thursday")
Webtoon.create(title: "Echo 5 Forever", writer_id: w2.id,reader_id: r3.id, release_day: "Thursday")
Webtoon.create(title: "Behind Ally Lines", writer_id: w4.id,reader_id: r4.id, release_day: "Friday")
Webtoon.create(title: "The Necklace and The Ring", writer_id: w4.id,reader_id: r5.id, release_day: "Friday")
Webtoon.create(title: "Once a Dynasty, Forever a Dynasty", writer_id: w5.id,reader_id: r1.id, release_day: "Friday")
Webtoon.create(title: "To Rule, One Needs to be Ruled", writer_id: w5.id,reader_id: r2.id, release_day: "Friday")
Webtoon.create(title: "The Unfair, The Unjust, and The Judge", writer_id: w1.id,reader_id: r3.id, release_day: "Saturday")
Webtoon.create(title: "The Trash Talker", writer_id: w2.id,reader_id: r4.id, release_day: "Saturday")
Webtoon.create(title: "The Untouchable", writer_id: w2.id,reader_id: r5.id, release_day: "Saturday")



