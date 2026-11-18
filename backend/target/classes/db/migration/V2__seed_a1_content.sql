-- ============================================================
-- V2: A1 Level Content  (plain SQL, no PL/pgSQL)
-- ============================================================

-- Levels
INSERT INTO levels (code, name, description, order_index) VALUES
('A1', 'Beginner',          'Learn to introduce yourself, ask simple questions and understand basic expressions.', 1),
('A2', 'Elementary',        'Talk about the past, future plans, shopping, travel and everyday situations.',         2),
('B1', 'Intermediate',      'Confidently hold conversations, explain opinions and discuss work experience.',         3),
('B2', 'Upper-Intermediate','Participate in professional conversations and argue a position.',                       4),
('C1', 'Advanced',          'Use English freely in complex professional, academic and social situations.',           5);

-- A1 Course & Module
INSERT INTO courses (level_id, name, description, order_index)
VALUES ((SELECT id FROM levels WHERE code = 'A1'), 'A1 English Course', 'Complete beginner course covering all A1 grammar and vocabulary.', 1);

INSERT INTO modules (course_id, name, description, order_index)
VALUES ((SELECT id FROM courses WHERE name = 'A1 English Course'), 'Grammar & Communication', 'Core grammar topics for A1 level.', 1);

-- ============================================================
-- TOPICS (all 20)
-- ============================================================
INSERT INTO topics (module_id, name, description, order_index, estimated_minutes)
SELECT m.id, t.name, t.description, t.ord, t.mins
FROM modules m,
(VALUES
  ('Alphabet & Pronunciation',    'Learn English letters, sounds and reading rules.',          1,  30),
  ('Greetings & Introductions',   'Learn how to greet people and introduce yourself.',         2,  25),
  ('Personal Pronouns',           'I, you, he, she, it, we, they — subject pronouns.',         3,  20),
  ('Verb To Be',                  'Am/is/are — forms, questions and negatives.',               4,  35),
  ('Articles',                    'A, an, the and zero article.',                              5,  30),
  ('Nouns & Plurals',             'Singular and plural nouns, including irregular forms.',     6,  25),
  ('Numbers, Dates & Time',       'Cardinal/ordinal numbers, telling the time and dates.',     7,  30),
  ('Possessives',                 'My, your, his, her, its, our, their and apostrophe-s.',   8,  25),
  ('This, That, These, Those',    'Demonstrative pronouns for near and far objects.',          9,  20),
  ('Have / Have Got',             'Expressing possession with have and have got.',             10, 25),
  ('Present Simple',              'Do/does, -s endings, habits and regular actions.',          11, 40),
  ('Adverbs of Frequency',        'Always, usually, often, sometimes, never.',                 12, 25),
  ('Question Words',              'What, where, when, why, who, how — WH questions.',          13, 25),
  ('There Is / There Are',        'Describing existence and location of objects.',             14, 25),
  ('Prepositions of Place & Time','In, on, at, under, next to, between.',                     15, 30),
  ($$Can / Can't$$,                 'Abilities, permissions and simple requests.',               16, 25),
  ('Present Continuous',          'Am/is/are + V-ing — actions happening now.',               17, 30),
  ('Imperatives',                 'Commands, instructions and prohibitions.',                  18, 20),
  ('Some / Any & Countability',   'Countable and uncountable nouns with some and any.',       19, 30),
  ('Basic Adjectives',            'Adjectives and basic word order in sentences.',             20, 25)
) AS t(name, description, ord, mins)
WHERE m.name = 'Grammar & Communication';

-- ============================================================
-- LESSONS (all 20, one per topic)
-- ============================================================
INSERT INTO lessons (topic_id, name, slug, order_index, is_published)
SELECT t.id, l.lname, l.slug, 1, TRUE
FROM topics t
JOIN (VALUES
  ('Alphabet & Pronunciation',    'Alphabet & Pronunciation',    'a1-alphabet-pronunciation'),
  ('Greetings & Introductions',   'Greetings & Introductions',   'a1-greetings-introductions'),
  ('Personal Pronouns',           'Personal Pronouns',           'a1-personal-pronouns'),
  ('Verb To Be',                  'Verb To Be',                  'a1-verb-to-be'),
  ('Articles',                    'Articles',                    'a1-articles'),
  ('Nouns & Plurals',             'Nouns & Plurals',             'a1-nouns-plurals'),
  ('Numbers, Dates & Time',       'Numbers, Dates & Time',       'a1-numbers-dates-time'),
  ('Possessives',                 'Possessives',                 'a1-possessives'),
  ('This, That, These, Those',    'This, That, These, Those',    'a1-demonstratives'),
  ('Have / Have Got',             'Have / Have Got',             'a1-have-have-got'),
  ('Present Simple',              'Present Simple',              'a1-present-simple'),
  ('Adverbs of Frequency',        'Adverbs of Frequency',        'a1-adverbs-frequency'),
  ('Question Words',              'Question Words',              'a1-question-words'),
  ('There Is / There Are',        'There Is / There Are',        'a1-there-is-there-are'),
  ('Prepositions of Place & Time','Prepositions of Place & Time','a1-prepositions'),
  ($$Can / Can't$$,                $$Can / Can't$$,                'a1-can-cant'),
  ('Present Continuous',          'Present Continuous',          'a1-present-continuous'),
  ('Imperatives',                 'Imperatives',                 'a1-imperatives'),
  ('Some / Any & Countability',   'Some / Any & Countability',   'a1-some-any'),
  ('Basic Adjectives',            'Basic Adjectives',            'a1-basic-adjectives')
) AS l(tname, lname, slug) ON t.name = l.tname;

-- ============================================================
-- THEORY BLOCKS
-- ============================================================

-- Lesson 1: Alphabet & Pronunciation
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'),
$$The English alphabet has **26 letters**: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z.

Each letter has a **name** (how we say it in the alphabet) and a **sound** (how we use it in words).

**Vowels**: A, E, I, O, U — make an open sound.
**Consonants**: all other letters.$$, 1),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'),
$$**Common pronunciation rules:**
- Silent "e" at the end makes the previous vowel long: *cake, bike, home*
- "th" can be /θ/ (think) or /ð/ (this)
- "ch" = /tʃ/ (chair), "sh" = /ʃ/ (she), "ph" = /f/ (phone)$$, 2);

