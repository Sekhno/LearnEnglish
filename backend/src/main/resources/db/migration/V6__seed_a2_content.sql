-- ============================================================
-- V6: A2 Level Content
-- ============================================================

-- A2 Course & Module
INSERT INTO courses (level_id, name, description, order_index)
VALUES ((SELECT id FROM levels WHERE code = 'A2'), 'A2 English Course', 'Elementary course covering past tenses, future forms, comparisons and everyday communication.', 1);

INSERT INTO modules (course_id, name, description, order_index)
VALUES ((SELECT id FROM courses WHERE name = 'A2 English Course'), 'Grammar & Communication', 'Core grammar topics for A2 level.', 1);

-- ============================================================
-- TOPICS (all 18)
-- ============================================================
INSERT INTO topics (module_id, name, description, order_index, estimated_minutes)
SELECT m.id, t.name, t.description, t.ord, t.mins
FROM modules m,
(VALUES
  ('Past Simple',                    'Was/were, regular and irregular verbs in the past.',              1,  45),
  ('Past Continuous',                'Was/were + V-ing — actions in progress in the past.',             2,  35),
  ('Future: Will',                   'Predictions, spontaneous decisions and promises with will.',      3,  35),
  ('Be Going To',                    'Intentions and plans with be going to.',                          4,  30),
  ('Present Continuous for Future',  'Arranged future events using present continuous.',               5,  25),
  ('Comparatives & Superlatives',    'Bigger, better, the best — comparing people and things.',       6,  40),
  ('Much, Many, A Lot Of',           'Expressing large quantities with much, many and a lot of.',     7,  25),
  ('A Few, A Little, Enough',        'Expressing small quantities and sufficiency.',                   8,  25),
  ('Must, Have To, Should',          'Obligation, necessity and advice.',                              9,  35),
  ('Present Perfect Introduction',   'Have/has + past participle — life experience with ever/never.',  10, 40),
  ('Present Perfect vs Past Simple', 'Choosing between experience and finished past events.',          11, 40),
  ('Verb Patterns',                  'Like doing, want to do, enjoy doing — verb + gerund/infinitive.',12, 35),
  ('Adverbs of Manner',              'Quickly, carefully, well — describing how actions are done.',    13, 25),
  ('First Conditional',              'If + Present Simple, will — real future possibilities.',         14, 35),
  ('Infinitive of Purpose',          'To + verb — explaining the purpose of an action.',              15, 25),
  ('Too / Enough',                   'Too much and not enough — expressing excess and sufficiency.',   16, 30),
  ('Basic Relative Clauses',         'Who, which, that — connecting ideas in sentences.',              17, 30),
  ('Everyday Requests',              'Could, would like, may — polite requests and offers.',           18, 30)
) AS t(name, description, ord, mins)
WHERE m.name = 'Grammar & Communication'
  AND m.course_id = (SELECT id FROM courses WHERE name = 'A2 English Course');

-- ============================================================
-- LESSONS (all 18, one per topic)
-- ============================================================
INSERT INTO lessons (topic_id, name, slug, order_index, is_published)
SELECT t.id, l.lname, l.slug, 1, TRUE
FROM topics t
JOIN (VALUES
  ('Past Simple',                    'Past Simple',                    'a2-past-simple'),
  ('Past Continuous',                'Past Continuous',                'a2-past-continuous'),
  ('Future: Will',                   'Future: Will',                   'a2-future-will'),
  ('Be Going To',                    'Be Going To',                    'a2-be-going-to'),
  ('Present Continuous for Future',  'Present Continuous for Future',  'a2-present-continuous-future'),
  ('Comparatives & Superlatives',    'Comparatives & Superlatives',    'a2-comparatives-superlatives'),
  ('Much, Many, A Lot Of',           'Much, Many, A Lot Of',           'a2-much-many-a-lot-of'),
  ('A Few, A Little, Enough',        'A Few, A Little, Enough',        'a2-a-few-a-little-enough'),
  ('Must, Have To, Should',          'Must, Have To, Should',          'a2-must-have-to-should'),
  ('Present Perfect Introduction',   'Present Perfect Introduction',   'a2-present-perfect-intro'),
  ('Present Perfect vs Past Simple', 'Present Perfect vs Past Simple', 'a2-present-perfect-vs-past'),
  ('Verb Patterns',                  'Verb Patterns',                  'a2-verb-patterns'),
  ('Adverbs of Manner',              'Adverbs of Manner',              'a2-adverbs-manner'),
  ('First Conditional',              'First Conditional',              'a2-first-conditional'),
  ('Infinitive of Purpose',          'Infinitive of Purpose',          'a2-infinitive-purpose'),
  ('Too / Enough',                   'Too / Enough',                   'a2-too-enough'),
  ('Basic Relative Clauses',         'Basic Relative Clauses',         'a2-relative-clauses'),
  ('Everyday Requests',              'Everyday Requests',              'a2-everyday-requests')
) AS l(tname, lname, slug) ON t.name = l.tname
WHERE t.module_id = (SELECT id FROM modules WHERE course_id = (SELECT id FROM courses WHERE name = 'A2 English Course'));

-- ============================================================
-- THEORY BLOCKS
-- ============================================================

-- Lesson 1: Past Simple
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'),
$$**Past Simple** — used for completed actions in the past.

**Regular verbs:** add **-ed**
- work → worked, play → played, study → studied, stop → stopped

**Spelling rules:**
- End in -e: add -d → *liked, used*
- Consonant + y → ied: *tried, carried*
- Short vowel + consonant → double consonant: *stopped, planned*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'),
$$**Irregular verbs** — must be memorised:
- go → went, come → came, see → saw, eat → ate
- have → had, make → made, take → took, give → gave

**Negatives:** Subject + **did not (didn't)** + base verb
- I **didn't go** to school yesterday.

**Questions:** **Did** + subject + base verb?
- **Did** you see that film? — Yes, I **did**. / No, I **didn't**.

**Was / Were** (to be in the past):
- I/He/She/It **was** happy. ↔ You/We/They **were** happy.$$, 2);

-- Lesson 2: Past Continuous
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'),
$$**Past Continuous** — an action that was **in progress** at a specific time in the past.

**Form:** was/were + verb**-ing**
- I **was sleeping** at 10 PM.
- They **were watching** TV when I arrived.

**Uses:**
1. Action in progress at a past time: *At 7 AM she was having breakfast.*
2. Background to a Past Simple event: *I was walking home when it started to rain.*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'),
$$**Negatives:** was/were + **not** + V-ing
- He **wasn't listening** to me.

**Questions:** Was/Were + subject + V-ing?
- **Were** you sleeping? — Yes, I was. / No, I wasn't.

**When / While:**
- Use **when** before a short Past Simple action: *I was cooking **when** she called.*
- Use **while** before a continuous action: ***While** I was cooking, she called.*$$, 2);

-- Lesson 3: Future: Will
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-future-will'),
$$**Will** — used for:
1. **Predictions** (what we think will happen): *It will rain tomorrow.*
2. **Spontaneous decisions** (made at the moment): *The phone is ringing. I'll get it!*
3. **Promises and offers**: *I'll help you. / I'll carry that for you.*

**Form:** Subject + **will** + base verb
- I/You/He/She/We/They **will go** (no change for any person)
- Contraction: **'ll** → I'll, you'll, he'll, she'll, we'll, they'll$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'),
$$**Negatives:** Subject + **will not (won't)** + base verb
- She **won't come** to the party.

**Questions:** **Will** + subject + base verb?
- **Will** it snow tomorrow? — Yes, it will. / No, it won't.

**Common time expressions:** tomorrow, next week, next year, in the future, soon, in 2030

⚠️ **Will vs Going to:**
- Will → spontaneous decision / prediction without evidence
- Going to → planned decision / prediction with evidence$$, 2);

