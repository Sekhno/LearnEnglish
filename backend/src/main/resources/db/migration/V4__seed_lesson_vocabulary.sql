-- ============================================================
-- V4: Lesson-linked vocabulary for all 20 A1 lessons
-- Each entry uses lesson_id so it appears in the lesson's
-- Vocabulary tab. TTS is handled on the frontend via word text.
-- ============================================================

-- Lesson 1: Alphabet & Pronunciation
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'letter',      '/ˈletər/',        'буква',                     '["The letter A is the first letter of the alphabet.","Write the letters from A to Z."]',           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'vowel',       '/ˈvaʊəl/',        'гласная',                   '["A, E, I, O, U are vowels.","Every word has at least one vowel."]',                              'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'consonant',   '/ˈkɒnsənənt/',    'согласная',                 '["B, C, D are consonants.","English has 21 consonants."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'sound',       '/saʊnd/',         'звук',                      '["The sound of the letter C changes in different words.","Listen to the sound carefully."]',        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'spell',       '/spel/',          'произносить по буквам',     '["Can you spell your name, please?","She spells every new word."]',                               'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'alphabet',    '/ˈælfəbet/',      'алфавит',                   '["The English alphabet has 26 letters.","Learn the alphabet first."]',                            'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'pronounce',   '/prəˈnaʊns/',     'произносить',               '["How do you pronounce this word?","She pronounces English very well."]',                          'A1');

-- Lesson 2: Greetings & Introductions
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'greet',      '/ɡriːt/',         'приветствовать',            '["We greet our teacher every morning.","He greeted me with a smile."]',                           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'introduce',  '/ˌɪntrəˈdjuːs/',  'представлять',              '["Let me introduce myself.","She introduced her friend to me."]',                                'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'name',       '/neɪm/',          'имя',                       '["My name is Anna.","What is your name?"]',                                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'meet',       '/miːt/',          'познакомиться / встречать', '["Nice to meet you!","I meet my friends on Fridays."]',                                           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'nice',       '/naɪs/',          'приятный / хороший',        '["It is nice to meet you.","What a nice day!"]',                                                  'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'morning',    '/ˈmɔːrnɪŋ/',      'утро',                      '["Good morning! How are you?","I go to work every morning."]',                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'evening',    '/ˈiːvnɪŋ/',       'вечер',                     '["Good evening, everyone.","We have dinner in the evening."]',                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'pleasure',   '/ˈpleʒər/',       'удовольствие',              '["It is a pleasure to meet you.","The pleasure is mine."]',                                       'A1');

-- Lesson 3: Personal Pronouns
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'teacher',          '/ˈtiːtʃər/',      'учитель',                   '["She is my English teacher.","The teacher speaks clearly."]',                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'student',          '/ˈstjuːdənt/',    'студент / ученик',          '["He is a good student.","They are all students."]',                                              'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'friend',           '/frend/',         'друг',                      '["She is my best friend.","We are good friends."]',                                               'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'family',           '/ˈfæməli/',       'семья',                     '["They are my family.","We love our family."]',                                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'colleague',        '/ˈkɒliːɡ/',       'коллега',                   '["He is my colleague at work.","We work with our colleagues every day."]',                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'people',           '/ˈpiːpəl/',       'люди',                      '["They are nice people.","Many people study English."]',                                         'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'everyone',         '/ˈevriwʌn/',      'все / каждый',              '["Everyone likes music.","He knows everyone here."]',                                             'A1');

-- Lesson 4: Verb To Be
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'happy',                  '/ˈhæpi/',         'счастливый',                '["I am very happy today.","She is happy with her job."]',                                         'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'tired',                  '/ˈtaɪərd/',       'уставший',                  '["I am tired after work.","He is not tired yet."]',                                               'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'hungry',                 '/ˈhʌŋɡri/',       'голодный',                  '["Are you hungry? Let us eat.","I am not hungry, thank you."]',                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'doctor',                 '/ˈdɒktər/',       'доктор / врач',             '["My father is a doctor.","She is a good doctor."]',                                              'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'ready',                  '/ˈredi/',         'готовый',                   '["I am ready for the exam.","Are you ready? Let us go!"]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'young',                  '/jʌŋ/',           'молодой',                   '["She is young and smart.","They are very young."]',                                              'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'right',                  '/raɪt/',          'правильный',                '["You are right!","Is this the right answer?"]',                                                  'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'late',                   '/leɪt/',          'опоздавший / поздний',      '["He is late again.","I am sorry I am late."]',                                                   'A1');