-- Lesson 2: Greetings & Introductions
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
$$**Formal greetings:**
- Good morning / Good afternoon / Good evening
- How do you do? (very formal, first meeting)

**Informal greetings:**
- Hi! / Hey! / Hello!
- How are you? → Fine, thanks! / Great! / Not bad.$$, 1),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
$$**Introducing yourself:**
- My name is [name]. / I am [name]. / I'm [name].
- I am from [country].
- I am [age] years old.
- Nice to meet you! → Nice to meet you too!$$, 2);

-- Lesson 3: Personal Pronouns
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'),
$$**Subject pronouns** replace nouns as the subject of a sentence:

| Pronoun | Person | Example |
|---------|--------|---------|
| I | 1st singular | I am a student. |
| You | 2nd singular/plural | You are kind. |
| He | 3rd singular (male) | He is tall. |
| She | 3rd singular (female) | She is smart. |
| It | 3rd singular (thing) | It is a cat. |
| We | 1st plural | We are friends. |
| They | 3rd plural | They are happy. |$$, 1);

-- Lesson 4: Verb To Be
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'),
$$**Affirmative forms:**
- I **am** (I'm) happy.
- You/We/They **are** ('re) students.
- He/She/It **is** ('s) at home.

**Negative forms:**
- I **am not** (I'm not) tired.
- You/We/They **are not** (aren't) late.
- He/She/It **is not** (isn't) here.$$, 1),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'),
$$**Yes/No Questions:**
- **Am** I right? → Yes, you are. / No, you aren't.
- **Are** you a teacher? → Yes, I am. / No, I'm not.
- **Is** he busy? → Yes, he is. / No, he isn't.

**Common mistakes:**
- ❌ He are my friend. → ✅ He **is** my friend.
- ❌ I is tired. → ✅ I **am** tired.$$, 2);

-- Lesson 5: Articles
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-articles'),
$$**A / AN** — indefinite article (used before singular countable nouns mentioned for the first time)
- **a** + consonant sound: *a book, a car, a university*
- **an** + vowel sound: *an apple, an egg, an hour*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a1-articles'),
$$**THE** — definite article
- Use when both speaker and listener know which one: *Close **the** door.*
- Use when mentioned the second time: *I have a cat. **The** cat is black.*

**Zero article** — no article:
- Proper nouns: *Spain, Anna, Monday*
- Uncountable nouns in general: *I love music.*
- Plural nouns in general: *Dogs are friendly.*$$, 2);

-- Lesson 6: Nouns & Plurals
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'),
$$**Regular plurals:**
- cat → cats, book → books
- bus → buses, box → boxes, watch → watches (after s, x, ch, sh add -es)
- city → cities, baby → babies (consonant + y → -ies)
- knife → knives, leaf → leaves (some -f → -ves)$$, 1),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'),
$$**Irregular plurals — must learn:**
- man → men, woman → women, child → children
- tooth → teeth, foot → feet, mouse → mice
- person → people, fish → fish, sheep → sheep$$, 2);

-- Lesson 7: Numbers, Dates & Time
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'),
$$**Cardinal numbers:** 1 one, 2 two, 3 three, 4 four, 5 five, 6 six, 7 seven, 8 eight, 9 nine, 10 ten
11 eleven, 12 twelve, 13 thirteen, 20 twenty, 21 twenty-one, 100 one hundred

**Ordinal numbers:** 1st first, 2nd second, 3rd third, 4th fourth, 5th fifth, 10th tenth$$, 1),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'),
$$**Telling the time:**
- 3:00 — It is three o'clock.
- 3:15 — It is quarter past three.
- 3:30 — It is half past three.
- 3:45 — It is quarter to four.

**Dates:** the 1st of January, the 25th of December
**Days:** Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday$$, 2);

-- Lesson 8: Possessives
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-possessives'),
$$**Possessive adjectives** (before the noun):
- my, your, his, her, its, our, their
- *This is **my** book. That is **her** bag.*

**Possessive 's** (apostrophe s):
- Singular: *Tom's car, the dog's bowl*
- Plural (already ends in s): *the students' books*$$, 1);

-- Lesson 9: Demonstratives
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'),
$$**Demonstrative pronouns:**

|          | Near (close to you) | Far (away from you) |
|----------|--------------------|--------------------|
| Singular | **this**           | **that**           |
| Plural   | **these**          | **those**          |

- *This is my pen.* (holding it)
- *That is your car.* (over there)
- *These are my keys.* (near, plural)
- *Those mountains are beautiful.* (far, plural)$$, 1);

-- Lesson 10: Have / Have Got
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'),
$$**Have** and **have got** both express possession:

| Form        | Have              | Have got             |
|-------------|-------------------|----------------------|
| Affirmative | I have a car.     | I've got a car.      |
| Negative    | I don't have a car.| I haven't got a car.|
| Question    | Do you have a car?| Have you got a car? |

**He/She/It:** He **has** a dog. / He **has got** a dog.$$, 1);

-- Lesson 11: Present Simple
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'),
$$**Use:** habits, regular actions, facts, schedules.

**Affirmative:**
- I/You/We/They **work** every day.
- He/She/It **works** every day. *(add -s or -es)*

**Spelling rules for he/she/it:**
- Most verbs: add **-s** → work→works, play→plays
- Ends in -s,-x,-ch,-sh,-o: add **-es** → go→goes, watch→watches
- Ends in consonant+y: **-ies** → study→studies, fly→flies$$, 1),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'),
$$**Negative:** Subject + **do/does not** + verb
- I/You/We/They **don't work** on Sundays.
- He/She/It **doesn't work** on Sundays.

**Questions:** **Do/Does** + subject + verb?
- **Do** you like coffee? — Yes, I do. / No, I don't.
- **Does** she speak Spanish? — Yes, she does. / No, she doesn't.

⚠️ After does/doesn't the verb has NO -s: Does she work? ✓ (NOT Does she works? ✗)$$, 2);

-- Lesson 12: Adverbs of Frequency
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'),
$$**Frequency: 100% → 0%**
**always** (100%) → **usually** (~80%) → **often** (~60%) → **sometimes** (~40%) → **rarely** (~20%) → **never** (0%)

**Position in sentence:**
- Before the main verb: *I **always** eat breakfast.*
- After "to be": *She **is** usually late.*$$, 1);

