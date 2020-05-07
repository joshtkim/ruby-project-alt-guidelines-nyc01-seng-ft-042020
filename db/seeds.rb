
Reader.delete_all
Writer.delete_all
Webtoon.delete_all

#readers
r1 = Reader.create(name: "Josh Kim", age: 27)
r2 = Reader.create(name: "Jessica Kim", age: 30)
r3 = Reader.create(name: "Sonia Yoon", age: 27)
r4 = Reader.create(name: "Kevin Kim", age: 45)
r5 = Reader.create(name: "James Kim", age: 19)

#writers
w1 = Writer.create(name: "Kelvin Moon", years_of_experience: 4)
w2 = Writer.create(name: "Wonjae Jang", years_of_experience: 5)
w3 = Writer.create(name: "Mira Mirror", years_of_experience: 1)
w4 = Writer.create(name: "Alexis Trevor", years_of_experience: 3)
w5 = Writer.create(name: "Jack Nickel", years_of_experience: 6)

#webtoons
Webtoon.create(title: "baseball", writer_id: w1.id,reader_id: r1.id, release_day: "monday")
Webtoon.create(title: "college life", writer_id: w1.id,reader_id: r2.id, release_day: "monday")
Webtoon.create(title: "the secret life of a software engineer", writer_id: w3.id,reader_id: r3.id, release_day: "monday")
Webtoon.create(title: "dungeons, bosses, adventures", writer_id: w5.id,reader_id: r4.id, release_day: "monday")
Webtoon.create(title: "galatic battles on stars", writer_id: w2.id,reader_id: r5.id, release_day: "tuesday")
Webtoon.create(title: "basketball", writer_id: w2.id,reader_id: r1.id, release_day: "tuesday")
Webtoon.create(title: "the fury of the 5", writer_id: w4.id,reader_id: r2.id, release_day: "tuesday")
Webtoon.create(title: "ping pong masters", writer_id: w5.id,reader_id: r3.id, release_day: "wednesday")
Webtoon.create(title: "the old, the new, and the now", writer_id: w5.id,reader_id: r4.id, release_day: "wednesday")
Webtoon.create(title: "vampires and werewolves", writer_id: w1.id,reader_id: r5.id, release_day: "thursday")
Webtoon.create(title: "the bastion", writer_id: w1.id,reader_id: r1.id, release_day: "thursday")
Webtoon.create(title: "legends of the league", writer_id: w2.id,reader_id: r2.id, release_day: "thursday")
Webtoon.create(title: "echo 5 forever", writer_id: w2.id,reader_id: r3.id, release_day: "thursday")
Webtoon.create(title: "behind ally lines", writer_id: w4.id,reader_id: r4.id, release_day: "friday")
Webtoon.create(title: "the necklace and the ring", writer_id: w4.id,reader_id: r5.id, release_day: "friday")
Webtoon.create(title: "once a dynasty, forever a dynasty", writer_id: w5.id,reader_id: r1.id, release_day: "friday")
Webtoon.create(title: "to rule, one needs to be ruled", writer_id: w5.id,reader_id: r2.id, release_day: "friday")
Webtoon.create(title: "the unfair, the unjust, and the judge", writer_id: w1.id,reader_id: r3.id, release_day: "saturday")
Webtoon.create(title: "the trash talker", writer_id: w2.id,reader_id: r4.id, release_day: "saturday")
Webtoon.create(title: "the untouchable", writer_id: w2.id,reader_id: r5.id, release_day: "saturday")