-- Lesson 5: Articles
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'apple',                     '/ˈæpəl/',         'яблоко',                    '["I eat an apple every day.","An apple is a healthy fruit."]',                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'umbrella',                  '/ʌmˈbrelə/',      'зонтик',                    '["I have an umbrella in my bag.","Take an umbrella — it is raining."]',                           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'orange',                    '/ˈɒrɪndʒ/',       'апельсин',                  '["I want an orange, please.","An orange has a lot of vitamin C."]',                              'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'university',                '/ˌjuːnɪˈvɜːrsəti/', 'университет',             '["She studies at a university.","It is a good university."]',                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'hour',                      '/ˈaʊər/',         'час',                       '["I study for an hour every day.","We wait for an hour."]',                                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'animal',                    '/ˈænɪməl/',       'животное',                  '["A dog is a friendly animal.","The zoo has many animals."]',                                     'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'city',                      '/ˈsɪti/',         'город',                     '["London is a big city.","I live in the city."]',                                                 'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'book',                      '/bʊk/',           'книга',                     '["I read a book every week.","She has a book in her bag."]',                                      'A1');

-- Lesson 6: Nouns & Plurals
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'child',                '/tʃaɪld/',        'ребёнок (дети — children)', '["The child is playing in the garden.","Three children are in the park."]',                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'man',                  '/mæn/',           'мужчина (мн. — men)',       '["That man is my uncle.","Two men are waiting outside."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'woman',                '/ˈwʊmən/',        'женщина (мн. — women)',     '["The woman is a doctor.","Three women work in this office."]',                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'tooth',                '/tuːθ/',          'зуб (зубы — teeth)',        '["My tooth hurts.","Brush your teeth every day."]',                                               'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'foot',                 '/fʊt/',           'нога / ступня (мн. — feet)','["My foot hurts after the walk.","She has small feet."]',                                         'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'mouse',                '/maʊs/',          'мышь (мн. — mice)',         '["I saw a mouse in the kitchen.","The cat chases mice."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'leaf',                 '/liːf/',          'лист (мн. — leaves)',       '["A green leaf fell from the tree.","The leaves are beautiful in autumn."]',                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'knife',                '/naɪf/',          'нож (мн. — knives)',        '["I need a knife to cut the bread.","Put the knives on the table."]',                             'A1');

-- Lesson 7: Numbers, Dates & Time
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'number',          '/ˈnʌmbər/',       'число / номер',             '["What is your phone number?","I know numbers from 1 to 100."]',                                 'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'date',            '/deɪt/',          'дата',                      '["What is today''s date?","My birthday is on a great date."]',                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'minute',          '/ˈmɪnɪt/',        'минута',                    '["I will be ready in five minutes.","The lesson is sixty minutes long."]',                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'week',            '/wiːk/',          'неделя',                    '["I go to the gym three times a week.","Next week is a holiday."]',                               'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'month',           '/mʌnθ/',          'месяц',                     '["January is the first month.","I travel once a month."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'year',            '/jɪər/',          'год',                       '["I have studied English for one year.","Happy New Year!"]',                                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'birthday',        '/ˈbɜːrθdeɪ/',     'день рождения',             '["My birthday is in July.","Happy birthday to you!"]',                                            'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'today',           '/təˈdeɪ/',        'сегодня',                   '["What is the date today?","Today is Monday."]',                                                  'A1');

-- Lesson 8: Possessives
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'bag',                    '/bæɡ/',           'сумка',                     '["My bag is on the chair.","Is this your bag?"]',                                                 'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'key',                    '/kiː/',           'ключ',                      '["I cannot find my key.","Her keys are on the table."]',                                          'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'phone',                  '/fəʊn/',          'телефон',                   '["His phone is new.","Where is my phone?"]',                                                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'wallet',                 '/ˈwɒlɪt/',        'кошелёк',                   '["My wallet is in my pocket.","His wallet is black."]',                                           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'glasses',                '/ˈɡlɑːsɪz/',      'очки',                      '["These are my glasses.","Her glasses are on the table."]',                                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'jacket',                 '/ˈdʒækɪt/',       'куртка',                    '["Is this jacket yours?","His jacket is blue."]',                                                 'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'own',                    '/oʊn/',           'собственный',               '["I have my own room.","She has her own car."]',                                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'belong',                 '/bɪˈlɒŋ/',        'принадлежать',              '["This book belongs to me.","Who does this bag belong to?"]',                                     'A1');