-- Lesson 13: Question Words
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-question-words'),
$$**WH-question words:**
- **What** — what/which: *What is your name?*
- **Where** — where: *Where do you live?*
- **When** — when: *When does the film start?*
- **Why** — why: *Why are you late?*
- **Who** — who: *Who is your teacher?*
- **How** — how: *How are you? / How old are you?*
- **Which** — which: *Which bag is yours?*$$, 1);

-- Lesson 14: There Is / There Are
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'),
$$**There is** (singular) / **There are** (plural)

- **There is** a book on the table. *(one book)*
- **There are** three books on the table. *(three books)*

**Negatives:** There **isn't** · There **aren't**
**Questions:** **Is there** a...? **Are there** any...?$$, 1);

-- Lesson 15: Prepositions
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'),
$$**Prepositions of PLACE:**
- **in** — inside: *in the box, in Spain*
- **on** — on a surface: *on the table, on the wall*
- **at** — a point/place: *at the door, at school*
- **under** — below: *under the bed*
- **next to** — beside: *next to the bank*
- **between** — in the middle: *between the chair and the desk*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'),
$$**Prepositions of TIME:**
- **in** + month/year/season: *in May, in 2024, in summer, in the morning*
- **on** + day/date: *on Monday, on the 5th of March*
- **at** + specific time: *at 7 o'clock, at Christmas, at night*$$, 2);

-- Lesson 16: Can / Can't
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'),
$$**Can** expresses ability, permission and requests:
- Ability: *I **can** swim. She **can't** drive.*
- Permission: *You **can** use my phone.*
- Request: ***Can** you help me, please?*

**Form:** Subject + can/can't + base verb (NO -s, NO to)
- ✓ She **can swim**. ✗ ~~She can swims.~~$$, 1);

-- Lesson 17: Present Continuous
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'),
$$**Use:** actions happening NOW or around now.
**Form:** am/is/are + verb**-ing**

- I **am working** right now.
- She **is reading** a book.
- They **are playing** football.

**Spelling -ing:** run→running, write→writing, play→playing$$, 1);

-- Lesson 18: Imperatives
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'),
$$**Imperatives** — commands and instructions.
**Form:** Base verb (without subject)

- Positive: ***Open** the door. **Sit** down. **Listen** carefully.*
- Negative: ***Don't** run! **Don't** forget your keys.*
- Polite: *Please **come** in. **Please** be quiet.*$$, 1);

-- Lesson 19: Some / Any
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-some-any'),
$$**Some** = some/a few (affirmative sentences)
**Any** = any (questions and negatives)

- I have **some** apples. (affirm)
- Do you have **any** apples? (question)
- I don't have **any** apples. (negative)

**Countable** (can count): apple → apples, car → cars
**Uncountable** (cannot count): water, milk, money, bread, information$$, 1);

-- Lesson 20: Basic Adjectives
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'),
$$**Adjectives** describe nouns.
**Position:**
1. Before the noun: *a **big** house, a **red** car*
2. After to be: *The house **is** big. The car **is** red.*

**Common adjectives:**
big ↔ small, old ↔ young/new, hot ↔ cold, fast ↔ slow
happy ↔ sad, beautiful ↔ ugly, easy ↔ difficult, cheap ↔ expensive$$, 1);

-- ============================================================
-- EXAMPLES
-- ============================================================
INSERT INTO examples (lesson_id, english_text, translation, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'A is for Apple. B is for Book.', 'A — яблоко. B — книга.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'My name starts with the letter M.', 'Моё имя начинается с буквы M.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'How do you spell your name?', 'Как пишется ваше имя?', 3),

((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'Hi! My name is Anna. Nice to meet you!', 'Привет! Меня зовут Анна. Приятно познакомиться!', 1),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'Good morning! How are you? — Fine, thanks!', 'Доброе утро! Как дела? — Хорошо, спасибо!', 2),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'I am from Spain. I am 25 years old.', 'Я из Испании. Мне 25 лет.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'I am a teacher. She is a doctor.', 'Я учитель. Она врач.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'He is my brother. They are my friends.', 'Он мой брат. Они мои друзья.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'It is a big house. We are from Spain.', 'Это большой дом. Мы из Испании.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'I am a student. I am not a teacher.', 'Я студент. Я не учитель.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'Is she from France? — Yes, she is.', 'Она из Франции? — Да.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'Are they happy? — No, they are not.', 'Они счастливы? — Нет.', 3),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'It is a beautiful day today.', 'Сегодня прекрасный день.', 4),

