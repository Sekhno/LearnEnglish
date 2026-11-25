-- ============================================================
-- V8: Lesson-linked vocabulary for all 18 A2 lessons
-- Each entry uses lesson_id so it appears in the lesson's
-- Vocabulary tab. 7-8 words per lesson = ~135 entries total.
-- ============================================================

-- Lesson 1: Past Simple (a2-past-simple)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'yesterday',   '/ˈjestədeɪ/',   'вчора',                 '["I went to the market yesterday.","Yesterday was a beautiful day."]',                        'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'ago',         '/əˈɡəʊ/',        'тому назад',            '["We moved here two years ago.","She called me five minutes ago."]',                          'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'last',        '/lɑːst/',        'минулий / останній',    '["I saw him last week.","Last summer was very hot."]',                                        'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'suddenly',    '/ˈsʌdənli/',     'раптово',               '["Suddenly it started to rain.","She suddenly remembered his name."]',                        'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'return',      '/rɪˈtɜːn/',      'повертатися',           '["He returned home late at night.","She returned the book to the library."]',                 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'holiday',     '/ˈhɒlɪdeɪ/',     'відпустка / свято',     '["We went to Greece on holiday.","Last holiday we visited Rome."]',                           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'describe',    '/dɪˈskraɪb/',    'описувати',             '["Can you describe what happened?","She described the man to the police."]',                   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'event',       '/ɪˈvent/',       'подія',                 '["It was a big event in my life.","Tell me about an important event."]',                       'A2');

-- Lesson 2: Past Continuous (a2-past-continuous)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'while',      '/waɪl/',         'поки / тоді як',        '["I was cooking while she was reading.","While you were sleeping, it snowed."]',               'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'interrupt',  '/ˌɪntəˈrʌpt/',   'переривати',            '["The phone call interrupted our dinner.","Sorry to interrupt, but it is urgent."]',            'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'meanwhile',  '/ˈmiːnwaɪl/',    'тим часом',             '["Meanwhile, the others were waiting outside.","She worked; meanwhile he cleaned."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'background', '/ˈbækɡraʊnd/',   'фон / задній план',     '["In the background, music was playing.","I could hear voices in the background."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'scene',      '/siːn/',          'сцена / місце події',   '["Describe the scene you saw yesterday.","The scene was very dramatic."]',                    'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'at that moment', '/æt ðæt ˈməʊmənt/', 'в той момент', '["At that moment, she was laughing.","What were you doing at that moment?"]',                 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'storm',      '/stɔːm/',         'буря / гроза',          '["A storm was coming while we were walking.","They were driving when the storm started."]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'knock',      '/nɒk/',           'стукати',               '["Someone was knocking on the door.","I heard a knock while I was sleeping."]',               'A2');

-- Lesson 3: Future with Will (a2-future-will)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'probably',    '/ˈprɒbəbli/',    'мабуть / напевно',      '["It will probably rain tomorrow.","She will probably be late."]',                            'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'definitely',  '/ˈdefɪnɪtli/',   'точно / безумовно',     '["I will definitely call you later.","He will definitely pass the exam."]',                   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'promise',     '/ˈprɒmɪs/',      'обіцяти / обіцянка',    '["I promise I will be on time.","She promised to help me."]',                                 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'offer',       '/ˈɒfər/',         'пропонувати / пропозиція', '["I will offer to help them.","She offered me a cup of tea."]',                          'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'predict',     '/prɪˈdɪkt/',     'передбачати',           '["Nobody can predict the future.","He predicted that prices would rise."]',                  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'refuse',      '/rɪˈfjuːz/',     'відмовлятися',          '["She refused to answer the question.","He will refuse if you ask him now."]',               'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'decision',    '/dɪˈsɪʒən/',     'рішення',               '["I will make a decision tomorrow.","It was a difficult decision."]',                        'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'certain',     '/ˈsɜːtən/',      'впевнений / певний',    '["I am certain he will come.","Are you certain about that?"]',                              'A2');