-- Lesson 9: This, That, These, Those
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'this',               '/ðɪs/',           'этот / эта / это (рядом)',  '["This is my book.","This coffee is hot."]',                                                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'that',               '/ðæt/',           'тот / та / то (далеко)',    '["What is that?","That building is very old."]',                                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'these',              '/ðiːz/',          'эти (рядом)',               '["These are my keys.","These flowers are beautiful."]',                                           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'those',              '/ðoʊz/',          'те (далеко)',               '["Those mountains are far away.","Who are those people?"]',                                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'near',               '/nɪər/',          'близко / рядом',            '["The school is near my house.","Come near, please."]',                                           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'far',                '/fɑːr/',          'далеко',                    '["The station is far from here.","It is not far."]',                                              'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'here',               '/hɪər/',          'здесь',                     '["Come here, please.","My book is here."]',                                                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'there',              '/ðeər/',          'там',                       '["Your bag is over there.","I see a cat over there."]',                                           'A1');

-- Lesson 10: Have / Have Got
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'brother',             '/ˈbrʌðər/',       'брат',                      '["I have a brother.","My brother is fifteen years old."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'sister',              '/ˈsɪstər/',       'сестра',                    '["She has got two sisters.","My sister lives in London."]',                                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'pet',                 '/pet/',           'домашнее животное',         '["Have you got a pet?","My pet is a cat."]',                                                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'job',                 '/dʒɒb/',          'работа / должность',        '["He has a good job.","I have got a new job."]',                                                  'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'money',               '/ˈmʌni/',         'деньги',                    '["Do you have any money?","She has got a lot of money."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'problem',             '/ˈprɒbləm/',      'проблема',                  '["I have a problem.","Have you got any problems?"]',                                              'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'idea',                '/aɪˈdɪə/',        'идея',                      '["I have a great idea!","She has got no idea."]',                                                 'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'headache',            '/ˈhedeɪk/',       'головная боль',             '["I have a headache today.","She has got a terrible headache."]',                                 'A1');

-- Lesson 11: Present Simple
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'every',              '/ˈevri/',         'каждый',                    '["I eat breakfast every morning.","She reads every evening."]',                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'breakfast',          '/ˈbrekfəst/',     'завтрак',                   '["I have breakfast at 8 AM.","She eats toast for breakfast."]',                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'routine',            '/ruːˈtiːn/',      'распорядок дня',            '["My daily routine starts at 7 AM.","Exercise is part of my routine."]',                         'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'habit',              '/ˈhæbɪt/',        'привычка',                  '["Reading is a good habit.","He has a habit of walking every day."]',                             'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'usually',            '/ˈjuːʒuəli/',     'обычно',                    '["I usually wake up at 7.","She usually drinks coffee."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'always',             '/ˈɔːlweɪz/',      'всегда',                    '["I always brush my teeth.","She always helps me."]',                                             'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'work',               '/wɜːrk/',         'работать / работа',         '["I work in an office.","She works from home."]',                                                 'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'study',              '/ˈstʌdi/',        'учиться / изучать',         '["I study English every day.","He studies at university."]',                                      'A1');