((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'I saw a dog in the park. The dog was big.', 'Я видел собаку в парке. Собака была большой.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'She is an engineer. She works at a big company.', 'Она инженер. Она работает в большой компании.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'Can you close the window? It is cold.', 'Ты можешь закрыть окно? Холодно.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'One cat, two cats. One bus, three buses.', 'Одна кошка, две кошки. Один автобус, три автобуса.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'The children are playing in the garden.', 'Дети играют в саду.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'I have one tooth. He has beautiful teeth.', 'У меня один зуб. У него красивые зубы.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'What time is it? — It is half past two.', 'Который час? — Половина третьего.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'My birthday is on the 10th of May.', 'Мой день рождения 10 мая.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'She lives on the third floor.', 'Она живёт на третьем этаже.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'This is my house. That is her car.', 'Это мой дом. Это её машина.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'Is this your phone? — No, it is his phone.', 'Это твой телефон? — Нет, это его телефон.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), $$Sarah's dog is very friendly.$$, 'Собака Сары очень дружелюбная.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'This is a great idea! That is a bad idea.', 'Это отличная идея! То — плохая идея.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'These shoes are too small. Those are my size.', 'Эта обувь слишком мала. Те подходят.', 2),

((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'I have two brothers and one sister.', 'У меня два брата и одна сестра.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'Do you have a pen? — Yes, I have one.', 'У тебя есть ручка? — Да, есть.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'She has got blue eyes and long hair.', 'У неё голубые глаза и длинные волосы.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), $$I wake up at 7 o'clock every morning.$$, 'Я просыпаюсь каждое утро в 7 часов.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'She studies English at a language school.', 'Она учит английский в языковой школе.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'He does not eat meat. He is a vegetarian.', 'Он не ест мясо. Он вегетарианец.', 3),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'The train leaves at 9 AM every day.', 'Поезд отправляется каждый день в 9 утра.', 4),

((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'I always brush my teeth before bed.', 'Я всегда чищу зубы перед сном.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'She is usually at work by 8 AM.', 'Она обычно на работе к 8 утра.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'He never drinks coffee after 6 PM.', 'Он никогда не пьёт кофе после 18:00.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'Where do you work? — I work in a hospital.', 'Где ты работаешь? — В больнице.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'When is your birthday? — It is in June.', 'Когда твой день рождения? — В июне.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'How old is your brother? — He is 20.', 'Сколько лет твоему брату? — Ему 20.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'There is a sofa in the living room.', 'В гостиной есть диван.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'There are two windows in my bedroom.', 'В моей спальне два окна.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'Is there a supermarket near here? — Yes, there is.', 'Есть ли поблизости супермаркет? — Да.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'The keys are on the table, not under it.', 'Ключи на столе, а не под ним.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'I was born in Spain in June 1995.', 'Я родился в Испании в июне 1995 года.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'The meeting is on Monday at 10 AM.', 'Встреча в понедельник в 10 утра.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'I can speak three languages.', 'Я могу говорить на трёх языках.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'Can you open the window? — Of course!', 'Ты можешь открыть окно? — Конечно!', 2),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'He cannot come to the party tonight.', 'Он не может прийти на вечеринку сегодня.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'Look! It is snowing outside!', 'Смотри! На улице идёт снег!', 1),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'I am studying English right now.', 'Я сейчас учу английский.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'What are you doing? — I am cooking dinner.', 'Что ты делаешь? — Готовлю ужин.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'Open your books and turn to page 5.', 'Откройте книги и перейдите на страницу 5.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'Do not talk in the library, please.', 'Не разговаривайте в библиотеке, пожалуйста.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'Turn left at the traffic lights.', 'Повернитe налево у светофора.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'I need some sugar for the cake.', 'Мне нужно немного сахара для пирога.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'Is there any bread left? — No, there is not any.', 'Осталось ли немного хлеба? — Нет.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'We do not have any eggs in the fridge.', 'У нас нет яиц в холодильнике.', 3),

((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'It is a beautiful sunny day.', 'Это прекрасный солнечный день.', 1),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'This exercise is easy. That one is difficult.', 'Это упражнение лёгкое. То трудное.', 2),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'She has long brown hair and green eyes.', 'У неё длинные каштановые волосы и зелёные глаза.', 3);

-- ============================================================
-- EXERCISES
-- ============================================================

-- Lesson 1: Alphabet & Pronunciation
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'MULTIPLE_CHOICE', 1, 'How many letters are in the English alphabet?', '["24","25","26","27"]', '26', '{"ru":"В английском алфавите 26 букв."}', ARRAY['alphabet'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'MULTIPLE_CHOICE', 1, 'Which of these is a VOWEL?', '["B","C","E","T"]', 'E', '{"ru":"Гласные буквы: A, E, I, O, U."}', ARRAY['vowels'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'MULTIPLE_CHOICE', 1, 'Which word has a silent "e" that makes the vowel long?', '["bit","bat","bite","bad"]', 'bite', '{"ru":"В слове bite буква e не читается, но делает гласную i длинной."}', ARRAY['pronunciation'], 25, 3),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'MULTIPLE_CHOICE', 1, 'How is "ch" pronounced in "chair"?', '["/k/","/tʃ/","/ʃ/","/h/"]', '/tʃ/', '{"ru":"Ch в слове chair читается как /tʃ/."}', ARRAY['pronunciation'], 25, 4),
((SELECT id FROM lessons WHERE slug = 'a1-alphabet-pronunciation'), 'MULTIPLE_CHOICE', 1, 'Which letters are CONSONANTS?', '["A, E, I","B, C, D","I, O, U","A, U, O"]', 'B, C, D', '{"ru":"Согласные — все буквы кроме A, E, I, O, U."}', ARRAY['consonants'], 20, 5);

-- Lesson 2: Greetings & Introductions
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'MULTIPLE_CHOICE', 1, 'Which phrase is a FORMAL greeting?', '["Hey!","Hi there!","Good morning!","Yo!"]', 'Good morning!', '{"ru":"Good morning — формальное приветствие."}', ARRAY['greetings'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'MULTIPLE_CHOICE', 1, 'How do you introduce yourself?', '["Nice to meet you","My name is Anna","Good morning","How are you?"]', 'My name is Anna', '{"ru":"My name is — стандартный способ представиться."}', ARRAY['introductions'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'MULTIPLE_CHOICE', 1, 'Complete: "Nice ___ meet you!"', '["to","for","at","of"]', 'to', '{"ru":"Устойчивое выражение: Nice to meet you!"}', ARRAY['phrases'], 25, 3),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'MULTIPLE_CHOICE', 1, 'What is the correct response to "How are you?"', '["My name is Bob","Nice to meet you","Fine, thanks!","Good morning"]', 'Fine, thanks!', '{"ru":"На вопрос How are you? отвечают: Fine, thanks! / Great! / Not bad."}', ARRAY['greetings'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'), 'MULTIPLE_CHOICE', 1, 'Which greeting is used in the EVENING?', '["Good morning","Good afternoon","Good evening","Good night"]', 'Good evening', '{"ru":"Good evening используется вечером; good night — при прощании на ночь."}', ARRAY['greetings'], 20, 5);

-- Lesson 3: Personal Pronouns
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'MULTIPLE_CHOICE', 1, 'Maria is a student. ___ is from Italy.', '["He","She","It","They"]', 'She', '{"ru":"Maria — женское имя, поэтому используем She."}', ARRAY['pronouns'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'MULTIPLE_CHOICE', 1, 'John and I go to the same school. ___ are classmates.', '["He","She","We","They"]', 'We', '{"ru":"John and I = We (мы)."}', ARRAY['pronouns'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'MULTIPLE_CHOICE', 1, 'The cat is hungry. ___ wants food.', '["He","She","It","We"]', 'It', '{"ru":"Для животных или предметов используем It."}', ARRAY['pronouns'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'MULTIPLE_CHOICE', 1, 'Mike and Lisa are married. ___ live in London.', '["He","She","We","They"]', 'They', '{"ru":"Две и более людей = They (они)."}', ARRAY['pronouns'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-personal-pronouns'), 'MULTIPLE_CHOICE', 1, 'Which pronoun is used for a male person?', '["She","It","He","We"]', 'He', '{"ru":"He используется для мужчин."}', ARRAY['pronouns'], 15, 5);

-- Lesson 4: Verb To Be
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'MULTIPLE_CHOICE', 1, 'I ___ a doctor.', '["am","is","are","be"]', 'am', '{"ru":"С местоимением I всегда используется am."}', ARRAY['to-be','first-person'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'MULTIPLE_CHOICE', 1, 'She ___ from Spain.', '["am","is","are","be"]', 'is', '{"ru":"С he/she/it используется is."}', ARRAY['to-be','third-person'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'MULTIPLE_CHOICE', 1, 'They ___ my best friends.', '["am","is","are","were"]', 'are', '{"ru":"С they/we/you используется are."}', ARRAY['to-be','plural'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'MULTIPLE_CHOICE', 1, '___ you tired?', '["Am","Is","Are","Be"]', 'Are', '{"ru":"Вопросы с you образуются через Are."}', ARRAY['to-be','questions'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'MULTIPLE_CHOICE', 1, 'He ___ not at school today.', '["am","is","are","were"]', 'is', $${"ru":"He is not = He isn't. С he/she/it — is."}$$, ARRAY['to-be','negation'], 20, 5),
((SELECT id FROM lessons WHERE slug = 'a1-verb-to-be'), 'MULTIPLE_CHOICE', 2, 'Which sentence is CORRECT?', '["He are tall","I is happy","They is nice","She is a nurse"]', 'She is a nurse', '{"ru":"Только She is a nurse правильно. He is, I am, They are."}', ARRAY['to-be','error-correction'], 30, 6);

-- Lesson 5: Articles
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'MULTIPLE_CHOICE', 1, '___ apple a day keeps the doctor away.', '["A","An","The","—"]', 'An', '{"ru":"Apple начинается с гласного звука /æ/, поэтому используем an."}', ARRAY['articles','a-an'], 25, 1),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'MULTIPLE_CHOICE', 1, 'He is ___ university student.', '["a","an","the","—"]', 'a', '{"ru":"University начинается со звука /juː/ (согласный), поэтому a university."}', ARRAY['articles','a-an'], 25, 2),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'MULTIPLE_CHOICE', 1, 'I bought a book. ___ book is very interesting.', '["A","An","The","—"]', 'The', '{"ru":"Второй раз упоминаем книгу, которую уже знаем — the book."}', ARRAY['articles','the'], 25, 3),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'MULTIPLE_CHOICE', 1, 'I love ___ music.', '["a","an","the","—"]', '—', '{"ru":"Music — неисчисляемое существительное в общем значении. Артикль не нужен."}', ARRAY['articles','zero-article'], 25, 4),
((SELECT id FROM lessons WHERE slug = 'a1-articles'), 'MULTIPLE_CHOICE', 1, 'She is ___ honest person.', '["a","an","the","—"]', 'an', '{"ru":"Honest начинается с немого h, звук — гласный /ɒ/. Используем an."}', ARRAY['articles','a-an'], 25, 5);

-- Lesson 6: Nouns & Plurals
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'MULTIPLE_CHOICE', 1, 'What is the plural of "child"?', '["childs","childes","children","childer"]', 'children', '{"ru":"Child — неправильное множественное число: children."}', ARRAY['plurals','irregular'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'MULTIPLE_CHOICE', 1, 'What is the plural of "city"?', '["citys","cityes","cities","city"]', 'cities', '{"ru":"Согласная + y: убираем y и добавляем -ies."}', ARRAY['plurals','regular'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'MULTIPLE_CHOICE', 1, 'What is the plural of "box"?', '["boxs","box","boxes","boxies"]', 'boxes', '{"ru":"После x добавляем -es."}', ARRAY['plurals','regular'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'MULTIPLE_CHOICE', 1, 'Which word has the SAME singular and plural form?', '["man","woman","sheep","child"]', 'sheep', '{"ru":"Sheep → sheep (форма не меняется)."}', ARRAY['plurals','irregular'], 25, 4),
((SELECT id FROM lessons WHERE slug = 'a1-nouns-plurals'), 'MULTIPLE_CHOICE', 1, 'What is the plural of "woman"?', '["womans","women","womens","woman"]', 'women', '{"ru":"Woman → women (неправильная форма)."}', ARRAY['plurals','irregular'], 20, 5);

-- Lesson 7: Numbers, Dates & Time
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'MULTIPLE_CHOICE', 1, 'How do you say 3:30?', '["Quarter past three","Half past three","Quarter to three","Three o clock"]', 'Half past three', '{"ru":"3:30 — half past three (половина четвёртого)."}', ARRAY['time'], 25, 1),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'MULTIPLE_CHOICE', 1, 'What is the ordinal form of 3?', '["thirdth","threeth","third","thired"]', 'third', '{"ru":"3rd = third — исключение."}', ARRAY['ordinals'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'MULTIPLE_CHOICE', 1, 'How do you say 15:45?', '["Quarter past four","Half past three","Quarter to four","Three forty-five"]', 'Quarter to four', '{"ru":"15:45 = quarter to four (без четверти четыре)."}', ARRAY['time'], 25, 3),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'MULTIPLE_CHOICE', 1, 'Which day comes AFTER Wednesday?', '["Tuesday","Monday","Thursday","Friday"]', 'Thursday', '{"ru":"Порядок дней: Mon, Tue, Wed, Thu, Fri, Sat, Sun."}', ARRAY['days'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-numbers-dates-time'), 'MULTIPLE_CHOICE', 1, 'How do you say 21?', '["twone","twenty-one","twentyone","two-one"]', 'twenty-one', '{"ru":"21 = twenty-one (числа 21-99 пишутся через дефис)."}', ARRAY['numbers'], 20, 5);

-- Lesson 8: Possessives
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'MULTIPLE_CHOICE', 1, 'This is Anna. ___ name is Anna.', '["My","His","Her","Its"]', 'Her', '{"ru":"Anna — женщина, поэтому Her name."}', ARRAY['possessives'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'MULTIPLE_CHOICE', 1, 'The dog hurt ___ paw.', '["his","her","its","their"]', 'its', '{"ru":"Для животных используем its."}', ARRAY['possessives'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'MULTIPLE_CHOICE', 1, 'Tom and Jerry. ___ apartment is on the 2nd floor.', '["His","Her","Its","Their"]', 'Their', '{"ru":"Tom and Jerry = they, поэтому their."}', ARRAY['possessives'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'MULTIPLE_CHOICE', 1, 'This book belongs to Mary. It is ___.', $$["Mary book","Marys book","Mary's book","book of Mary"]$$, $$Mary's book$$, $${"ru":"Для обозначения принадлежности используем 's после имени."}$$, ARRAY['possessive-s'], 25, 4),
((SELECT id FROM lessons WHERE slug = 'a1-possessives'), 'MULTIPLE_CHOICE', 1, 'We love ___ new apartment.', '["my","his","our","their"]', 'our', '{"ru":"We → our (наш/наша/наше)."}', ARRAY['possessives'], 20, 5);

-- Lesson 9: Demonstratives
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'MULTIPLE_CHOICE', 1, '___ is my book. (I am holding it.)', '["That","Those","This","These"]', 'This', '{"ru":"Близко + единственное число = This."}', ARRAY['demonstratives'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'MULTIPLE_CHOICE', 1, '___ are my friends. (They are standing far away.)', '["This","That","These","Those"]', 'Those', '{"ru":"Далеко + множественное число = Those."}', ARRAY['demonstratives'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'MULTIPLE_CHOICE', 1, '___ cookies are delicious! (on the table in front of you)', '["That","Those","This","These"]', 'These', '{"ru":"Близко + множественное число = These."}', ARRAY['demonstratives'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'MULTIPLE_CHOICE', 1, 'Look at ___ beautiful castle! (far away)', '["this","these","that","those"]', 'that', '{"ru":"Далеко + единственное число = that."}', ARRAY['demonstratives'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-demonstratives'), 'MULTIPLE_CHOICE', 1, 'Which sentence is correct?', '["These is my pen","That are nice","Those are great shoes","This are your friends"]', 'Those are great shoes', '{"ru":"Those (мн.ч., далеко) + are. Остальные неверно согласованы."}', ARRAY['demonstratives'], 25, 5);

-- Lesson 10: Have / Have Got
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'MULTIPLE_CHOICE', 1, 'She ___ a beautiful garden.', '["have","has","have got","are"]', 'has', '{"ru":"С she/he/it используется has."}', ARRAY['have'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'MULTIPLE_CHOICE', 1, '___ you got a minute?', '["Do","Have","Has","Are"]', 'Have', '{"ru":"Have you got...? — вопрос с have got."}', ARRAY['have-got','questions'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'MULTIPLE_CHOICE', 1, 'I ___ any money with me.', $$["don't have","doesn't have","haven't","hasn't got"]$$, $$don't have$$, '{"ru":"I + do not have = отрицание для 1-го лица."}', ARRAY['have','negation'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'MULTIPLE_CHOICE', 1, 'He ___ got a new laptop.', '["have","has","had","are"]', 'has', '{"ru":"He has got = у него есть."}', ARRAY['have-got'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-have-have-got'), 'MULTIPLE_CHOICE', 1, 'Which question is CORRECT?', '["Does she has a car?","Has she a car?","Does she have a car?","Is she have a car?"]', 'Does she have a car?', '{"ru":"Does she have...? — стандартный вопрос с have в Present Simple."}', ARRAY['have','questions'], 25, 5);

-- Lesson 11: Present Simple
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'MULTIPLE_CHOICE', 1, 'She ___ English every morning.', '["study","studies","studying","studys"]', 'studies', '{"ru":"study оканчивается на согласную + y → studies для he/she/it."}', ARRAY['present-simple','third-person'], 25, 1),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'MULTIPLE_CHOICE', 1, 'He ___ not like spicy food.', '["do","does","is","are"]', 'does', $${"ru":"C he/she/it в отрицании используется does not / doesn't."}$$, ARRAY['present-simple','negation'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'MULTIPLE_CHOICE', 1, '___ your sister speak French?', '["Do","Does","Is","Has"]', 'Does', '{"ru":"С he/she/it в вопросах используется Does."}', ARRAY['present-simple','questions'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'MULTIPLE_CHOICE', 1, 'I ___ to work by bus every day.', '["goes","go","going","does go"]', 'go', '{"ru":"С I используем базовую форму глагола (go), без -s."}', ARRAY['present-simple','first-person'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'MULTIPLE_CHOICE', 2, 'Which sentence is CORRECT?', $$["He go to school","She don't work","They doesn't sleep","We play football on Saturdays"]$$, 'We play football on Saturdays', $${"ru":"We play — правильно. He goes, She doesn't work, They don't sleep."}$$, ARRAY['present-simple','error-correction'], 30, 5),
((SELECT id FROM lessons WHERE slug = 'a1-present-simple'), 'MULTIPLE_CHOICE', 1, 'The shop ___ at 9 AM and closes at 9 PM.', '["open","opens","opening","opened"]', 'opens', '{"ru":"The shop = it, поэтому открывается = opens."}', ARRAY['present-simple'], 25, 6);

-- Lesson 12: Adverbs of Frequency
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'MULTIPLE_CHOICE', 1, 'Which adverb means 100% frequency?', '["sometimes","often","always","usually"]', 'always', '{"ru":"Always = всегда = 100%."}', ARRAY['frequency'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'MULTIPLE_CHOICE', 1, 'I ___ eat breakfast. (every single day)', '["never","sometimes","always","rarely"]', 'always', '{"ru":"Every single day = always."}', ARRAY['frequency'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'MULTIPLE_CHOICE', 1, 'Where does the adverb go? "She / is / late / always"', '["She always is late","Always she is late","She is always late","She is late always"]', 'She is always late', '{"ru":"После глагола to be: She is ALWAYS late."}', ARRAY['frequency','word-order'], 25, 3),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'MULTIPLE_CHOICE', 1, 'He ___ drinks water. He prefers coffee.', '["always","often","never","usually"]', 'never', '{"ru":"Если он никогда не пьёт воду — never."}', ARRAY['frequency'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-adverbs-frequency'), 'MULTIPLE_CHOICE', 1, 'Which sentence has the CORRECT word order?', '["Often I go swimming","I go often swimming","I often go swimming","I go swimming often always"]', 'I often go swimming', '{"ru":"Наречие частоты стоит перед основным глаголом: I OFTEN go."}', ARRAY['frequency','word-order'], 25, 5);

-- Lesson 13: Question Words
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'MULTIPLE_CHOICE', 1, '___ is your favourite colour?', '["Where","When","What","Who"]', 'What', '{"ru":"What — что/какой. Любимый цвет — это что? = What."}', ARRAY['question-words'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'MULTIPLE_CHOICE', 1, '___ does she live? — In Barcelona.', '["What","Where","When","Why"]', 'Where', '{"ru":"Where — где/куда. Ответ «в Барселоне» — о месте."}', ARRAY['question-words'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'MULTIPLE_CHOICE', 1, '___ is your birthday? — On the 5th of March.', '["Who","How","Where","When"]', 'When', '{"ru":"When — когда. Ответ — дата."}', ARRAY['question-words'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'MULTIPLE_CHOICE', 1, '___ is your English teacher?', '["What","Where","Who","How"]', 'Who', '{"ru":"Who — кто. Вопрос о человеке."}', ARRAY['question-words'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-question-words'), 'MULTIPLE_CHOICE', 1, '___ are you late? — Because I missed the bus.', '["What","Where","When","Why"]', 'Why', '{"ru":"Why — почему. Ответ начинается с because."}', ARRAY['question-words'], 20, 5);

-- Lesson 14: There Is / There Are
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'MULTIPLE_CHOICE', 1, '___ a cat in the garden.', '["There are","There is","Is there","Are there"]', 'There is', '{"ru":"Один кот = единственное число → There is."}', ARRAY['there-is-are'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'MULTIPLE_CHOICE', 1, '___ five students in the classroom.', '["There is","There are","Is there","It is"]', 'There are', '{"ru":"Пять студентов = множественное число → There are."}', ARRAY['there-is-are'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'MULTIPLE_CHOICE', 1, '___ any coffee left? — No, there is not.', '["Is there","Are there","There is","There are"]', 'Is there', '{"ru":"Вопрос в ед.ч. (кофе — неисчисляемое): Is there any...?"}', ARRAY['there-is-are','questions'], 25, 3),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'MULTIPLE_CHOICE', 1, 'There ___ not any chairs in the room.', '["is","are","am","were"]', 'are', '{"ru":"Chairs — множественное число → there are not."}', ARRAY['there-is-are','negation'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-there-is-there-are'), 'MULTIPLE_CHOICE', 1, 'Which sentence is CORRECT?', '["There is two cats","There are a dog","There is a problem","There are one answer"]', 'There is a problem', '{"ru":"There is + a + ед.ч. = правильно."}', ARRAY['there-is-are'], 25, 5);

-- Lesson 15: Prepositions
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'MULTIPLE_CHOICE', 1, 'My birthday is ___ June.', '["on","in","at","by"]', 'in', '{"ru":"In + месяц: in June."}', ARRAY['prepositions','time'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'MULTIPLE_CHOICE', 1, 'The meeting is ___ Monday.', '["in","at","on","by"]', 'on', '{"ru":"On + день недели: on Monday."}', ARRAY['prepositions','time'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'MULTIPLE_CHOICE', 1, $$Class starts ___ 9 o'clock.$$, '["in","on","at","by"]', 'at', $${"ru":"At + конкретное время: at 9 o'clock."}$$, ARRAY['prepositions','time'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'MULTIPLE_CHOICE', 1, 'The cat is ___ the sofa.', '["at","in","on","between"]', 'on', '{"ru":"На поверхности = on: on the sofa."}', ARRAY['prepositions','place'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-prepositions'), 'MULTIPLE_CHOICE', 1, 'The school is ___ the library and the park.', '["next to","under","between","in"]', 'between', '{"ru":"Between = между двумя объектами."}', ARRAY['prepositions','place'], 20, 5);

-- Lesson 16: Can / Can't
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'MULTIPLE_CHOICE', 1, 'She ___ play the piano very well.', '["can","cans","is can","does can"]', 'can', '{"ru":"Can не изменяется по лицам: she can."}', ARRAY['can'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'MULTIPLE_CHOICE', 1, 'I ___ find my keys anywhere!', $$["can't","can","am not","do not"]$$, $$can't$$, $${"ru":"Can't = не могу."}$$, ARRAY['can','negation'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'MULTIPLE_CHOICE', 1, '___ you speak Spanish?', '["Do","Does","Can","Are"]', 'Can', '{"ru":"Вопрос о способности: Can you...?"}', ARRAY['can','questions'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'MULTIPLE_CHOICE', 1, 'Which sentence is CORRECT?', '["He cans run fast","She can swims","They can dance","We can to sing"]', 'They can dance', '{"ru":"Can + base verb без изменений: They can dance."}', ARRAY['can'], 25, 4),
((SELECT id FROM lessons WHERE slug = 'a1-can-cant'), 'MULTIPLE_CHOICE', 1, '___ I sit here, please?', '["Am","Do","Can","Is"]', 'Can', '{"ru":"Вежливая просьба: Can I...?"}', ARRAY['can','requests'], 20, 5);

-- Lesson 17: Present Continuous
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'MULTIPLE_CHOICE', 1, 'She ___ a book right now.', '["read","reads","is reading","reading"]', 'is reading', '{"ru":"She + is + V-ing для действия сейчас."}', ARRAY['present-continuous'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'MULTIPLE_CHOICE', 1, 'What is the correct -ing form of "run"?', '["runing","running","runeing","runs"]', 'running', '{"ru":"run: короткая гласная + согласная → удваиваем: running."}', ARRAY['present-continuous','spelling'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'MULTIPLE_CHOICE', 1, 'They ___ football in the park.', '["plays","play","are playing","is playing"]', 'are playing', '{"ru":"They + are + V-ing."}', ARRAY['present-continuous'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'MULTIPLE_CHOICE', 1, '___ it raining outside?', '["Do","Does","Is","Are"]', 'Is', '{"ru":"It + is → вопрос Is it...?"}', ARRAY['present-continuous','questions'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-present-continuous'), 'MULTIPLE_CHOICE', 1, 'I ___ listen to music now. I am studying.', '["am not listening","do not listening","is not listening","not listening"]', 'am not listening', '{"ru":"I am not + V-ing = отрицание Present Continuous."}', ARRAY['present-continuous','negation'], 25, 5);

-- Lesson 18: Imperatives
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'MULTIPLE_CHOICE', 1, '___ the window, please. It is hot.', '["Opens","You open","Open","Opening"]', 'Open', '{"ru":"Повелительное наклонение: базовая форма глагола."}', ARRAY['imperatives'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'MULTIPLE_CHOICE', 1, '___ in class! The teacher is talking.', $$["Not talk","Don't talk","No talking","Talks not"]$$, $$Don't talk$$, $${"ru":"Отрицательный императив: Don't + base verb."}$$, ARRAY['imperatives','negation'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'MULTIPLE_CHOICE', 1, 'Which is a correct imperative?', '["You should sit","Sit down","Sitting down","To sit down"]', 'Sit down', '{"ru":"Sit down — правильный императив."}', ARRAY['imperatives'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'MULTIPLE_CHOICE', 1, '___ forget your passport!', $$["Not","No","Don't","Doesn't"]$$, $$Don't$$, $${"ru":"Don't + forget = не забудь."}$$, ARRAY['imperatives'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-imperatives'), 'MULTIPLE_CHOICE', 1, '"Be quiet!" — This is a ___.', '["question","imperative","statement","greeting"]', 'imperative', '{"ru":"Be quiet — приказание/просьба = imperative."}', ARRAY['imperatives'], 20, 5);

-- Lesson 19: Some / Any
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'MULTIPLE_CHOICE', 1, 'I have ___ money. Let us go shopping.', '["any","some","a","an"]', 'some', '{"ru":"Утвердительное предложение + деньги = some money."}', ARRAY['some-any'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'MULTIPLE_CHOICE', 1, 'Is there ___ milk in the fridge?', '["some","a","any","the"]', 'any', '{"ru":"В вопросах используется any."}', ARRAY['some-any','questions'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'MULTIPLE_CHOICE', 1, 'I do not have ___ time right now.', '["some","a","an","any"]', 'any', '{"ru":"В отрицаниях используется any."}', ARRAY['some-any','negation'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'MULTIPLE_CHOICE', 1, 'Which noun is UNCOUNTABLE?', '["book","car","water","chair"]', 'water', '{"ru":"Water — неисчисляемое существительное."}', ARRAY['countability'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-some-any'), 'MULTIPLE_CHOICE', 1, 'Can I have ___ information about the tour?', '["some","any","a","an"]', 'some', '{"ru":"Просьба (утвердительная форма) + information (неисчисляемое) = some."}', ARRAY['some-any'], 25, 5);

-- Lesson 20: Basic Adjectives
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'MULTIPLE_CHOICE', 1, 'Which sentence has the CORRECT adjective position?', '["A house big","Big a house","A big house","House big a"]', 'A big house', '{"ru":"Прилагательное стоит перед существительным: a BIG house."}', ARRAY['adjectives','word-order'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'MULTIPLE_CHOICE', 1, 'The opposite of "cheap" is ___.', '["small","expensive","old","cold"]', 'expensive', '{"ru":"Cheap (дешёвый) ↔ expensive (дорогой)."}', ARRAY['adjectives','opposites'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'MULTIPLE_CHOICE', 1, 'The weather is ___. I need a coat.', '["hot","warm","cold","sunny"]', 'cold', '{"ru":"Если нужно пальто, значит холодно — cold."}', ARRAY['adjectives'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'MULTIPLE_CHOICE', 1, 'She is a ___ woman. Everyone loves her.', '["beauty","beautiful","beautifully","beautify"]', 'beautiful', '{"ru":"Прилагательное перед существительным: a beautiful woman."}', ARRAY['adjectives'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a1-basic-adjectives'), 'MULTIPLE_CHOICE', 1, 'Which adjective describes SIZE?', '["happy","cold","tall","quick"]', 'tall', '{"ru":"Tall описывает размер/рост. Happy — эмоция, cold — температура, quick — скорость."}', ARRAY['adjectives'], 20, 5);

-- ============================================================
-- VOCABULARY (20 core A1 words)
-- ============================================================
INSERT INTO vocabulary_entries (word, ipa, translation, examples, level_code) VALUES
('hello',     '/həˈloʊ/',   'привет',          '["Hello! How are you?","Say hello to your friends."]',       'A1'),
('goodbye',   '/ˌɡʊdˈbaɪ/', 'до свидания',     '["Goodbye! See you tomorrow!","She waved goodbye."]',        'A1'),
('please',    '/pliːz/',    'пожалуйста',      '["Can you help me, please?","Please be quiet."]',             'A1'),
('thank you', '/θæŋk juː/', 'спасибо',         '["Thank you for your help!","Thank you very much."]',         'A1'),
('sorry',     '/ˈsɒri/',    'извините',        '["I am sorry I am late.","Sorry, I do not understand."]',     'A1'),
('yes',       '/jes/',      'да',              '["Yes, I can!","Yes, please."]',                              'A1'),
('no',        '/nəʊ/',      'нет',             '["No, thank you.","No, I do not think so."]',                 'A1'),
('house',     '/haʊs/',     'дом',             '["I live in a big house.","The house has three bedrooms."]',  'A1'),
('car',       '/kɑːr/',     'машина',          '["My car is red.","Can you drive a car?"]',                   'A1'),
('book',      '/bʊk/',      'книга',           '["I read a book every night.","This is an interesting book."]','A1'),
('water',     '/ˈwɔːtər/',  'вода',            '["Can I have some water?","Water is very important."]',       'A1'),
('food',      '/fuːd/',     'еда',             '["I love Italian food.","The food here is delicious."]',      'A1'),
('school',    '/skuːl/',    'школа',           '["I go to school every day.","My school is near my house."]', 'A1'),
('friend',    '/frend/',    'друг',            '["She is my best friend.","I have many friends."]',           'A1'),
('work',      '/wɜːrk/',    'работа',          '["I work in a hospital.","Do you like your work?"]',          'A1'),
('eat',       '/iːt/',      'есть/кушать',     '["I eat breakfast at 8 AM.","She does not eat meat."]',       'A1'),
('drink',     '/drɪŋk/',    'пить',            '["I drink coffee every morning.","Do you want water?"]',      'A1'),
('speak',     '/spiːk/',    'говорить',        '["Can you speak English?","She speaks three languages."]',    'A1'),
('live',      '/lɪv/',      'жить',            '["Where do you live?","I live in Madrid."]',                  'A1'),
('love',      '/lʌv/',      'любить',          '["I love learning English!","She loves music."]',             'A1');