-- Lesson 4: Be Going To (a2-be-going-to)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'plan',        '/plæn/',          'планувати / план',      '["I am going to plan my holiday.","What are your plans for the summer?"]',                   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'intend',      '/ɪnˈtend/',       'мати намір',            '["I intend to study harder this year.","She intends to move abroad."]',                      'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'evidence',    '/ˈevɪdəns/',      'ознака / доказ',        '["Look at the clouds — evidence of rain!","There is no evidence of that."]',                 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'intention',   '/ɪnˈtenʃən/',     'намір',                 '["My intention is to finish early.","She has no intention of stopping."]',                   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'preparation', '/ˌprepəˈreɪʃən/', 'підготовка',            '["Preparation is important before a trip.","The preparations are almost ready."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'apply',       '/əˈplaɪ/',        'подаватися / застосовувати', '["She is going to apply for the job.","Did you apply for a visa?"]',               'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'notice',      '/ˈnəʊtɪs/',       'помічати / повідомлення', '["I noticed dark clouds — it is going to rain.","Did you notice anything strange?"]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'sign',        '/saɪn/',           'ознака / знак',         '["Dark clouds are a sign of rain.","That is a sign that something is wrong."]',             'A2');

-- Lesson 5: Present Continuous for Future (a2-present-continuous-future)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'appointment', '/əˈpɔɪntmənt/', 'зустріч / прийом', '["I have a doctor''s appointment tomorrow.","She confirmed the appointment."]',          'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'schedule',   '/ˈʃedjuːl/',    'розклад / графік',  '["Check the schedule for tomorrow.","My schedule is very busy this week."]',            'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'arrange',    '/əˈreɪndʒ/',    'домовлятися / організовувати', '["Can we arrange a meeting?","She arranged everything in advance."]',       'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'confirm',    '/kənˈfɜːm/',    'підтверджувати',    '["Please confirm your booking by email.","He confirmed the time of arrival."]',         'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'cancel',     '/ˈkænsəl/',     'скасовувати',       '["We had to cancel the trip.","She cancelled the meeting at the last minute."]',        'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'flight',     '/flaɪt/',        'рейс / політ',      '["I am catching a flight at 7 AM.","Did you book your flight yet?"]',                  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'booking',    '/ˈbʊkɪŋ/',      'бронювання',        '["I am making a hotel booking for next weekend.","Your booking is confirmed."]',         'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'attend',     '/əˈtend/',       'відвідувати / бути присутнім', '["Are you attending the conference?","She is attending a wedding on Saturday."]', 'A2');

-- Lesson 6: Comparatives & Superlatives (a2-comparatives-superlatives)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'expensive',    '/ɪkˈspensɪv/',  'дорогий',           '["This hotel is more expensive than the other one.","Gold is the most expensive."]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'comfortable',  '/ˈkʌmftəbəl/',  'зручний',           '["This chair is more comfortable.","It is the most comfortable sofa I have sat on."]','A2'),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'popular',      '/ˈpɒpjʊlər/',   'популярний',        '["This restaurant is more popular than that one.","It is the most popular dish."]',  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'modern',       '/ˈmɒdən/',       'сучасний',          '["The new building is more modern.","This is the most modern museum in the city."]',  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'similar',      '/ˈsɪmɪlər/',    'схожий',            '["Your bag is similar to mine.","These two cars are very similar."]',                 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'difference',   '/ˈdɪfrəns/',    'різниця / відмінність', '["What is the difference between these two?","There is a big difference."]',       'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'further',      '/ˈfɜːðər/',     'далі / додатково',  '["The park is further than I thought.","Let''s discuss this further."]',              'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'equal',        '/ˈiːkwəl/',     'рівний / однаковий','["They are equal in height.","Treat everyone as equal."]',                            'A2');

-- Lesson 7: Much / Many / A Lot Of (a2-much-many-a-lot-of)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'quantity',  '/ˈkwɒntɪti/',   'кількість',           '["The quantity of food was not enough.","We need a large quantity of water."]',          'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'amount',    '/əˈmaʊnt/',      'сума / кількість',    '["A large amount of money was spent.","The amount of work is incredible."]',             'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'plenty',    '/ˈplenti/',      'вдосталь / багато',   '["There is plenty of time.","We have plenty of food for everyone."]',                   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'numerous',  '/ˈnjuːmərəs/',   'численний / багато',  '["There are numerous cafés in this city.","Numerous people attended the event."]',      'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'crowded',   '/ˈkraʊdɪd/',    'переповнений',        '["The market was very crowded.","Avoid crowded places during rush hour."]',               'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'traffic',   '/ˈtræfɪk/',     'рух / трафік',        '["There is too much traffic in the city.","How much traffic was there?"]',               'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'pollution', '/pəˈluːʃən/',   'забруднення',         '["There is a lot of pollution in big cities.","How much pollution is dangerous?"]',      'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'space',     '/speɪs/',        'місце / простір',     '["There is not much space in this room.","How many parking spaces are there?"]',         'A2');