-- Lesson 12: Adverbs of Frequency
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'always',          '/ˈɔːlweɪz/',      'всегда',                    '["I always drink coffee in the morning.","She always arrives on time."]',                         'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'usually',         '/ˈjuːʒuəli/',     'обычно',                    '["I usually go to bed at 10.","He usually walks to work."]',                                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'often',           '/ˈɒfən/',         'часто',                     '["We often eat together.","She often reads before bed."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'sometimes',       '/ˈsʌmtaɪmz/',     'иногда',                    '["I sometimes eat pizza.","He sometimes forgets his keys."]',                                     'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'rarely',          '/ˈreərli/',       'редко',                     '["I rarely watch TV.","She rarely eats meat."]',                                                  'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'never',           '/ˈnevər/',        'никогда',                   '["I never drink alcohol.","He never arrives late."]',                                             'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'occasionally',    '/əˈkeɪʒənəli/',   'изредка',                   '["I occasionally eat at a restaurant.","She occasionally travels abroad."]',                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'daily',           '/ˈdeɪli/',        'ежедневный / каждый день',  '["I do daily exercise.","He reads the news daily."]',                                             'A1');

-- Lesson 13: Question Words
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'question',           '/ˈkwɛstʃən/',     'вопрос',                    '["Ask a question in English.","I have a question for you."]',                                     'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'answer',             '/ˈɑːnsər/',       'ответ / отвечать',          '["What is the answer?","She answered the question correctly."]',                                  'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'reason',             '/ˈriːzən/',       'причина',                   '["Why is a word for reason.","What is the reason for this?"]',                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'place',              '/pleɪs/',         'место',                     '["Where asks about a place.","This is a beautiful place."]',                                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'age',                '/eɪdʒ/',          'возраст',                   '["How old asks about age.","She does not say her age."]',                                         'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'price',              '/praɪs/',         'цена',                      '["How much asks about price.","The price is very high."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'time',               '/taɪm/',          'время',                     '["When asks about time.","What time is it?"]',                                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'information',        '/ˌɪnfəˈmeɪʃən/', 'информация',                '["I need some information about this city.","Where can I find information?"]',                    'A1');

-- Lesson 14: There Is / There Are
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'park',           '/pɑːrk/',         'парк',                      '["There is a park near my house.","There are benches in the park."]',                             'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'hospital',       '/ˈhɒspɪtəl/',     'больница',                  '["There is a hospital on this street.","Is there a hospital nearby?"]',                           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'library',        '/ˈlaɪbrəri/',     'библиотека',                '["There is a library in the centre.","There are many books in the library."]',                     'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'shop',           '/ʃɒp/',           'магазин',                   '["There are many shops here.","There is a coffee shop on the corner."]',                          'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'street',         '/striːt/',        'улица',                     '["There is a café on this street.","There are many people on the street."]',                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'building',       '/ˈbɪldɪŋ/',       'здание',                    '["There is a big building in the centre.","There are many buildings in the city."]',               'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'neighbourhood',  '/ˈneɪbəhʊd/',     'район',                     '["There are many parks in my neighbourhood.","It is a safe neighbourhood."]',                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'station',        '/ˈsteɪʃən/',      'станция / вокзал',          '["There is a train station nearby.","Is there a bus station here?"]',                             'A1');

-- Lesson 15: Prepositions of Place & Time
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'behind',               '/bɪˈhaɪnd/',      'позади / за',               '["The cat is behind the sofa.","Stand behind the line."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'in front of',          '/ɪn frʌnt ɒv/',   'перед',                     '["The car is in front of the house.","She stood in front of the class."]',                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'between',              '/bɪˈtwiːn/',      'между',                     '["The bank is between the café and the shop.","Sit between your friends."]',                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'under',                '/ˈʌndər/',        'под',                       '["The dog is under the table.","My shoes are under the bed."]',                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'above',                '/əˈbʌv/',         'над',                       '["The lamp is above the table.","Look at the clouds above."]',                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'beside',               '/bɪˈsaɪd/',       'рядом / сбоку',             '["Sit beside me.","The shop is beside the bank."]',                                               'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'corner',               '/ˈkɔːrnər/',      'угол',                      '["The café is on the corner.","Turn left at the corner."]',                                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'inside',               '/ɪnˈsaɪd/',       'внутри',                    '["The keys are inside the bag.","Come inside, please."]',                                         'A1');

-- Lesson 16: Can / Can't
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'swim',                     '/swɪm/',          'плавать',                   '["Can you swim?","She can swim very well."]',                                                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'drive',                    '/draɪv/',         'водить машину',             '["He can drive a car.","I cannot drive a bus."]',                                                 'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'cook',                     '/kʊk/',           'готовить',                  '["She can cook Italian food.","Can you cook pasta?"]',                                            'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'sing',                     '/sɪŋ/',           'петь',                      '["He can sing beautifully.","She cannot sing in tune."]',                                         'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'dance',                    '/dɑːns/',         'танцевать',                 '["I can dance salsa.","They can dance very well."]',                                               'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'ride',                     '/raɪd/',          'ездить / кататься',         '["Can you ride a bike?","She can ride a horse."]',                                                'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'fly',                      '/flaɪ/',          'летать',                    '["Birds can fly.","Can you fly a plane?"]',                                                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'ability',                  '/əˈbɪlɪti/',      'способность / умение',      '["Swimming is a great ability.","She has the ability to speak French."]',                         'A1');

