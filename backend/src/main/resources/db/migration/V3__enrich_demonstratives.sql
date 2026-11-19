-- ============================================================
-- V3: Replace demonstratives theory with rich structured JSON
-- Backward compatible: other lessons keep their Markdown content
-- ============================================================

DELETE FROM theory_blocks
WHERE lesson_id = (SELECT id FROM lessons WHERE slug = 'a1-demonstratives');

INSERT INTO theory_blocks (lesson_id, content, order_index) VALUES
(
  (SELECT id FROM lessons WHERE slug = 'a1-demonstratives'),
  $$[
    {"kind":"heading","level":2,"text":"Что такое указательные местоимения?"},
    {"kind":"paragraph","tokens":[{"t":"Указательные местоимения помогают "},{"t":"указать на предметы или людей","b":true},{"t":". Выбор зависит от "},{"t":"расстояния","b":true},{"t":" (рядом или далеко) и от того, "},{"t":"один","b":true},{"t":" предмет или их "},{"t":"несколько","b":true},{"t":"."}]},
    {"kind":"cardGrid","cards":[
      {"word":"THIS","ipa":"/ðɪs/","translation":"Этот / эта / это","tag":"Рядом · один","example":{"en":"This is an apple.","ru":"Это яблоко."}},
      {"word":"THAT","ipa":"/ðæt/","translation":"Тот / та / то","tag":"Далеко · один","example":{"en":"That is a car.","ru":"Это машина (вдали)."}},
      {"word":"THESE","ipa":"/ðiːz/","translation":"Эти","tag":"Рядом · много","example":{"en":"These are my keys.","ru":"Это мои ключи."}},
      {"word":"THOSE","ipa":"/ðoʊz/","translation":"Те","tag":"Далеко · много","example":{"en":"Those mountains are beautiful.","ru":"Те горы прекрасны."}}
    ]},
    {"kind":"heading","level":3,"text":"Правило, которое легко запомнить"},
    {"kind":"table","headers":["","Рядом","Далеко"],"rows":[["Один предмет","this","that"],["Несколько","these","those"]]},
    {"kind":"rule","rule":"С this и that используется глагол is. С these и those — are (когда они являются подлежащим с глаголом to be)."},
    {"kind":"tip","content":"Запомни: THIS и THESE — то, что рядом. THAT и THOSE — то, что далеко. Множественные числа: THESE (от this) и THOSE (от that)."},
    {"kind":"heading","level":3,"text":"Примеры"},
    {"kind":"example","english":"This is my book.","translation":"Это моя книга.","note":"Книга рядом (один предмет)"},
    {"kind":"example","english":"That is her house.","translation":"Это её дом.","note":"Дом далеко (один предмет)"},
    {"kind":"example","english":"These are my friends.","translation":"Это мои друзья.","note":"Друзья рядом (несколько)"},
    {"kind":"example","english":"Those are beautiful flowers.","translation":"Те цветы прекрасны.","note":"Цветы далеко (несколько)"},
    {"kind":"warning","content":"Типичная ошибка: This are my keys. ✗  Нельзя! С this всегда используется is: This is my key. Если предметов несколько и они рядом — these: These are my keys. ✓"},
    {"kind":"miniQuiz","question":"Перед тобой лежат несколько ключей. Как сказать «Это мои ключи»?","options":[{"text":"This is my keys.","correct":false,"explanation":"This используется для одного предмета, и с ним нужен is, а не are."},{"text":"These are my keys.","correct":true,"explanation":"Правильно! Ключей несколько и они рядом — these are. ✓"},{"text":"Those are my keys.","correct":false,"explanation":"Those указывает на предметы далеко от тебя, а ключи здесь рядом."}]}
  ]$$,
  1
);