-- Lesson 8: A Few / A Little / Enough (a2-a-few-a-little-enough)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'sufficient',  '/səˈfɪʃənt/',   'достатній',         '["The salary is sufficient for my needs.","We have sufficient time."]',               'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'shortage',    '/ˈʃɔːtɪdʒ/',    'нестача / дефіцит', '["There is a shortage of doctors in the village.","A shortage of water."]',            'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'spare',       '/speər/',        'зайвий / вільний',  '["I have a few spare minutes.","Do you have a spare pen?"]',                          'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'handful',     '/ˈhændfʊl/',    'жменя / небагато',  '["Only a handful of people came.","A handful of rice is enough."]',                   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'limit',       '/ˈlɪmɪt/',      'ліміт / межа',      '["There is a limit on the number of people.","Try to limit the amount of sugar."]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'available',   '/əˈveɪləbəl/',  'доступний / вільний', '["Are there any rooms available?","Only a few tickets are still available."]',      'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'resource',    '/rɪˈzɔːs/',     'ресурс',            '["We have very few resources.","Use your resources wisely."]',                        'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'barely',      '/ˈbeəli/',      'ледве / майже не',  '["I had barely enough time.","She barely spoke during the meeting."]',                'A2');

-- Lesson 9: Must / Have To / Should (a2-must-have-to-should)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'rule',           '/ruːl/',          'правило',           '["You must follow the rules.","It is a strict rule at school."]',                     'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'law',            '/lɔː/',           'закон',             '["Wearing a seatbelt is the law.","You must obey the law."]',                         'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'advice',         '/ədˈvaɪs/',       'порада',            '["Should is used to give advice.","Can I give you some advice?"]',                   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'necessary',      '/ˈnesəseri/',     'необхідний',        '["Is it necessary to book in advance?","It is not necessary to pay now."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'responsibility', '/rɪˌspɒnsəˈbɪlɪti/', 'відповідальність', '["You have a responsibility to arrive on time.","It is your responsibility."]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'compulsory',     '/kəmˈpʌlsəri/',   'обов''язковий',     '["PE is compulsory at this school.","Wearing a helmet is compulsory."]',             'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'recommend',      '/ˌrekəˈmend/',    'рекомендувати',     '["I recommend you should see a doctor.","She recommended trying the local food."]',  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'permission',     '/pəˈmɪʃən/',      'дозвіл',            '["You need permission to leave early.","Did you get permission to do that?"]',       'A2');

-- Lesson 10: Present Perfect — Introduction (a2-present-perfect-intro)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'experience',  '/ɪkˈspɪəriəns/',  'досвід / переживання', '["Have you ever had this experience?","It was an incredible experience."]',       'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'achievement', '/əˈtʃiːvmənt/',   'досягнення',          '["Winning the award was a great achievement.","List your achievements."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'recently',    '/ˈriːsəntli/',    'нещодавно',           '["I have recently moved to a new flat.","Have you seen her recently?"]',              'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'so far',      '/səʊ fɑːr/',      'до цих пір / поки що', '["So far, I have visited ten countries.","How many lessons have you done so far?"]', 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'once',        '/wʌns/',           'одного разу / один раз', '["I have only tried sushi once.","Once is enough!"]',                           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'twice',       '/twaɪs/',          'двічі',               '["She has been to Japan twice.","I have read this book twice."]',                   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'lifetime',    '/ˈlaɪftaɪm/',     'все життя / протягом  життя', '["It is a once-in-a-lifetime experience.","She has changed in her lifetime."]', 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'explore',     '/ɪkˈsplɔːr/',     'досліджувати',        '["Have you ever explored a foreign city alone?","I love to explore new places."]',  'A2');

-- Lesson 11: Present Perfect vs Past Simple (a2-present-perfect-vs-past)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'specific',    '/spəˈsɪfɪk/',   'конкретний / певний', '["Give me a specific time — use past simple.","I saw him at a specific time."]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'connection',  '/kəˈnekʃən/',   'зв''язок',            '["The present perfect shows a connection to now.","There is a connection here."]',  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'previous',    '/ˈpriːviəs/',   'попередній',          '["In my previous job, I worked in a shop.","She mentioned a previous visit."]',     'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'period',      '/ˈpɪəriəd/',    'період',              '["I lived in London for a long period.","During that period, she worked hard."]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'contrast',    '/ˈkɒntrɑːst/',  'контраст / протиставляти', '["Contrast the two tenses with these examples.","There is a clear contrast."]', 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'relevant',    '/ˈreləvənt/',   'доречний / актуальний', '["The result is relevant now — use present perfect.","Is this relevant today?"]', 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'definite',    '/ˈdefɪnɪt/',    'визначений / чіткий', '["A definite time needs past simple.","There was no definite answer."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'link',        '/lɪŋk/',         'зв''язок / пов''язувати', '["This experience is linked to the present.","The events link together."]',   'A2');

-- Lesson 12: Verb Patterns (a2-verb-patterns)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'mind',      '/maɪnd/',        'заперечувати / мати проти', '["Do you mind opening the window?","I don''t mind waiting."]',                       'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'avoid',     '/əˈvɔɪd/',       'уникати',                 '["Try to avoid making mistakes.","She avoids speaking in public."]',                   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'manage',    '/ˈmænɪdʒ/',      'справлятися / вдаватися', '["Did you manage to finish on time?","She managed to find a good hotel."]',            'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'fail',      '/feɪl/',          'не вдатися / провалитися', '["He failed to arrive on time.","She failed the exam."]',                            'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'consider',  '/kənˈsɪdər/',    'розглядати / вважати',    '["Consider moving to a bigger flat.","Have you considered applying?"]',                'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'pretend',   '/prɪˈtend/',     'вдавати',                 '["Stop pretending to be tired.","He pretended not to hear."]',                        'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'enjoy',     '/ɪnˈdʒɔɪ/',      'насолоджуватися',         '["I enjoy reading in the evening.","She enjoys cooking for friends."]',                'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'afford',    '/əˈfɔːd/',        'дозволяти собі',          '["Can you afford to buy a new car?","I can''t afford to miss work."]',                 'A2');