-- Lesson 17: Present Continuous
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'now',            '/naʊ/',           'сейчас',                    '["I am studying now.","What are you doing now?"]',                                                'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'moment',         '/ˈmoʊmənt/',      'момент',                    '["At this moment, I am reading.","What are you doing at the moment?"]',                           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'run',            '/rʌn/',           'бежать',                    '["She is running in the park.","He is running very fast."]',                                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'write',          '/raɪt/',          'писать',                    '["I am writing a letter.","She is writing an email now."]',                                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'watch',          '/wɒtʃ/',          'смотреть',                  '["They are watching a film.","She is watching TV now."]',                                         'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'wait',           '/weɪt/',          'ждать',                     '["I am waiting for the bus.","We are waiting for you."]',                                         'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'happen',         '/ˈhæpən/',        'происходить',               '["What is happening?","Something is happening outside."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'talk',           '/tɔːk/',          'говорить / разговаривать',  '["They are talking in the garden.","Stop talking, please."]',                                     'A1');

-- Lesson 18: Imperatives
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'open',                  '/ˈoʊpən/',        'открывать',                 '["Open the door, please.","Please open your books."]',                                            'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'close',                 '/kloʊz/',         'закрывать',                 '["Close the window.","Please close your books."]',                                                'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'listen',                '/ˈlɪsən/',        'слушать',                   '["Listen carefully.","Listen to the teacher."]',                                                  'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'repeat',                '/rɪˈpiːt/',       'повторять',                 '["Repeat after me.","Please repeat the question."]',                                              'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'stand',                 '/stænd/',         'стоять / встать',           '["Stand up, please.","Do not stand on the chair."]',                                              'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'sit',                   '/sɪt/',           'сидеть / сесть',            '["Sit down, please.","Sit next to your friend."]',                                                'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'stop',                  '/stɒp/',          'остановиться / прекратить', '["Stop talking!","Stop and listen."]',                                                            'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'turn',                  '/tɜːrn/',         'поворачивать',              '["Turn left at the corner.","Turn the page, please."]',                                           'A1');

-- Lesson 19: Some / Any & Countability
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'bread',                    '/bred/',           'хлеб',                     '["Can I have some bread?","There is not any bread left."]',                                       'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'milk',                     '/mɪlk/',           'молоко',                   '["I would like some milk.","Is there any milk in the fridge?"]',                                  'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'sugar',                    '/ˈʃʊɡər/',         'сахар',                    '["I do not put any sugar in my tea.","Can I have some sugar, please?"]',                           'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'coffee',                   '/ˈkɒfi/',          'кофе',                     '["Would you like some coffee?","There is not any coffee left."]',                                 'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'bottle',                   '/ˈbɒtəl/',         'бутылка',                  '["There is a bottle of water on the table.","Do we have any bottles?"]',                          'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'glass',                    '/ɡlɑːs/',          'стакан',                   '["Can I have a glass of water?","There are some glasses in the cupboard."]',                      'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'piece',                    '/piːs/',           'кусок / кусочек',          '["Can I have a piece of cake?","He ate some pieces of bread."]',                                  'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'cup',                      '/kʌp/',            'чашка',                    '["I would like a cup of tea.","There are some cups in the kitchen."]',                            'A1');

-- Lesson 20: Basic Adjectives
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'big',              '/bɪɡ/',           'большой',                   '["This is a big house.","He has a big smile."]',                                                  'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'small',            '/smɔːl/',         'маленький',                 '["I live in a small flat.","She has a small dog."]',                                               'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'old',              '/oʊld/',          'старый',                    '["He drives an old car.","This is a very old building."]',                                        'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'new',              '/njuː/',          'новый',                     '["I have a new phone.","She wears new shoes."]',                                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'hot',              '/hɒt/',           'горячий',                   '["The coffee is very hot.","It is a hot day today."]',                                            'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'cold',             '/koʊld/',         'холодный',                  '["The water is cold.","It is cold outside."]',                                                    'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'happy',            '/ˈhæpi/',         'счастливый',                '["She looks happy today.","I am very happy!"]',                                                   'A1'),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'beautiful',        '/ˈbjuːtɪfəl/',    'красивый',                  '["What a beautiful day!","She has a beautiful smile."]',                                          'A1');
