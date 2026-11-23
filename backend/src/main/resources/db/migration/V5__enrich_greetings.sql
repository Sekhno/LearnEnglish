-- ============================================================
-- V5: Enrich Greetings & Introductions lesson theory
-- Replaces plain-text theory with rich structured JSON (5 sections)
-- Adds 2 dialogue examples (8 new rows; existing 3 rows kept)
-- ============================================================

DELETE FROM theory_blocks
WHERE lesson_id = (SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions');

INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
(
  (SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
  $$[
    {"kind":"heading","level":2,"text":"1. Как поздороваться"},
    {"kind":"paragraph","tokens":[{"t":"Первые слова при встрече задают тон разговора. Выбирай приветствие в зависимости от ситуации."}]},
    {"kind":"cardGrid","cards":[
      {"word":"Hello!","ipa":"/həˈloʊ/","translation":"Привет! / Здравствуйте!","tag":"Любая ситуация","example":{"en":"Hello! Nice to see you.","ru":"Привет! Рад тебя видеть."}},
      {"word":"Hi!","ipa":"/haɪ/","translation":"Привет!","tag":"Дружески","example":{"en":"Hi! How are you?","ru":"Привет! Как дела?"}},
      {"word":"Hey!","ipa":"/heɪ/","translation":"Эй! / Привет!","tag":"Неформально","example":{"en":"Hey! Long time no see!","ru":"Эй! Давно не виделись!"}}
    ]},
    {"kind":"table","headers":["Фраза","Перевод","Когда использовать"],"rows":[
      ["Good morning","Доброе утро","До 12:00"],
      ["Good afternoon","Добрый день","12:00–18:00"],
      ["Good evening","Добрый вечер","После 18:00"],
      ["Good night","Спокойной ночи","Прощание вечером / перед сном"]
    ]},
    {"kind":"tip","content":"Good night — это прощание, а не приветствие! Говори Good night, когда уходишь поздно вечером или желаешь спокойной ночи."},
    {"kind":"rule","rule":"How do you do? — очень официальное приветствие при первом знакомстве. Традиционный ответ: снова How do you do? В повседневной речи используй Hi! или Hello!"}
  ]$$,
  1
),
(
  (SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
  $$[
    {"kind":"heading","level":2,"text":"2. Как спросить «Как дела?» и ответить"},
    {"kind":"paragraph","tokens":[{"t":"Вопрос "},{"t":"How are you?","b":true},{"t":" — стандартная часть приветствия. Обычно ответ короткий и позитивный."}]},
    {"kind":"example","english":"How are you?","translation":"Как дела? / Как ты?","note":"Стандартный вопрос при встрече"},
    {"kind":"table","headers":["Ответ","Перевод","Настроение"],"rows":[
      ["Fine, thanks.","Всё хорошо, спасибо.","Нейтрально"],
      ["I'm good, thanks.","Хорошо, спасибо.","Позитивно"],
      ["Great, thanks!","Отлично, спасибо!","Очень хорошо"],
      ["Not bad, thanks.","Неплохо, спасибо.","Так себе, но нормально"]
    ]},
    {"kind":"tip","content":"После ответа принято добавить: And you? (А у тебя?) — это вежливо и показывает интерес к собеседнику."},
    {"kind":"example","english":"How are you? — I'm good, thanks. And you?","translation":"Как дела? — Хорошо, спасибо. А ты?","note":"Готовый обмен репликами"}
  ]$$,
  2
),
(
  (SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
  $$[
    {"kind":"heading","level":2,"text":"3. Как представиться и узнать имя собеседника"},
    {"kind":"example","english":"What's your name?","translation":"Как тебя зовут? / Как вас зовут?","note":"Вопрос об имени"},
    {"kind":"example","english":"My name is Anna.","translation":"Меня зовут Анна.","note":"Также: I'm Anna. — разговорный вариант"},
    {"kind":"rule","rule":"I'm — сокращение от I am. В разговорной речи I'm звучит естественнее. My name is — чуть официальнее, но тоже используется повсеместно."},
    {"kind":"example","english":"Nice to meet you. — Nice to meet you too.","translation":"Приятно познакомиться. — Мне тоже приятно.","note":"Стандартный обмен при знакомстве"}
  ]$$,
  3
),
(
  (SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
  $$[
    {"kind":"heading","level":2,"text":"4. Откуда ты и сколько тебе лет"},
    {"kind":"example","english":"Where are you from?","translation":"Откуда ты? / Откуда вы?","note":"Вопрос о происхождении"},
    {"kind":"paragraph","tokens":[{"t":"После "},{"t":"from","b":true},{"t":" можно назвать страну или город:"}]},
    {"kind":"example","english":"I'm from Spain.","translation":"Я из Испании.","note":"Страна или город — оба варианта верны: I'm from Madrid."},
    {"kind":"tip","content":"How old are you? — Сколько тебе лет? При первом знакомстве с взрослыми этот вопрос задают только тогда, когда это уместно в контексте разговора."},
    {"kind":"example","english":"I'm 25 years old.","translation":"Мне 25 лет.","note":"Также: I'm 25. — оба варианта верны"}
  ]$$,
  4
),
(
  (SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
  $$[
    {"kind":"heading","level":2,"text":"5. Типичные ошибки"},
    {"kind":"warning","content":"❌ I have 25 years. → ✅ I'm 25 years old. — Для возраста используется глагол be (am/is/are), а не have."},
    {"kind":"warning","content":"❌ I from Spain. → ✅ I'm from Spain. — В этой фразе обязательно нужен глагол am (или его сокращение 'm)."},
    {"kind":"tip","content":"Местоимение I всегда пишется с заглавной буквы — независимо от места в предложении."}
  ]$$,
  5
);

INSERT INTO examples (lesson_id, english_text, translation, order_index) VALUES
-- Dialogue 1: Two students meeting at a language course
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
 'Hi! My name is Tom. What''s your name?',
 'Привет! Меня зовут Том. Как тебя зовут?', 4),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
 'I''m Maria. Nice to meet you, Tom!',
 'Я Мария. Приятно познакомиться, Том!', 5),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
 'Nice to meet you too! Where are you from?',
 'Мне тоже приятно! Откуда ты?', 6),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
 'I''m from Italy. And you?',
 'Я из Италии. А ты?', 7),
-- Dialogue 2: Morning greeting at work
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
 'Good morning, Sarah!',
 'Доброе утро, Сара!', 8),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
 'Good morning, Alex! How are you?',
 'Доброе утро, Алекс! Как дела?', 9),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
 'I''m great, thanks! And you?',
 'Отлично, спасибо! А ты?', 10),
((SELECT id FROM lessons WHERE slug = 'a1-greetings-introductions'),
 'Fine, thanks. It''s a beautiful morning!',
 'Хорошо, спасибо. Прекрасное утро!', 11);