-- Lesson 13: Adverbs of Manner (a2-adverbs-manner)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'quickly',    '/ˈkwɪkli/',     'швидко',                '["She finished the test quickly.","He ran quickly to catch the bus."]',                 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'quietly',    '/ˈkwaɪətli/',   'тихо',                  '["Please speak quietly in the library.","She left the room quietly."]',                'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'carefully',  '/ˈkeərfəli/',   'обережно',              '["Drive carefully in bad weather.","She carefully read the instructions."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'fluently',   '/ˈfluːəntli/',  'вільно / безперешкодно', '["She speaks Spanish fluently.","He wants to speak English fluently."]',            'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'gradually',  '/ˈɡrædʒuəli/', 'поступово',             '["Her English improved gradually.","Things will gradually get better."]',              'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'immediately','/ɪˈmiːdiətli/', 'негайно',               '["Please respond immediately.","She immediately understood the problem."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'loudly',     '/ˈlaʊdli/',     'гучно',                 '["He spoke too loudly in the café.","She laughed loudly at the joke."]',               'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'badly',      '/ˈbædli/',      'погано',                '["The team played badly last night.","I badly need a holiday."]',                     'A2');

-- Lesson 14: First Conditional (a2-first-conditional)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'condition',   '/kənˈdɪʃən/',   'умова / стан',       '["If this condition is true, the result follows.","What condition is needed?"]',      'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'possibility', '/ˌpɒsəˈbɪlɪti/', 'можливість',       '["There is a real possibility of rain.","Think about the possibilities."]',          'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'consequence', '/ˈkɒnsɪkwəns/', 'наслідок',          '["If you don''t study, the consequence is failure.","Think of the consequences."]',  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'unless',      '/ənˈles/',       'якщо не / якщо тільки', '["Unless you hurry, you will be late.","I will stay unless you want me to go."]', 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'warn',        '/wɔːn/',          'попереджати',       '["I am warning you — if you do this, you will regret it.","She warned me."]',       'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'suppose',     '/səˈpəʊz/',      'припускати',        '["Suppose it rains — what will we do?","I suppose that is possible."]',              'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'likely',      '/ˈlaɪkli/',      'вірогідний / мабуть', '["It is likely that she will come.","If it rains, it is likely to be cold."]',    'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'situation',   '/ˌsɪtʃuˈeɪʃən/', 'ситуація',         '["Imagine this situation: if you lose your phone...","Think about the situation."]', 'A2');