-- Lesson 4: Be Going To
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'),
$$**Be Going To** — used for:
1. **Intentions and plans** (decided before the moment of speaking):
   - *I'm going to study medicine at university.*
2. **Predictions based on evidence** (we can see it happening):
   - *Look at those clouds! It's going to rain.*

**Form:** am/is/are + **going to** + base verb
- I **am going to** visit Paris next summer.
- She **is going to** start a new job.
- They **are going to** get married.$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'),
$$**Negatives:** am/is/are + **not going to** + base verb
- I **am not going to** eat fast food anymore.

**Questions:** Am/Is/Are + subject + **going to** + base verb?
- **Are** you **going to** watch the game tonight?
  → Yes, I am. / No, I'm not.

**Contractions:** I'm, he's, she's, we're, they're going to...$$, 2);

-- Lesson 5: Present Continuous for Future
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'),
$$**Present Continuous for Future** — used for **fixed arrangements** (appointments, bookings, meetings already made).

- *I'm meeting Anna at 3 PM tomorrow.* (arranged, in calendar)
- *We're flying to London on Friday.* (tickets booked)
- *She's starting her new job on Monday.* (confirmed)

**Form:** am/is/are + V-ing (same as Present Continuous, but with a future time expression)$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'),
$$**Comparing future forms:**
| Form | Use | Example |
|------|-----|---------|
| Will | Spontaneous decision / promise | I'll call you later. |
| Going to | Plan / intention | I'm going to learn Spanish. |
| Pres. Continuous | Fixed arrangement | I'm having lunch with Tom tomorrow. |

**Common time expressions:** tomorrow, tonight, next Monday, this weekend, at 6 o'clock

⚠️ Always use a future time expression to show it refers to the future, not the present.$$, 2);

-- Lesson 6: Comparatives & Superlatives
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'),
$$**Comparatives** — comparing two things:
- Short adjectives (1 syllable): add **-er** + than
  - tall → **taller** than, fast → **faster** than
- Adjectives ending in -e: add **-r**: nice → **nicer** than
- Short vowel + consonant: double consonant: big → **bigger** than
- Two+ syllables: **more** + adjective + than
  - expensive → **more expensive** than
  - interesting → **more interesting** than$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'),
$$**Superlatives** — comparing three or more things (using **the**):
- Short adjectives: **the** + adjective + **-est**
  - tall → **the tallest**, fast → **the fastest**
- Two+ syllables: **the most** + adjective
  - **the most expensive**, **the most beautiful**

**Irregular forms — must learn:**
| Adjective | Comparative | Superlative |
|-----------|-------------|-------------|
| good | better | the best |
| bad | worse | the worst |
| far | farther/further | the farthest/furthest |$$, 2);

-- Lesson 7: Much, Many, A Lot Of
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'),
$$**Much, Many, A lot of** — expressing large quantities:

| Word | Used with | Example |
|------|-----------|---------|
| **Much** | Uncountable nouns (questions/negatives) | How much milk? / Not much time. |
| **Many** | Countable plural nouns (questions/negatives) | How many people? / Not many cars. |
| **A lot of** | Both (affirmative sentences) | A lot of money. / A lot of people. |$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'),
$$**Lots of** = A lot of (informal)
- *There are **lots of** things to do here.*

**How much / How many** — asking about quantity:
- **How much** does it cost?
- **How many** students are in the class?

⚠️ Common mistakes:
- ❌ I have many homework. → ✅ I have **a lot of** homework. *(uncountable)*
- ❌ How much brothers do you have? → ✅ How **many** brothers do you have? *(countable)*$$, 2);

-- Lesson 8: A Few, A Little, Enough
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'),
$$**A few / A little** — expressing small quantities:

| Word | Used with | Meaning | Example |
|------|-----------|---------|---------|
| **A few** | Countable plural nouns | some (positive) | I have **a few** friends. |
| **A little** | Uncountable nouns | some (positive) | I have **a little** money. |
| **Few** | Countable | almost none (negative) | **Few** people know this. |
| **Little** | Uncountable | almost none (negative) | There is **little** hope. |$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'),
$$**Enough** — expressing sufficiency:
- Adjective + **enough**: *Is the coffee hot **enough**?*
- **Enough** + noun: *Do we have **enough** time?*
- **Not enough**: *There isn't **enough** bread.*

**Too** (more than needed — negative):
- *This coffee is **too** hot to drink.*
- *He speaks **too** fast.*

**Enough** (just right — positive):
- *She is old **enough** to drive.*$$, 2);

-- Lesson 9: Must, Have To, Should
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'),
$$**Must / Have to** — obligation and necessity:
- **Must** — personal obligation, the speaker decides it is necessary:
  - *I **must** remember to call her.* (I think it is important)
- **Have to** — external obligation, rules or circumstances:
  - *I **have to** wear a uniform at work.* (company rule)

**Don't have to** — no obligation (not necessary):
- *You **don't have to** come if you are busy.* (it's your choice)

**Must not / Mustn't** — prohibition (absolutely NOT allowed):
- *You **mustn't** smoke in here.*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'),
$$**Should / Shouldn't** — advice and recommendation:
- **Should** → I think it is a good idea: *You **should** see a doctor.*
- **Shouldn't** → I think it is a bad idea: *You **shouldn't** eat so much sugar.*

| Modal | Meaning | Example |
|-------|---------|---------|
| must | strong obligation (self) | I must finish this. |
| have to | external obligation | She has to work Saturdays. |
| should | advice | You should sleep more. |
| mustn't | prohibition | You mustn't be late. |
| don't have to | no obligation | We don't have to hurry. |$$, 2);

-- Lesson 10: Present Perfect Introduction
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'),
$$**Present Perfect** — connects the past to the present.

**Form:** have/has + **past participle (V3)**
- I/You/We/They **have seen** (I've seen)
- He/She/It **has seen** (He's seen)

**Main use: Life experience** — something that happened at an unspecified time before now.
- *I **have visited** Paris.* (at some point in my life)
- *She **has never eaten** sushi.* (never in her life)

**Key words: ever / never**
- **Ever** in questions: *Have you **ever** been to Japan?*
- **Never** in statements: *I have **never** tried skiing.*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'),
$$**Negatives:** have/has + **not** + past participle
- I **haven't** seen that film.
- She **hasn't** tried sushi.

**Questions:** Have/Has + subject + past participle?
- **Have** you **ever** met a famous person? → Yes, I have. / No, I haven't.

**Irregular past participles — key forms:**
- go → gone/been, see → seen, eat → eaten
- do → done, make → made, take → taken
- write → written, give → given, speak → spoken$$, 2);

-- Lesson 11: Present Perfect vs Past Simple
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'),
$$**Present Perfect vs Past Simple:**

| Present Perfect | Past Simple |
|-----------------|-------------|
| Life experience (no specific time) | Specific finished time |
| *I have visited Rome.* | *I visited Rome in 2019.* |
| Connected to the present | Completely in the past |
| ever, never, already, yet | yesterday, last year, in 2020, ago |$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'),
$$**Key time expressions:**
- **Present Perfect:** ever, never, already, yet, just, recently, before
- **Past Simple:** yesterday, last week, in 2020, two years ago, when I was young

**Examples:**
- *I've **already** eaten.* (PP — result relevant now)
- *I ate at 7 PM.* (PS — specific time)
- *Have you **ever** been to London?* (PP — life experience)
- *I **went** to London last summer.* (PS — specific event)

⚠️ Never use specific past time with Present Perfect:
- ❌ I have seen him yesterday. → ✅ I saw him yesterday.$$, 2);

-- Lesson 12: Verb Patterns
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'),
$$**Verb Patterns** — some verbs are followed by **-ing**, others by **to + infinitive**.

**Verb + -ing (gerund):**
- enjoy, love, like, hate, mind, finish, stop, miss, suggest
- *I **enjoy swimming**.*  *She **hates waking** up early.*

**Verb + to + infinitive:**
- want, need, hope, decide, plan, forget, learn, promise, refuse
- *I **want to travel**.*  *He **decided to leave**.*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'),
$$**Verbs with BOTH forms (similar meaning):**
- like / love / hate + -ing or to + inf: *I like cooking. / I like to cook.*

**Verbs with BOTH forms (different meaning):**
- **stop + -ing** = stop an action: *She stopped smoking.*
- **stop + to inf** = stop in order to: *She stopped to smoke.* (paused)
- **remember + -ing** = recall a memory: *I remember meeting him.*
- **remember + to inf** = remember to do sth: *Remember to call me.*

⚠️ Always learn verb patterns together with the verb when you study vocabulary.$$, 2);

-- Lesson 13: Adverbs of Manner
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'),
$$**Adverbs of Manner** describe **how** an action is done.

**Formation:** adjective + **-ly**
- quick → **quickly**, careful → **carefully**
- slow → **slowly**, loud → **loudly**, soft → **softly**

**Spelling rules:**
- Adjective ends in -y: change y → i + ly: *happy → happily, angry → angrily*
- Adjective ends in -le: change e → y: *gentle → gently, simple → simply*
- Adjective ends in -ic: add -ally: *basic → basically*

**Irregular adverbs:**
- good → **well**, fast → **fast**, hard → **hard**, early → **early**$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'),
$$**Position of adverbs of manner:**
- Usually **after** the verb (or verb + object):
  - *She speaks **quietly**.* / *He drives the car **carefully**.*
- **Before** an adjective or another adverb:
  - *She is **incredibly** smart.* / *He works **surprisingly** fast.*

⚠️ Common mistakes:
- ❌ She plays good. → ✅ She plays **well**.
- ❌ He spoke very quick. → ✅ He spoke very **quickly**.
- ❌ She works hardly. → ✅ She works **hard**. (hardly = almost not)$$, 2);

-- Lesson 14: First Conditional
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'),
$$**First Conditional** — real and possible future conditions.

**Structure:** If + **Present Simple** ... **will** + base verb

- *If it **rains** tomorrow, I **will** stay at home.*
- *If you **study** hard, you **will** pass the exam.*
- *I **will** be late if the bus **doesn't come** soon.*

The **if-clause** can come first or second in the sentence.
- Comma after the if-clause when it comes first: *If..., will...*
- No comma when the main clause comes first: *...will... if...*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'),
$$**Variations using other modals:**
- *If you are tired, you **can** go to bed.* (permission/possibility)
- *If she calls, **tell** her I'm busy.* (imperative in result)
- *If they arrive late, we **might** start without them.* (less certain)

**Common mistakes:**
- ❌ If it will rain, I will stay home. → ✅ If it **rains**, I will stay home.
  *(Never use will in the if-clause)*
- ❌ If I will see him, I'll say hello. → ✅ If I **see** him, I'll say hello.

**Time expressions:** when, as soon as, until, unless (= if not)
- *Unless you hurry, you will miss the train.* (= If you don't hurry...)$$, 2);

-- Lesson 15: Infinitive of Purpose
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'),
$$**Infinitive of Purpose** — using **to + verb** to explain **why** we do something.

- *I went to the shop **to buy** milk.*  (Why? To buy milk.)
- *She is studying **to pass** her exam.*
- *He called me **to ask** for help.*

**In order to** (more formal, same meaning):
- *She works hard **in order to** earn more money.*

⚠️ Do NOT use *for + verb*:
- ❌ I went to the shop for buy milk.
- ✅ I went to the shop **to buy** milk.$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'),
$$**Negative infinitive of purpose:** not to / in order not to
- *I whispered **not to** wake the baby.*
- *She left early **in order not to** miss the train.*

**For + noun** is correct (purpose with a noun, not a verb):
- *This knife is used **for** cutting bread.* ✅
- *I go to the gym **for** exercise.* ✅

**Questions:** What do you use it for? / What did you go there for?
- *What did you go to the library **for**? — **To** return some books.*$$, 2);

-- Lesson 16: Too / Enough
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'),
$$**Too** — more than necessary or desirable (negative meaning):
- **too** + adjective: *This coffee is **too** hot to drink.*
- **too** + adverb: *He drives **too** fast.*
- **too many** + countable noun: *There are **too many** cars on the road.*
- **too much** + uncountable noun: *I had **too much** food.*

**Enough** — just the right amount (positive or sufficient):
- adjective + **enough**: *The soup is hot **enough** to eat.*
- **enough** + noun: *Do we have **enough** chairs?*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'),
$$**Not enough** — less than necessary (negative):
- *There isn't **enough** food for everyone.*
- *She's not old **enough** to drive.*

**Common structure:** too/enough + **to + infinitive**
- *This bag is **too heavy** to carry.*
- *She is **tall enough** to reach the shelf.*

⚠️ Position:
- **Too** comes BEFORE the adjective: *too expensive*
- **Enough** comes AFTER the adjective: *good enough* (NOT enough good)
- **Enough** comes BEFORE the noun: *enough time* (NOT time enough)$$, 2);

-- Lesson 17: Basic Relative Clauses
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'),
$$**Relative Clauses** — give more information about a noun in the same sentence.

**Who** — for people:
- *The man **who** lives next door is a doctor.*
- *Do you know the woman **who** won the race?*

**Which** — for things and animals:
- *I lost the book **which** you gave me.*
- *The restaurant **which** we visited was excellent.*

**That** — for people OR things (informal):
- *The girl **that** called is my sister.*
- *The film **that** we watched was amazing.*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'),
$$**Where** — for places:
- *This is the café **where** I first met her.*

**Whose** — for possession:
- *That is the student **whose** bag was stolen.*

**When** relative clauses can replace the noun:
- I know a place. → I know a place **where** you can park.
- She is the teacher. She helped me. → She is the teacher **who** helped me.

⚠️ **Defining vs Non-defining:**
- Defining (no commas): gives essential information — *The man **who** lives next door is a doctor.*
- Non-defining (commas): adds extra information — *My brother, **who** lives in Paris, is a chef.*$$, 2);

-- Lesson 18: Everyday Requests
INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'),
$$**Polite Requests:**
- **Can** I / you...? — informal: *Can you open the window?*
- **Could** I / you...? — more polite: *Could you help me, please?*
- **May** I...? — formal: *May I leave early today?*
- **Would you mind** + V-ing? — very polite: *Would you mind closing the door?*

**Offers:**
- **Would you like** + noun/to-inf: *Would you like a coffee? / Would you like to sit down?*
- **Can** I get you...? — *Can I get you anything?*
- **Shall** I...? — *Shall I help you with that?*$$, 1),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'),
$$**Responding to requests:**
- Accepting: *Of course! / Certainly! / Sure! / No problem!*
- Declining politely: *I'm sorry, I'm afraid I can't. / I'm sorry, I'm busy.*