-- Lesson 15: Infinitive of Purpose (a2-infinitive-purpose)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'purpose',     '/ˈpɜːpəs/',     'мета / призначення',  '["I went to the shop to buy milk — that is the purpose.","What is your purpose?"]', 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'goal',        '/ɡəʊl/',         'ціль / мета',         '["My goal is to speak English well.","Set a goal and work towards it."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'aim',         '/eɪm/',           'ціль / прагнути',     '["The aim of this lesson is to practise infinitives.","Aim to study daily."]',      'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'in order to', '/ɪn ˈɔːdər tuː/', 'для того щоб',      '["She studied hard in order to pass.","In order to improve, practise daily."]',     'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'benefit',     '/ˈbenɪfɪt/',     'користь / вигода',    '["Exercise to benefit your health.","What is the benefit of learning English?"]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'opportunity', '/ˌɒpəˈtjuːnɪti/', 'можливість / нагода', '["Use every opportunity to practise.","This is a great opportunity to learn."]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'improve',     '/ɪmˈpruːv/',     'покращувати',         '["I go to classes to improve my English.","She reads to improve her vocabulary."]',  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'save',        '/seɪv/',          'зберігати / заощаджувати', '["He walked to save money.","She turned off the light to save energy."]',    'A2');

-- Lesson 16: Too / Enough (a2-too-enough)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'excess',      '/ˈekses/',       'надлишок',              '["There is an excess of sugar in this drink.","Too much is an excess."]',              'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'lack',        '/læk/',           'нестача / брак',        '["He failed because of a lack of preparation.","There is a lack of time."]',          'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'suitable',    '/ˈsuːtəbəl/',    'відповідний / придатний', '["Is this restaurant suitable for children?","The weather is not suitable for a picnic."]', 'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'fit',         '/fɪt/',           'підходити / бути в формі', '["These shoes are too small — they don''t fit.","Is he fit enough to run?"]',      'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'impossible',  '/ɪmˈpɒsɪbəl/',  'неможливий',            '["The task is too hard — it is almost impossible.","Nothing is impossible."]',       'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'weak',        '/wiːk/',          'слабкий',               '["The coffee is too weak for me.","She was too weak to carry the bag."]',             'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'sharp',       '/ʃɑːp/',          'гострий',               '["The knife is sharp enough to cut the bread.","That angle is too sharp."]',         'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'mature',      '/məˈtʃʊər/',      'дорослий / зрілий',     '["Is she mature enough to live alone?","He is too young to be this mature."]',       'A2');

-- Lesson 17: Basic Relative Clauses (a2-relative-clauses)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'describe',   '/dɪˈskraɪb/',   'описувати',           '["Use who to describe a person.","Describe the place where you grew up."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'identify',   '/aɪˈdentɪfaɪ/', 'ідентифікувати',      '["That is the man who called.","Can you identify the object that was stolen?"]',      'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'refer',      '/rɪˈfɜːr/',     'посилатися / мати на увазі', '["Which refers to things, not people.","Who refers to the person."]',           'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'clause',     '/klɔːz/',        'речення / клауза',    '["A relative clause starts with who, which or that.","Add a relative clause."]',    'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'replace',    '/rɪˈpleɪs/',    'замінювати',          '["That can replace who or which.","Replace the noun with a pronoun."]',              'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'combine',    '/kəmˈbaɪn/',    'поєднувати',          '["Combine the two sentences using a relative clause.","Combine ideas clearly."]',   'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'location',   '/ləʊˈkeɪʃən/',  'місцезнаходження',    '["The city where I was born is small.","Where refers to a location."]',             'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'belong',     '/bɪˈlɒŋ/',      'належати',            '["The woman whose car was stolen called the police.","Whose shows belonging."]',    'A2');

-- Lesson 18: Everyday Requests (a2-everyday-requests)
INSERT INTO vocabulary_entries (lesson_id, word, ipa, translation, examples, level_code) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'polite',     '/pəˈlaɪt/',     'ввічливий',           '["Could is more polite than can.","It is polite to say please and thank you."]',     'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'formal',     '/ˈfɔːməl/',     'офіційний',           '["May I is very formal.","Use formal language in a job interview."]',                'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'grateful',   '/ˈɡreɪtfəl/',   'вдячний',             '["I am grateful for your help.","She felt grateful when he offered to help."]',    'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'request',    '/rɪˈkwest/',    'прохання / просити',  '["He made a polite request.","Could you help me? is a request."]',                  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'respond',    '/rɪˈspɒnd/',    'відповідати',         '["Respond politely to a request.","How do you respond to Would you like...?"]',    'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'decline',    '/dɪˈklaɪn/',    'відхиляти / відмовляти', '["She politely declined the offer.","How do you decline an invitation?"]',       'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'favour',     '/ˈfeɪvər/',     'послуга / прохання',  '["Can you do me a favour?","She asked him for a small favour."]',                  'A2'),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'certainly',  '/ˈsɜːtənli/',   'звичайно / безумовно', '["Certainly! I would be happy to help.","Certainly, I will do that for you."]',   'A2');