**Responding to "Would you mind...?":**
- Accepting: *Not at all. / Of course not. / No, go ahead.*
  *(mind = object to, so "not at all" = yes, I'll do it)*
- Declining: *I'm sorry, I'd rather you didn't.*

**Ordering in a café/restaurant:**
- *I'd like a coffee, please.*  (= I would like)
- *Could I have the menu, please?*
- *Can I get a glass of water?*$$, 2);

-- ============================================================
-- EXAMPLES
-- ============================================================
INSERT INTO examples (lesson_id, english_text, translation, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'I visited my grandparents last weekend.', 'На прошлых выходных я навестил своих бабушку и дедушку.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'She didn''t come to school yesterday because she was sick.', 'Вчера она не пришла в школу, потому что болела.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'Did you see the game last night? — Yes, it was amazing!', 'Ты смотрел игру вчера вечером? — Да, это было потрясающе!', 3),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'He went to Paris, saw the Eiffel Tower and ate croissants.', 'Он поехал в Париж, увидел Эйфелеву башню и съел круассаны.', 4),

((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'I was watching TV when the lights went out.', 'Я смотрел телевизор, когда погас свет.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'What were you doing at 8 o''clock last night?', 'Что ты делал вчера вечером в 8 часов?', 2),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'While she was sleeping, someone knocked on the door.', 'Пока она спала, кто-то постучал в дверь.', 3),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'They were playing football when it started to rain.', 'Они играли в футбол, когда начался дождь.', 4),

((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'I think it will be a sunny day tomorrow.', 'Я думаю, завтра будет солнечный день.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'Wait, I''ll open the door for you!', 'Подожди, я открою тебе дверь!', 2),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'Don''t worry, everything will be fine.', 'Не волнуйся, всё будет хорошо.', 3),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'Will you help me with this exercise? — Sure, I will!', 'Ты поможешь мне с этим упражнением? — Конечно!', 4),

((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'I''m going to start learning Spanish next month.', 'В следующем месяце я собираюсь начать учить испанский.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'Look at those clouds — it''s going to rain!', 'Посмотри на эти тучи — сейчас будет дождь!', 2),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'Are you going to watch the film tonight?', 'Ты собираешься смотреть фильм сегодня вечером?', 3),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'She''s not going to apply for that job.', 'Она не собирается подавать заявку на эту работу.', 4),

((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'I''m meeting the doctor at 4 PM tomorrow.', 'Завтра в 16:00 у меня встреча с врачом.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'We''re flying to Madrid on Saturday morning.', 'В субботу утром мы летим в Мадрид.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'What are you doing this weekend?', 'Что ты делаешь на этих выходных?', 3),

((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'This laptop is more expensive than my old one.', 'Этот ноутбук дороже моего старого.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'The Amazon is the longest river in the world.', 'Амазонка — самая длинная река в мире.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'My sister is taller than me but I am older.', 'Моя сестра выше меня, но я старше.', 3),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'This was the worst film I have ever seen.', 'Это был худший фильм, который я когда-либо видел.', 4),

((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'How many people came to the party?', 'Сколько людей пришло на вечеринку?', 1),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'I don''t have much time — the bus leaves in five minutes.', 'У меня немного времени — автобус отправляется через пять минут.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'There are a lot of things to do in Barcelona.', 'В Барселоне много чего можно посмотреть.', 3),

((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'I have a little money left — just enough for a coffee.', 'У меня осталось немного денег — как раз на кофе.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'Only a few students passed the exam.', 'Лишь несколько студентов сдали экзамен.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'Is there enough milk for the cake?', 'Достаточно ли молока для торта?', 3),

((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'You must wear a seatbelt — it''s the law!', 'Ты обязан пристегнуть ремень безопасности — это закон!', 1),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'She has to work on Saturdays this month.', 'В этом месяце ей нужно работать по субботам.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'You should drink more water and sleep earlier.', 'Тебе следует пить больше воды и ложиться спать раньше.', 3),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'You don''t have to come if you don''t want to.', 'Тебе не обязательно приходить, если не хочешь.', 4),

((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'Have you ever tried Japanese food?', 'Ты когда-нибудь пробовал японскую еду?', 1),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'I have never seen snow in my life.', 'Я никогда в жизни не видел снега.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'She has won three gold medals at the Olympics.', 'Она выиграла три золотые медали на Олимпийских играх.', 3),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'Have you finished your homework yet?', 'Ты уже сделал домашнее задание?', 4),

((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'I have visited Rome, but I went there in 2018.', 'Я бывал в Риме — я ездил туда в 2018 году.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'Have you seen this film? — Yes, I saw it last Friday.', 'Ты видел этот фильм? — Да, я смотрел его в прошлую пятницу.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'She has already eaten, so she didn''t order anything.', 'Она уже поела, поэтому ничего не заказала.', 3),

((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'I enjoy listening to music when I cook.', 'Я люблю слушать музыку, когда готовлю.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'He decided to study medicine after watching a documentary.', 'Он решил изучать медицину после просмотра документального фильма.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'Would you mind closing the window?', 'Не могли бы вы закрыть окно?', 3),

((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'She speaks English fluently and confidently.', 'Она говорит по-английски бегло и уверенно.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'He plays the guitar really well.', 'Он очень хорошо играет на гитаре.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'Please drive carefully — the roads are icy.', 'Пожалуйста, езди осторожно — дороги обледенелые.', 3),

((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'If you don''t hurry, you will miss the bus.', 'Если не поторопишься, опоздаешь на автобус.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'I will help you if you ask me nicely.', 'Я помогу тебе, если ты вежливо попросишь.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'If it rains tomorrow, we can go to the cinema instead.', 'Если завтра будет дождь, мы можем вместо этого пойти в кино.', 3),

((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'I went to the library to return some books.', 'Я пошёл в библиотеку, чтобы вернуть книги.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'She studies every day to improve her English.', 'Она занимается каждый день, чтобы улучшить свой английский.', 2),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'He called the restaurant to make a reservation.', 'Он позвонил в ресторан, чтобы сделать бронирование.', 3),

((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'This coat is too big for me — I need a smaller size.', 'Это пальто мне слишком велико — нужен размер поменьше.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'Is the soup hot enough? — Yes, it''s perfect!', 'Суп достаточно горячий? — Да, отлично!', 2),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'She wasn''t old enough to watch that film.', 'Она была недостаточно взрослой, чтобы смотреть этот фильм.', 3),

((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'The woman who works in the bakery makes amazing cakes.', 'Женщина, которая работает в пекарне, делает потрясающие торты.', 1),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'Is this the book that you were talking about?', 'Это та книга, о которой ты говорил?', 2),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'I want to go back to the city where I grew up.', 'Я хочу вернуться в город, где я вырос.', 3),

((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'Could you turn down the music, please?', 'Не могли бы вы убавить музыку, пожалуйста?', 1),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'Would you like a glass of water? — Yes, please!', 'Хотите стакан воды? — Да, пожалуйста!', 2),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'May I use your phone? — Of course, go ahead.', 'Можно воспользоваться вашим телефоном? — Конечно, пожалуйста.', 3);

-- ============================================================
-- EXERCISES
-- ============================================================

-- Lesson 1: Past Simple
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'MULTIPLE_CHOICE', 1, 'She ___ to work by bus yesterday.', '["go","goes","went","going"]', 'went', '{"ru":"go — неправильный глагол: went в прошедшем времени."}', ARRAY['past-simple','irregular'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'MULTIPLE_CHOICE', 1, 'I ___ my homework last night.', '["finish","finished","finishes","finishing"]', 'finished', '{"ru":"Правильный глагол finish + ed = finished."}', ARRAY['past-simple','regular'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'MULTIPLE_CHOICE', 1, '___ you see the match last night?', '["Did","Do","Does","Were"]', 'Did', '{"ru":"Вопросы в Past Simple: Did + subject + base verb?"}', ARRAY['past-simple','questions'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'MULTIPLE_CHOICE', 1, 'He ___ not come to the party.', '["do","does","did","was"]', 'did', '{"ru":"Отрицание: did not (didn''t) + base verb."}', ARRAY['past-simple','negation'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'MULTIPLE_CHOICE', 2, 'Which sentence is CORRECT?', '["She goed to the market","He didn''t went home","They played tennis yesterday","We did saw a great film"]', 'They played tennis yesterday', '{"ru":"They played — правильная форма прошедшего времени. Остальные содержат ошибки."}', ARRAY['past-simple','error-correction'], 30, 5),
((SELECT id FROM lessons WHERE slug = 'a2-past-simple'), 'MULTIPLE_CHOICE', 1, 'The weather ___ very cold last winter.', '["is","are","was","were"]', 'was', '{"ru":"The weather = it → was в прошедшем времени."}', ARRAY['past-simple','was-were'], 20, 6);

-- Lesson 2: Past Continuous
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'MULTIPLE_CHOICE', 1, 'At 10 PM last night I ___ TV.', '["watch","watched","was watching","am watching"]', 'was watching', '{"ru":"Действие в прогрессе в прошлом: was/were + V-ing."}', ARRAY['past-continuous'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'MULTIPLE_CHOICE', 1, 'They ___ football when it started to rain.', '["played","play","were playing","are playing"]', 'were playing', '{"ru":"They + were + playing — действие в прогрессе."}', ARRAY['past-continuous'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'MULTIPLE_CHOICE', 1, '___ you sleeping when I called?', '["Did","Were","Was","Do"]', 'Were', '{"ru":"Вопрос Past Continuous с you: Were you...?"}', ARRAY['past-continuous','questions'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'MULTIPLE_CHOICE', 2, 'I ___ while she ___ dinner.', '["read / was cooking","was reading / cooked","was reading / was cooking","read / cooked"]', 'was reading / was cooking', '{"ru":"Два параллельных действия в прошлом — оба в Past Continuous."}', ARRAY['past-continuous','while'], 30, 4),
((SELECT id FROM lessons WHERE slug = 'a2-past-continuous'), 'MULTIPLE_CHOICE', 1, 'He ___ not listening to the teacher.', '["did","was","were","is"]', 'was', '{"ru":"He was not listening — отрицание Past Continuous."}', ARRAY['past-continuous','negation'], 20, 5);

-- Lesson 3: Future: Will
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'MULTIPLE_CHOICE', 1, '"The phone is ringing." — "OK, I ___ answer it."', '["am going to","will","am answering","answer"]', 'will', '{"ru":"Спонтанное решение в момент речи → will."}', ARRAY['future-will','spontaneous'], 25, 1),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'MULTIPLE_CHOICE', 1, 'I think Barcelona ___ win the championship.', '["is going to","will","are","was"]', 'will', '{"ru":"Предсказание без доказательств → will."}', ARRAY['future-will','prediction'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'MULTIPLE_CHOICE', 1, 'She ___ not forget to call you.', '["won''t","will not to","doesn''t will","isn''t will"]', 'won''t', '{"ru":"Отрицание: will not = won''t."}', ARRAY['future-will','negation'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'MULTIPLE_CHOICE', 1, '___ you help me carry this box?', '["Do","Are","Will","Shall"]', 'Will', '{"ru":"Просьба о помощи в будущем: Will you...?"}', ARRAY['future-will','requests'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-future-will'), 'MULTIPLE_CHOICE', 2, 'Which sentence uses will CORRECTLY?', '["I will to call you","She wills be late","They will come tomorrow","He will going home"]', 'They will come tomorrow', '{"ru":"will + base verb (без to, без -s, без -ing): They will come."}', ARRAY['future-will','form'], 25, 5);

-- Lesson 4: Be Going To
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'MULTIPLE_CHOICE', 1, 'Look at the sky — it ___ snow tonight.', '["will","is going to","goes to","going to"]', 'is going to', '{"ru":"Есть доказательство (вид неба) → going to."}', ARRAY['be-going-to','evidence'], 25, 1),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'MULTIPLE_CHOICE', 1, 'We ___ buy a new car next year.', '["are going to","will to","going","goes"]', 'are going to', '{"ru":"Запланированное намерение → are going to."}', ARRAY['be-going-to','plan'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'MULTIPLE_CHOICE', 1, '___ she going to study medicine?', '["Is","Are","Will","Does"]', 'Is', '{"ru":"Вопрос с she: Is she going to...?"}', ARRAY['be-going-to','questions'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'MULTIPLE_CHOICE', 1, 'I ___ not going to eat meat anymore.', '["am","is","are","will"]', 'am', '{"ru":"I am not going to... — правильная форма."}', ARRAY['be-going-to','negation'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-be-going-to'), 'MULTIPLE_CHOICE', 2, 'Which form is correct for a planned intention?', '["I will visit my parents (I booked the ticket)","I am going to visit my parents (I booked the ticket)","I visit my parents tomorrow","I visiting my parents"]', 'I am going to visit my parents (I booked the ticket)', '{"ru":"Запланированное заранее действие → going to."}', ARRAY['be-going-to','will-vs-going-to'], 30, 5);

-- Lesson 5: Present Continuous for Future
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'MULTIPLE_CHOICE', 1, '"What are you doing tonight?" — "I ___ at a restaurant." (reservation made)', '["will eat","eat","am eating","have eaten"]', 'am eating', '{"ru":"Забронированное место → Present Continuous."}', ARRAY['pc-future','arrangement'], 25, 1),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'MULTIPLE_CHOICE', 1, 'We ___ to Rome on Friday morning. (tickets booked)', '["will fly","fly","are flying","flew"]', 'are flying', '{"ru":"Забронированные билеты → Are flying."}', ARRAY['pc-future'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'MULTIPLE_CHOICE', 2, 'Which sentence describes a fixed arrangement?', '["I think it will be cold tomorrow","I might go to the gym","I''m having dinner with Tom at 8 PM","She goes to the gym every day"]', 'I''m having dinner with Tom at 8 PM', '{"ru":"Конкретная договорённость (Tom, 8 PM) → Present Continuous for future."}', ARRAY['pc-future','vs-other-futures'], 30, 3),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'MULTIPLE_CHOICE', 1, '___ you meeting Anna tomorrow?', '["Will","Do","Are","Have"]', 'Are', '{"ru":"Вопрос Present Continuous: Are you meeting...?"}', ARRAY['pc-future','questions'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-present-continuous-future'), 'MULTIPLE_CHOICE', 1, 'She is starting her new job ___.', '["yesterday","now","on Monday","often"]', 'on Monday', '{"ru":"Present Continuous for future требует выражения будущего времени."}', ARRAY['pc-future','time-expressions'], 20, 5);

-- Lesson 6: Comparatives & Superlatives
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'MULTIPLE_CHOICE', 1, 'This film is ___ than the one we watched last week.', '["more interesting","interestinger","most interesting","the most interesting"]', 'more interesting', '{"ru":"Interesting (3 слога) → more interesting (сравнительная)."}', ARRAY['comparatives'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'MULTIPLE_CHOICE', 1, 'Mount Everest is ___ mountain in the world.', '["higher","the highest","more high","most high"]', 'the highest', '{"ru":"Превосходная степень (3+ объекта): the + highest."}', ARRAY['superlatives'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'MULTIPLE_CHOICE', 1, 'He is ___ in the class.', '["the more tall","tallest","the tallest","more tall"]', 'the tallest', '{"ru":"Одна слог: tall → the tallest (превосходная)."}', ARRAY['superlatives'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'MULTIPLE_CHOICE', 1, 'Your English is getting ___ every day.', '["more good","gooder","better","the best"]', 'better', '{"ru":"good → better (сравнительная, неправильная форма)."}', ARRAY['comparatives','irregular'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'MULTIPLE_CHOICE', 2, 'Which sentence is CORRECT?', '["She is more tall than her brother","He is the more intelligent student","This is the worst film I have ever seen","That is more bad than I expected"]', 'This is the worst film I have ever seen', '{"ru":"bad → worse → the worst. This is the worst — правильно."}', ARRAY['superlatives','irregular'], 30, 5),
((SELECT id FROM lessons WHERE slug = 'a2-comparatives-superlatives'), 'MULTIPLE_CHOICE', 1, 'A sports car is usually ___ than a family car.', '["more fast","fastest","faster","the fastest"]', 'faster', '{"ru":"fast (1 слог) → faster (сравнительная)."}', ARRAY['comparatives'], 20, 6);

-- Lesson 7: Much, Many, A Lot Of
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'MULTIPLE_CHOICE', 1, 'How ___ people were at the concert?', '["much","many","a lot","few"]', 'many', '{"ru":"People — исчисляемое существительное → many."}', ARRAY['many','quantifiers'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'MULTIPLE_CHOICE', 1, 'I don''t have ___ time right now.', '["many","much","a lot","few"]', 'much', '{"ru":"Time — неисчисляемое существительное → much в отрицаниях."}', ARRAY['much','quantifiers'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'MULTIPLE_CHOICE', 1, 'There are ___ great restaurants in this city.', '["much","a lot of","many a","lot"]', 'a lot of', '{"ru":"Утвердительное предложение + исчисляемое → a lot of."}', ARRAY['a-lot-of'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'MULTIPLE_CHOICE', 1, 'I need to buy ___ things at the market.', '["much","a lot of","many a","lot of"]', 'a lot of', '{"ru":"a lot of + мн.ч. существительное в утвердительном предложении."}', ARRAY['a-lot-of'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-much-many-a-lot-of'), 'MULTIPLE_CHOICE', 2, 'Which sentence is INCORRECT?', '["How much water do you drink?","I have many homework","There are a lot of cars here","Not many students passed"]', 'I have many homework', '{"ru":"Homework — неисчисляемое. Правильно: a lot of homework."}', ARRAY['much','countability','error-correction'], 25, 5);

-- Lesson 8: A Few, A Little, Enough
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'MULTIPLE_CHOICE', 1, 'I need ___ advice — this is a difficult situation.', '["a few","a little","many","few"]', 'a little', '{"ru":"Advice — неисчисляемое → a little."}', ARRAY['a-little'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'MULTIPLE_CHOICE', 1, 'Only ___ students understood the lesson.', '["a little","much","a few","little"]', 'a few', '{"ru":"Students — исчисляемое мн.ч. → a few."}', ARRAY['a-few'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'MULTIPLE_CHOICE', 1, 'Is there ___ milk for the coffee?', '["a few","many","enough","too"]', 'enough', '{"ru":"Достаточно ли? → enough + uncountable."}', ARRAY['enough'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'MULTIPLE_CHOICE', 1, 'He isn''t old ___ to vote.', '["too","enough","much","many"]', 'enough', '{"ru":"adjective + enough: old enough to vote."}', ARRAY['enough','age'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-a-few-a-little-enough'), 'MULTIPLE_CHOICE', 2, 'Which sentence is CORRECT?', '["I have few money","She has a little friends","A little people know the truth","I have a little experience in teaching"]', 'I have a little experience in teaching', '{"ru":"Experience — неисчисляемое → a little experience. Правильно."}', ARRAY['a-little','a-few','error-correction'], 30, 5);

-- Lesson 9: Must, Have To, Should
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'MULTIPLE_CHOICE', 1, 'You ___ see a doctor — that cough sounds bad.', '["must to","should","have","mustn''t"]', 'should', '{"ru":"Совет: You should see a doctor."}', ARRAY['should','advice'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'MULTIPLE_CHOICE', 1, 'All passengers ___ wear a seatbelt. It''s the law.', '["should","must","don''t have to","mustn''t"]', 'must', '{"ru":"Строгое обязательство (закон): must."}', ARRAY['must','obligation'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'MULTIPLE_CHOICE', 1, 'She ___ work on Sundays. It''s in her contract.', '["must","should","has to","mustn''t"]', 'has to', '{"ru":"Внешнее обязательство (контракт): has to."}', ARRAY['have-to','external'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'MULTIPLE_CHOICE', 1, 'You ___ tell anyone my secret!', '["don''t have to","shouldn''t","mustn''t","should"]', 'mustn''t', '{"ru":"Категорический запрет: mustn''t."}', ARRAY['mustnt','prohibition'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'MULTIPLE_CHOICE', 2, 'The meeting is optional. You ___ attend.', '["must","have to","don''t have to","mustn''t"]', 'don''t have to', '{"ru":"Нет обязательства (по желанию): don''t have to."}', ARRAY['dont-have-to'], 25, 5),
((SELECT id FROM lessons WHERE slug = 'a2-must-have-to-should'), 'MULTIPLE_CHOICE', 1, 'I ___ finish this report today — my boss needs it.', '["should","must","don''t have to","mustn''t"]', 'must', '{"ru":"Личное ощущение срочности: must."}', ARRAY['must','urgency'], 20, 6);

-- Lesson 10: Present Perfect Introduction
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'MULTIPLE_CHOICE', 1, 'I ___ never tried sushi.', '["have","has","had","am"]', 'have', '{"ru":"I have never tried — Present Perfect."}', ARRAY['present-perfect','never'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'MULTIPLE_CHOICE', 1, 'She ___ already finished the book.', '["have","has","had","is"]', 'has', '{"ru":"She has + past participle — 3-е лицо ед.ч."}', ARRAY['present-perfect','already'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'MULTIPLE_CHOICE', 1, 'Have you ever ___ to Australia?', '["go","went","gone","goes"]', 'gone', '{"ru":"Have you ever gone — правильное причастие прошедшего времени go → gone."}', ARRAY['present-perfect','ever','irregular'], 25, 3),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'MULTIPLE_CHOICE', 1, 'Has he ___ the car yet?', '["wash","washes","washed","washing"]', 'washed', '{"ru":"Has + past participle: washed."}', ARRAY['present-perfect','yet'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'MULTIPLE_CHOICE', 2, 'Which sentence uses Present Perfect CORRECTLY?', '["I have seen him yesterday","She has never been to Asia","Did they already arrived?","We have went to the beach"]', 'She has never been to Asia', '{"ru":"She has never been — правильно. Остальные содержат ошибки."}', ARRAY['present-perfect','error-correction'], 30, 5),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-intro'), 'MULTIPLE_CHOICE', 1, 'I ___ just eaten lunch.', '["had","have","has","did"]', 'have', '{"ru":"I have just eaten — действие недавно завершилось."}', ARRAY['present-perfect','just'], 20, 6);

-- Lesson 11: Present Perfect vs Past Simple
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'MULTIPLE_CHOICE', 1, 'I ___ Paris in 2019.', '["have visited","visited","visit","was visiting"]', 'visited', '{"ru":"In 2019 — конкретное время в прошлом → Past Simple."}', ARRAY['past-simple','time-expression'], 25, 1),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'MULTIPLE_CHOICE', 1, '___ you ever eaten Thai food?', '["Did","Have","Do","Were"]', 'Have', '{"ru":"Ever = жизненный опыт → Present Perfect: Have you ever...?"}', ARRAY['present-perfect','ever'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'MULTIPLE_CHOICE', 2, 'Which sentence is CORRECT?', '["I have seen him yesterday","I saw him yesterday","I have saw him yesterday","I did see him yesterday"]', 'I saw him yesterday', '{"ru":"Yesterday — конкретное прошлое время → Past Simple: I saw."}', ARRAY['past-simple','error-correction'], 30, 3),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'MULTIPLE_CHOICE', 1, 'She ___ already left when I arrived.', '["has","have","had","was"]', 'had', '{"ru":"Действие завершилось до другого прошлого → Past Perfect: had left."}', ARRAY['past-perfect','sequence'], 25, 4),
((SELECT id FROM lessons WHERE slug = 'a2-present-perfect-vs-past'), 'MULTIPLE_CHOICE', 1, 'I ___ never met a real celebrity.', '["did","have","had","was"]', 'have', '{"ru":"Жизненный опыт с never → Present Perfect: have never met."}', ARRAY['present-perfect','never'], 20, 5);

-- Lesson 12: Verb Patterns
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'MULTIPLE_CHOICE', 1, 'I enjoy ___ in the mountains.', '["to hike","hike","hiking","hiked"]', 'hiking', '{"ru":"enjoy + V-ing (герундий)."}', ARRAY['verb-patterns','gerund'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'MULTIPLE_CHOICE', 1, 'He wants ___ a new car next year.', '["buying","buy","to buy","bought"]', 'to buy', '{"ru":"want + to + infinitive."}', ARRAY['verb-patterns','infinitive'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'MULTIPLE_CHOICE', 1, 'She finished ___ the report and went home.', '["write","to write","writing","wrote"]', 'writing', '{"ru":"finish + V-ing (герундий)."}', ARRAY['verb-patterns','gerund'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'MULTIPLE_CHOICE', 1, 'Did you remember ___ the door?', '["lock","locking","locked","to lock"]', 'to lock', '{"ru":"remember + to + inf = не забыть сделать что-то."}', ARRAY['verb-patterns','remember'], 25, 4),
((SELECT id FROM lessons WHERE slug = 'a2-verb-patterns'), 'MULTIPLE_CHOICE', 2, 'Which sentence is CORRECT?', '["She decided going abroad","He enjoys to swim","They hope visiting Japan","I decided to learn Spanish"]', 'I decided to learn Spanish', '{"ru":"decide + to + infinitive. Остальные неверны: enjoy + -ing, hope + to inf."}', ARRAY['verb-patterns','error-correction'], 30, 5);

-- Lesson 13: Adverbs of Manner
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'MULTIPLE_CHOICE', 1, 'He plays tennis very ___.', '["good","well","best","better"]', 'well', '{"ru":"good → well (неправильное наречие)."}', ARRAY['adverbs-manner','irregular'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'MULTIPLE_CHOICE', 1, 'What is the adverb form of "careful"?', '["carful","carefully","carefuly","care"]', 'carefully', '{"ru":"careful + ly = carefully."}', ARRAY['adverbs-manner','formation'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'MULTIPLE_CHOICE', 1, 'Please drive ___! The road is wet.', '["careful","carefully","more careful","careless"]', 'carefully', '{"ru":"Наречие образа действия: carefully."}', ARRAY['adverbs-manner'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'MULTIPLE_CHOICE', 1, 'She answered the question ___.', '["quick","quickful","quickly","quicken"]', 'quickly', '{"ru":"quick + ly = quickly."}', ARRAY['adverbs-manner','formation'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-adverbs-manner'), 'MULTIPLE_CHOICE', 2, 'Which adverb is IRREGULAR?', '["slowly","angrily","fast","loudly"]', 'fast', '{"ru":"Fast → fast (не fast + ly). Irregular adverb."}', ARRAY['adverbs-manner','irregular'], 25, 5);

-- Lesson 14: First Conditional
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'MULTIPLE_CHOICE', 1, 'If it ___ tomorrow, we will cancel the picnic.', '["will rain","rains","rained","rain"]', 'rains', '{"ru":"В придаточном условном: If + Present Simple (не will)."}', ARRAY['first-conditional','if-clause'], 25, 1),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'MULTIPLE_CHOICE', 1, 'If you study hard, you ___ the test.', '["pass","will pass","would pass","passed"]', 'will pass', '{"ru":"Главное предложение: will + base verb."}', ARRAY['first-conditional','main-clause'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'MULTIPLE_CHOICE', 1, '___ you don''t hurry, you will miss the bus.', '["Whether","If","When","Unless"]', 'If', '{"ru":"If + условие → will + результат."}', ARRAY['first-conditional'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'MULTIPLE_CHOICE', 2, 'Which sentence is CORRECT?', '["If she will call, I answer","If she calls, I will answer","If she calling, I will answer","If she called, I will answer"]', 'If she calls, I will answer', '{"ru":"If + Present Simple ... will + base verb — правильная структура."}', ARRAY['first-conditional','error-correction'], 30, 4),
((SELECT id FROM lessons WHERE slug = 'a2-first-conditional'), 'MULTIPLE_CHOICE', 1, '___ you don''t save your work, you will lose it.', '["If","Unless","Whether","That"]', 'If', '{"ru":"If ... won''t = предупреждение о возможном результате."}', ARRAY['first-conditional','warning'], 20, 5);

-- Lesson 15: Infinitive of Purpose
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'MULTIPLE_CHOICE', 1, 'I went to the shop ___ buy some bread.', '["for","to","for to","in order for"]', 'to', '{"ru":"Цель: to + infinitive."}', ARRAY['infinitive-purpose'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'MULTIPLE_CHOICE', 1, 'She phoned the hotel ___ a room.', '["book","for booking","to book","for book"]', 'to book', '{"ru":"to + base verb = цель действия."}', ARRAY['infinitive-purpose'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'MULTIPLE_CHOICE', 1, 'He works long hours ___ earn more money.', '["for","in order to","for to","so that"]', 'in order to', '{"ru":"in order to — более формальный вариант to."}', ARRAY['infinitive-purpose','in-order-to'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'MULTIPLE_CHOICE', 1, 'I study every day ___ my English.', '["for improve","improving","to improve","improve"]', 'to improve', '{"ru":"to + base verb = цель: to improve."}', ARRAY['infinitive-purpose'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-infinitive-purpose'), 'MULTIPLE_CHOICE', 2, 'Which sentence uses the infinitive of purpose CORRECTLY?', '["She went there for to meet him","She went there to meeting him","She went there for meeting him","She went there to meet him"]', 'She went there to meet him', '{"ru":"to + base verb (не to + V-ing, не for + base verb)."}', ARRAY['infinitive-purpose','error-correction'], 30, 5);

-- Lesson 16: Too / Enough
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'MULTIPLE_CHOICE', 1, 'This suitcase is ___ heavy to carry.', '["enough","too","very much","many"]', 'too', '{"ru":"too + adj = слишком: too heavy."}', ARRAY['too'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'MULTIPLE_CHOICE', 1, 'Is this coffee hot ___?', '["too","much","enough","very"]', 'enough', '{"ru":"adjective + enough: hot enough."}', ARRAY['enough'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'MULTIPLE_CHOICE', 1, 'There are ___ many people here — I can''t move.', '["enough","too","very","much"]', 'too', '{"ru":"too many + исчисляемое = слишком много."}', ARRAY['too-many'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'MULTIPLE_CHOICE', 1, 'She is not ___ to watch this film (minimum age: 18).', '["enough old","old enough","too old","too young enough"]', 'old enough', '{"ru":"adjective + enough: old enough (прилагательное перед enough)."}', ARRAY['enough','age'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-too-enough'), 'MULTIPLE_CHOICE', 2, 'Which sentence is CORRECT?', '["He is enough tall to play basketball","She is too young enough","There is enough food for everyone","It is too much cold outside"]', 'There is enough food for everyone', '{"ru":"enough + noun: enough food. Остальные ошибочны."}', ARRAY['too','enough','error-correction'], 30, 5);

-- Lesson 17: Basic Relative Clauses
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'MULTIPLE_CHOICE', 1, 'The teacher ___ taught me Spanish was very patient.', '["which","that","who","whose"]', 'who', '{"ru":"Who — для людей."}', ARRAY['relative-clauses','who'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'MULTIPLE_CHOICE', 1, 'I lost the keys ___ you gave me.', '["who","whose","which","where"]', 'which', '{"ru":"Which — для предметов."}', ARRAY['relative-clauses','which'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'MULTIPLE_CHOICE', 1, 'This is the city ___ I was born.', '["which","who","whose","where"]', 'where', '{"ru":"Where — для мест."}', ARRAY['relative-clauses','where'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'MULTIPLE_CHOICE', 1, 'The student ___ notebook was stolen reported it to the teacher.', '["who","which","whose","where"]', 'whose', '{"ru":"Whose — для принадлежности."}', ARRAY['relative-clauses','whose'], 20, 4),
((SELECT id FROM lessons WHERE slug = 'a2-relative-clauses'), 'MULTIPLE_CHOICE', 2, 'Which sentence uses a relative clause CORRECTLY?', '["The man which called is my father","The book who I read was boring","The city where I grew up is beautiful","The woman whose lives next door is nice"]', 'The city where I grew up is beautiful', '{"ru":"Where — для места: the city where I grew up. Остальные ошибочны."}', ARRAY['relative-clauses','error-correction'], 30, 5);

-- Lesson 18: Everyday Requests
INSERT INTO exercises (lesson_id, type, difficulty, question, options, correct_answer, explanation, tags, estimated_seconds, order_index) VALUES
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'MULTIPLE_CHOICE', 1, '___ I open the window? It''s very hot.', '["Must","Should","May","Will"]', 'May', '{"ru":"May I...? — вежливый официальный запрос."}', ARRAY['requests','may'], 20, 1),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'MULTIPLE_CHOICE', 1, '___ you mind passing the salt?', '["Could","Would","Should","Can''t"]', 'Would', '{"ru":"Would you mind + V-ing — очень вежливая просьба."}', ARRAY['requests','would-mind'], 20, 2),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'MULTIPLE_CHOICE', 1, '— Would you like some coffee? — ___.', '["Yes, I like","Yes, I would","No, I am not","Yes, like please"]', 'Yes, I would', '{"ru":"Ответ на Would you like...? → Yes, I would."}', ARRAY['requests','would-like'], 20, 3),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'MULTIPLE_CHOICE', 1, 'Which request is the MOST polite?', '["Give me the menu!","Can I have the menu?","I want the menu.","Could I possibly see the menu, please?"]', 'Could I possibly see the menu, please?', '{"ru":"Could I possibly...? + please — самый вежливый вариант."}', ARRAY['requests','politeness'], 25, 4),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'MULTIPLE_CHOICE', 1, 'Waiter: "What ___ you like to order?" Customer: "I''d like the pasta, please."', '["do","will","would","shall"]', 'would', '{"ru":"What would you like to order? — стандартный вопрос официанта."}', ARRAY['requests','restaurant'], 20, 5),
((SELECT id FROM lessons WHERE slug = 'a2-everyday-requests'), 'MULTIPLE_CHOICE', 2, '— Would you mind closing the door? — ___.', '["Yes, I mind","Not at all","Yes, please","I don''t mind close it"]', 'Not at all', '{"ru":"Not at all = конечно, не против (= соглашаюсь выполнить просьбу)."}', ARRAY['requests','would-mind','response'], 30, 6);

-- ============================================================
-- VOCABULARY (20 core A2 words)
-- ============================================================
INSERT INTO vocabulary_entries (word, ipa, translation, examples, level_code) VALUES
('travel',      '/ˈtrævəl/',   'путешествовать',  '["I love to travel to new countries.","She travelled around Europe last summer."]',                'A2'),
('decide',      '/dɪˈsaɪd/',   'решать',          '["He decided to change his job.","Have you decided where to go?"]',                                  'A2'),
('compare',     '/kəmˈpeər/',   'сравнивать',      '["Let''s compare the two prices.","She compared her work with her colleague''s."]',                  'A2'),
('already',     '/ɔːlˈredi/',  'уже',             '["I have already eaten.","She has already finished."]',                                               'A2'),
('yet',         '/jet/',        'ещё/уже',         '["Have you finished yet?","I haven''t seen it yet."]',                                                'A2'),
('ever',        '/ˈevər/',      'когда-либо',      '["Have you ever been to Japan?","It''s the best film I have ever seen."]',                            'A2'),
('improve',     '/ɪmˈpruːv/',   'улучшать',        '["I want to improve my English.","Her grades improved a lot."]',                                      'A2'),
('suggest',     '/səˈdʒest/',   'предлагать',      '["I suggest going to the beach.","Can you suggest a good restaurant?"]',                              'A2'),
('promise',     '/ˈprɒmɪs/',    'обещать',         '["I promise to call you later.","He promised not to be late."]',                                      'A2'),
('experience',  '/ɪkˈspɪəriəns/', 'опыт',         '["Do you have any work experience?","It was an amazing experience."]',                                'A2'),
('neighbour',   '/ˈneɪbər/',    'сосед',           '["My neighbour is very friendly.","We borrowed sugar from our neighbours."]',                         'A2'),
('remember',    '/rɪˈmembər/',  'помнить/вспомнить','["Do you remember her name?","Remember to lock the door."]',                                        'A2'),
('careful',     '/ˈkeərfəl/',   'осторожный',      '["Be careful on that road.","She is very careful with money."]',                                      'A2'),
('perhaps',     '/pəˈhæps/',    'возможно',        '["Perhaps it will rain tomorrow.","I''ll perhaps be late."]',                                         'A2'),
('although',    '/ɔːlˈðoʊ/',   'хотя',            '["Although it was cold, she wore a dress.","I like her although she can be difficult."]',              'A2'),
('borrow',      '/ˈbɒroʊ/',     'брать взаймы',    '["Can I borrow your pen?","She borrowed money from the bank."]',                                      'A2'),
('mention',     '/ˈmenʃən/',    'упоминать',       '["He mentioned that he was tired.","Don''t mention it!"]',                                            'A2'),
('recommend',   '/ˌrekəˈmend/', 'рекомендовать',   '["Can you recommend a good hotel?","I recommend visiting the old town."]',                            'A2'),
('achieve',     '/əˈtʃiːv/',    'достигать',       '["She achieved her dream of becoming a doctor.","Hard work helps you achieve your goals."]',          'A2'),
('opinion',     '/əˈpɪnjən/',   'мнение',          '["In my opinion, this is the best option.","What is your opinion on this topic?"]',                   'A2');
