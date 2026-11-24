-- ============================================================
-- V7: Verb Vocabulary table for Past Simple (a2-past-simple)
-- 99 regular + 100 irregular = 199 verbs
-- ============================================================

CREATE TABLE IF NOT EXISTS verb_vocabulary (
    id            BIGSERIAL PRIMARY KEY,
    lesson_id     BIGINT REFERENCES lessons(id),
    v1            VARCHAR(100) NOT NULL,
    v2            VARCHAR(100) NOT NULL,
    v3            VARCHAR(100) NOT NULL,
    v1_ipa        VARCHAR(150),
    v2_ipa        VARCHAR(150),
    v3_ipa        VARCHAR(150),
    translation   VARCHAR(300) NOT NULL,
    example_v2    VARCHAR(400),
    example_trans VARCHAR(400),
    verb_type     VARCHAR(20)  NOT NULL CHECK (verb_type IN ('regular','irregular')),
    spelling_rule VARCHAR(50)  CHECK (spelling_rule IN ('standard','double','drop_e','change_to_ied')),
    pronunciation VARCHAR(10)  CHECK (pronunciation IN ('/t/','/d/','/ɪd/')),
    verb_pattern  VARCHAR(5)   CHECK (verb_pattern  IN ('AAA','ABB','ABA','ABC')),
    difficulty    VARCHAR(20)  NOT NULL DEFAULT 'common' CHECK (difficulty IN ('essential','common','extended')),
    alt_v2        VARCHAR(100),
    alt_v3        VARCHAR(100)
);

CREATE INDEX IF NOT EXISTS idx_vv_lesson     ON verb_vocabulary(lesson_id);
CREATE INDEX IF NOT EXISTS idx_vv_type       ON verb_vocabulary(verb_type);
CREATE INDEX IF NOT EXISTS idx_vv_difficulty ON verb_vocabulary(difficulty);

DO $$
DECLARE v_lid BIGINT;
BEGIN
    SELECT id INTO v_lid FROM lessons WHERE slug = 'a2-past-simple';
    IF v_lid IS NULL THEN
        RAISE NOTICE 'Lesson a2-past-simple not found — skipping verb vocabulary seed';
        RETURN;
    END IF;

    INSERT INTO verb_vocabulary
        (lesson_id,v1,v2,v3,v1_ipa,v2_ipa,v3_ipa,
         translation,example_v2,example_trans,
         verb_type,spelling_rule,pronunciation,verb_pattern,
         difficulty,alt_v2,alt_v3)
    VALUES
    -- ======================================================
    -- REGULAR VERBS (99)
    -- ======================================================
    -- ESSENTIAL: standard /t/
    (v_lid,'walk','walked','walked','/wɔːk/','/wɔːkt/','/wɔːkt/','ходити','She walked to school every day.','Вона щодня ходила до школи.','regular','standard','/t/',NULL,'essential',NULL,NULL),
    (v_lid,'talk','talked','talked','/tɔːk/','/tɔːkt/','/tɔːkt/','розмовляти','He talked for hours.','Він розмовляв годинами.','regular','standard','/t/',NULL,'essential',NULL,NULL),
    (v_lid,'work','worked','worked','/wɜːk/','/wɜːkt/','/wɜːkt/','працювати','She worked all day.','Вона працювала весь день.','regular','standard','/t/',NULL,'essential',NULL,NULL),
    (v_lid,'ask','asked','asked','/ɑːsk/','/ɑːskt/','/ɑːskt/','питати','He asked a question.','Він поставив запитання.','regular','standard','/t/',NULL,'essential',NULL,NULL),
    (v_lid,'finish','finished','finished','/ˈfɪnɪʃ/','/ˈfɪnɪʃt/','/ˈfɪnɪʃt/','закінчувати','He finished his homework.','Він закінчив домашнє завдання.','regular','standard','/t/',NULL,'essential',NULL,NULL),
    (v_lid,'help','helped','helped','/help/','/helpt/','/helpt/','допомагати','She helped me carry the bags.','Вона допомогла мені нести сумки.','regular','standard','/t/',NULL,'essential',NULL,NULL),
    (v_lid,'watch','watched','watched','/wɒtʃ/','/wɒtʃt/','/wɒtʃt/','дивитися','They watched a film together.','Вони разом дивилися фільм.','regular','standard','/t/',NULL,'essential',NULL,NULL),
    (v_lid,'cook','cooked','cooked','/kʊk/','/kʊkt/','/kʊkt/','готувати їжу','She cooked dinner for everyone.','Вона приготувала вечерю для всіх.','regular','standard','/t/',NULL,'essential',NULL,NULL),
    -- ESSENTIAL: standard /d/
    (v_lid,'play','played','played','/pleɪ/','/pleɪd/','/pleɪd/','грати','Kids played outside all afternoon.','Діти гралися надворі весь день.','regular','standard','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'stay','stayed','stayed','/steɪ/','/steɪd/','/steɪd/','залишатися','We stayed at home last weekend.','Минулих вихідних ми залишалися вдома.','regular','standard','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'answer','answered','answered','/ˈɑːnsə/','/ˈɑːnsəd/','/ˈɑːnsəd/','відповідати','She answered every question correctly.','Вона правильно відповіла на кожне питання.','regular','standard','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'call','called','called','/kɔːl/','/kɔːld/','/kɔːld/','телефонувати','I called my friend last night.','Вчора ввечері я зателефонував другові.','regular','standard','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'listen','listened','listened','/ˈlɪsən/','/ˈlɪsənd/','/ˈlɪsənd/','слухати','She listened to music all evening.','Вона слухала музику весь вечір.','regular','standard','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'open','opened','opened','/ˈəʊpən/','/ˈəʊpənd/','/ˈəʊpənd/','відкривати','He opened the door.','Він відчинив двері.','regular','standard','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'happen','happened','happened','/ˈhæpən/','/ˈhæpənd/','/ˈhæpənd/','траплятися','What happened to you yesterday?','Що з тобою трапилося вчора?','regular','standard','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'clean','cleaned','cleaned','/kliːn/','/kliːnd/','/kliːnd/','прибирати','He cleaned the flat on Saturday.','У суботу він прибрав квартиру.','regular','standard','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'learn','learned','learned','/lɜːn/','/lɜːnd/','/lɜːnd/','вчитися','He learned to drive last year.','Минулого року він навчився водити машину.','regular','standard','/d/',NULL,'essential','learnt','learnt'),
    -- ESSENTIAL: standard /ɪd/
    (v_lid,'want','wanted','wanted','/wɒnt/','/ˈwɒntɪd/','/ˈwɒntɪd/','хотіти','They wanted more time.','Вони хотіли більше часу.','regular','standard','/ɪd/',NULL,'essential',NULL,NULL),
    (v_lid,'need','needed','needed','/niːd/','/ˈniːdɪd/','/ˈniːdɪd/','потребувати','We needed some help.','Нам була потрібна допомога.','regular','standard','/ɪd/',NULL,'essential',NULL,NULL),
    (v_lid,'start','started','started','/stɑːt/','/ˈstɑːtɪd/','/ˈstɑːtɪd/','починати','The film started late.','Фільм почався пізно.','regular','standard','/ɪd/',NULL,'essential',NULL,NULL),
    (v_lid,'wait','waited','waited','/weɪt/','/ˈweɪtɪd/','/ˈweɪtɪd/','чекати','We waited an hour for the bus.','Ми чекали на автобус годину.','regular','standard','/ɪd/',NULL,'essential',NULL,NULL),
    (v_lid,'visit','visited','visited','/ˈvɪzɪt/','/ˈvɪzɪtɪd/','/ˈvɪzɪtɪd/','відвідувати','We visited Rome last summer.','Минулого літа ми відвідали Рим.','regular','standard','/ɪd/',NULL,'essential',NULL,NULL),
    -- ESSENTIAL: drop_e
    (v_lid,'live','lived','lived','/lɪv/','/lɪvd/','/lɪvd/','жити','He lived in Paris for two years.','Він жив у Парижі два роки.','regular','drop_e','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'love','loved','loved','/lʌv/','/lʌvd/','/lʌvd/','любити','She loved the film.','Їй дуже сподобався фільм.','regular','drop_e','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'use','used','used','/juːz/','/juːzd/','/juːzd/','використовувати','She used a dictionary.','Вона користувалася словником.','regular','drop_e','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'close','closed','closed','/kləʊz/','/kləʊzd/','/kləʊzd/','зачиняти','She closed the window.','Вона зачинила вікно.','regular','drop_e','/d/',NULL,'essential',NULL,NULL),
    (v_lid,'like','liked','liked','/laɪk/','/laɪkt/','/laɪkt/','подобатися','I liked the food very much.','Мені дуже сподобалася їжа.','regular','drop_e','/t/',NULL,'essential',NULL,NULL),
    -- ESSENTIAL: double consonant
    (v_lid,'stop','stopped','stopped','/stɒp/','/stɒpt/','/stɒpt/','зупинятися','The bus stopped at every corner.','Автобус зупинявся на кожному розі.','regular','double','/t/',NULL,'essential',NULL,NULL),
    -- ESSENTIAL: change_to_ied
    (v_lid,'try','tried','tried','/traɪ/','/traɪd/','/traɪd/','намагатися','She tried again and again.','Вона намагалася знову і знову.','regular','change_to_ied','/d/',NULL,'essential',NULL,NULL),

    -- COMMON: change_to_ied
    (v_lid,'study','studied','studied','/ˈstʌdi/','/ˈstʌdid/','/ˈstʌdid/','вивчати','She studied English every evening.','Вона щовечора вивчала англійську.','regular','change_to_ied','/d/',NULL,'common',NULL,NULL),
    (v_lid,'carry','carried','carried','/ˈkæri/','/ˈkærid/','/ˈkærid/','носити','He carried the bags upstairs.','Він ніс сумки нагору.','regular','change_to_ied','/d/',NULL,'common',NULL,NULL),
    (v_lid,'cry','cried','cried','/kraɪ/','/kraɪd/','/kraɪd/','плакати','The baby cried all night.','Дитина плакала всю ніч.','regular','change_to_ied','/d/',NULL,'common',NULL,NULL),
    (v_lid,'copy','copied','copied','/ˈkɒpi/','/ˈkɒpid/','/ˈkɒpid/','копіювати','He copied the text carefully.','Він уважно скопіював текст.','regular','change_to_ied','/d/',NULL,'common',NULL,NULL),
    -- COMMON: double /t/
    (v_lid,'shop','shopped','shopped','/ʃɒp/','/ʃɒpt/','/ʃɒpt/','робити покупки','She shopped all morning.','Вона робила покупки весь ранок.','regular','double','/t/',NULL,'common',NULL,NULL),
    (v_lid,'drop','dropped','dropped','/drɒp/','/drɒpt/','/drɒpt/','впускати','He dropped the keys.','Він упустив ключі.','regular','double','/t/',NULL,'common',NULL,NULL),
    -- COMMON: double /d/
    (v_lid,'plan','planned','planned','/plæn/','/plænd/','/plænd/','планувати','We planned a trip to Spain.','Ми планували поїздку до Іспанії.','regular','double','/d/',NULL,'common',NULL,NULL),
    (v_lid,'grab','grabbed','grabbed','/ɡræb/','/ɡræbd/','/ɡræbd/','хапати','She grabbed her bag and ran.','Вона схопила сумку і побігла.','regular','double','/d/',NULL,'common',NULL,NULL),
    (v_lid,'hug','hugged','hugged','/hʌɡ/','/hʌɡd/','/hʌɡd/','обіймати','He hugged his mother.','Він обійняв маму.','regular','double','/d/',NULL,'common',NULL,NULL),
    (v_lid,'jog','jogged','jogged','/dʒɒɡ/','/dʒɒɡd/','/dʒɒɡd/','бігати підтюпцем','She jogged in the park.','Вона бігала підтюпцем у парку.','regular','double','/d/',NULL,'common',NULL,NULL),
    (v_lid,'travel','travelled','travelled','/ˈtrævəl/','/ˈtrævəld/','/ˈtrævəld/','подорожувати','She travelled to Spain last year.','Минулого року вона їздила до Іспанії.','regular','double','/d/',NULL,'common','traveled','traveled'),
    -- COMMON: double /ɪd/
    (v_lid,'chat','chatted','chatted','/tʃæt/','/ˈtʃætɪd/','/ˈtʃætɪd/','спілкуватися','They chatted online for hours.','Вони спілкувалися онлайн годинами.','regular','double','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'admit','admitted','admitted','/ədˈmɪt/','/ədˈmɪtɪd/','/ədˈmɪtɪd/','визнавати','He admitted his mistake.','Він визнав свою помилку.','regular','double','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'add','added','added','/æd/','/ˈædɪd/','/ˈædɪd/','додавати','She added some sugar.','Вона додала трохи цукру.','regular','double','/ɪd/',NULL,'common',NULL,NULL),
    -- COMMON: drop_e /t/
    (v_lid,'dance','danced','danced','/dɑːns/','/dɑːnst/','/dɑːnst/','танцювати','She danced all night at the party.','Вона танцювала всю ніч на вечірці.','regular','drop_e','/t/',NULL,'common',NULL,NULL),
    -- COMMON: drop_e /d/
    (v_lid,'smile','smiled','smiled','/smaɪl/','/smaɪld/','/smaɪld/','посміхатися','He smiled warmly at me.','Він тепло посміхнувся мені.','regular','drop_e','/d/',NULL,'common',NULL,NULL),
    (v_lid,'move','moved','moved','/muːv/','/muːvd/','/muːvd/','переїжджати','They moved to London.','Вони переїхали до Лондона.','regular','drop_e','/d/',NULL,'common',NULL,NULL),
    (v_lid,'arrive','arrived','arrived','/əˈraɪv/','/əˈraɪvd/','/əˈraɪvd/','прибувати','The train arrived early.','Потяг прибув рано.','regular','drop_e','/d/',NULL,'common',NULL,NULL),
    (v_lid,'change','changed','changed','/tʃeɪndʒ/','/tʃeɪndʒd/','/tʃeɪndʒd/','змінюватися','Everything changed last year.','Минулого року все змінилося.','regular','drop_e','/d/',NULL,'common',NULL,NULL),
    -- COMMON: drop_e /ɪd/
    (v_lid,'decide','decided','decided','/dɪˈsaɪd/','/dɪˈsaɪdɪd/','/dɪˈsaɪdɪd/','вирішувати','She decided to leave early.','Вона вирішила піти раніше.','regular','drop_e','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'invite','invited','invited','/ɪnˈvaɪt/','/ɪnˈvaɪtɪd/','/ɪnˈvaɪtɪd/','запрошувати','He invited us to dinner.','Він запросив нас на вечерю.','regular','drop_e','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'create','created','created','/kriˈeɪt/','/kriˈeɪtɪd/','/kriˈeɪtɪd/','створювати','She created a website.','Вона створила веб-сайт.','regular','drop_e','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'complete','completed','completed','/kəmˈpliːt/','/kəmˈpliːtɪd/','/kəmˈpliːtɪd/','завершувати','He completed the task on time.','Він виконав завдання вчасно.','regular','drop_e','/ɪd/',NULL,'common',NULL,NULL),
    -- COMMON: standard /ɪd/
    (v_lid,'expect','expected','expected','/ɪkˈspekt/','/ɪkˈspektɪd/','/ɪkˈspektɪd/','очікувати','We expected rain but it was sunny.','Ми очікували дощу, але було сонячно.','regular','standard','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'point','pointed','pointed','/pɔɪnt/','/ˈpɔɪntɪd/','/ˈpɔɪntɪd/','вказувати','She pointed at the map.','Вона вказала на карту.','regular','standard','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'count','counted','counted','/kaʊnt/','/ˈkaʊntɪd/','/ˈkaʊntɪd/','рахувати','He counted the money carefully.','Він уважно рахував гроші.','regular','standard','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'rent','rented','rented','/rent/','/ˈrentɪd/','/ˈrentɪd/','орендувати','They rented a flat in the city.','Вони орендували квартиру в місті.','regular','standard','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'paint','painted','painted','/peɪnt/','/ˈpeɪntɪd/','/ˈpeɪntɪd/','малювати','He painted the walls white.','Він пофарбував стіни у білий колір.','regular','standard','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'print','printed','printed','/prɪnt/','/ˈprɪntɪd/','/ˈprɪntɪd/','роздруковувати','She printed the document.','Вона роздрукувала документ.','regular','standard','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'collect','collected','collected','/kəˈlekt/','/kəˈlektɪd/','/kəˈlektɪd/','збирати','He collected stamps as a child.','У дитинстві він збирав марки.','regular','standard','/ɪd/',NULL,'common',NULL,NULL),
    (v_lid,'suggest','suggested','suggested','/səˈdʒest/','/səˈdʒestɪd/','/səˈdʒestɪd/','пропонувати','She suggested a plan.','Вона запропонувала план.','regular','standard','/ɪd/',NULL,'common',NULL,NULL),
    -- COMMON: standard /d/
    (v_lid,'join','joined','joined','/dʒɔɪn/','/dʒɔɪnd/','/dʒɔɪnd/','приєднуватися','She joined the team last month.','Вона приєдналася до команди минулого місяця.','regular','standard','/d/',NULL,'common',NULL,NULL),
    (v_lid,'turn','turned','turned','/tɜːn/','/tɜːnd/','/tɜːnd/','повертати','She turned left at the corner.','На розі вона повернула ліворуч.','regular','standard','/d/',NULL,'common',NULL,NULL),
    (v_lid,'return','returned','returned','/rɪˈtɜːn/','/rɪˈtɜːnd/','/rɪˈtɜːnd/','повертатися','He returned home late.','Він повернувся додому пізно.','regular','standard','/d/',NULL,'common',NULL,NULL),
    (v_lid,'remember','remembered','remembered','/rɪˈmembə/','/rɪˈmembəd/','/rɪˈmembəd/','пам''ятати','I remembered his name.','Я пригадав його ім''я.','regular','standard','/d/',NULL,'common',NULL,NULL),
    -- COMMON: standard /t/
    (v_lid,'knock','knocked','knocked','/nɒk/','/nɒkt/','/nɒkt/','стукати','He knocked on the door.','Він постукав у двері.','regular','standard','/t/',NULL,'common',NULL,NULL),
    (v_lid,'check','checked','checked','/tʃek/','/tʃekt/','/tʃekt/','перевіряти','She checked her email.','Вона перевірила електронну пошту.','regular','standard','/t/',NULL,'common',NULL,NULL),
    (v_lid,'pass','passed','passed','/pɑːs/','/pɑːst/','/pɑːst/','здавати / проходити','He passed the exam.','Він склав іспит.','regular','standard','/t/',NULL,'common',NULL,NULL),
    (v_lid,'miss','missed','missed','/mɪs/','/mɪst/','/mɪst/','пропускати','She missed the bus.','Вона запізнилася на автобус.','regular','standard','/t/',NULL,'common',NULL,NULL),

    -- EXTENDED: double /t/
    (v_lid,'wrap','wrapped','wrapped','/ræp/','/ræpt/','/ræpt/','загортати','She wrapped the gift.','Вона загорнула подарунок.','regular','double','/t/',NULL,'extended',NULL,NULL),
    (v_lid,'skip','skipped','skipped','/skɪp/','/skɪpt/','/skɪpt/','пропускати','He skipped breakfast.','Він пропустив сніданок.','regular','double','/t/',NULL,'extended',NULL,NULL),
    (v_lid,'slip','slipped','slipped','/slɪp/','/slɪpt/','/slɪpt/','ковзнути','She slipped on ice.','Вона посковзнулася на льоду.','regular','double','/t/',NULL,'extended',NULL,NULL),
    (v_lid,'trip','tripped','tripped','/trɪp/','/trɪpt/','/trɪpt/','спіткнутися','He tripped on the step.','Він спіткнувся на сходинці.','regular','double','/t/',NULL,'extended',NULL,NULL),
    (v_lid,'clap','clapped','clapped','/klæp/','/klæpt/','/klæpt/','плескати в долоні','They clapped loudly.','Вони голосно плескали в долоні.','regular','double','/t/',NULL,'extended',NULL,NULL),
    (v_lid,'nap','napped','napped','/næp/','/næpt/','/næpt/','дрімати','She napped after lunch.','Вона подрімала після обіду.','regular','double','/t/',NULL,'extended',NULL,NULL),
    (v_lid,'trap','trapped','trapped','/træp/','/træpt/','/træpt/','спіймати в пастку','The fox was trapped.','Лисицю спіймали в пастку.','regular','double','/t/',NULL,'extended',NULL,NULL),
    (v_lid,'pop','popped','popped','/pɒp/','/pɒpt/','/pɒpt/','лопнути','The balloon popped.','Кулька лопнула.','regular','double','/t/',NULL,'extended',NULL,NULL),
    -- EXTENDED: double /ɪd/
    (v_lid,'spot','spotted','spotted','/spɒt/','/ˈspɒtɪd/','/ˈspɒtɪd/','помітити','She spotted a mistake.','Вона помітила помилку.','regular','double','/ɪd/',NULL,'extended',NULL,NULL),
    (v_lid,'permit','permitted','permitted','/pəˈmɪt/','/pəˈmɪtɪd/','/pəˈmɪtɪd/','дозволяти','They permitted entry.','Вони дозволили вхід.','regular','double','/ɪd/',NULL,'extended',NULL,NULL),
    (v_lid,'commit','committed','committed','/kəˈmɪt/','/kəˈmɪtɪd/','/kəˈmɪtɪd/','здійснювати','She committed an error.','Вона допустила помилку.','regular','double','/ɪd/',NULL,'extended',NULL,NULL),
    (v_lid,'submit','submitted','submitted','/səbˈmɪt/','/səbˈmɪtɪd/','/səbˈmɪtɪd/','подавати','He submitted the form.','Він надіслав форму.','regular','double','/ɪd/',NULL,'extended',NULL,NULL),
    -- EXTENDED: double /d/
    (v_lid,'sob','sobbed','sobbed','/sɒb/','/sɒbd/','/sɒbd/','ридати','She sobbed quietly.','Вона тихо ридала.','regular','double','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'log','logged','logged','/lɒɡ/','/lɒɡd/','/lɒɡd/','заходити в систему','She logged into the system.','Вона зайшла в систему.','regular','double','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'hum','hummed','hummed','/hʌm/','/hʌmd/','/hʌmd/','наспівувати','He hummed a tune.','Він наспівував мелодію.','regular','double','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'slam','slammed','slammed','/slæm/','/slæmd/','/slæmd/','грюкати','She slammed the door.','Вона грюкнула дверима.','regular','double','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'rob','robbed','robbed','/rɒb/','/rɒbd/','/rɒbd/','грабувати','He robbed a bank.','Він пограбував банк.','regular','double','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'bug','bugged','bugged','/bʌɡ/','/bʌɡd/','/bʌɡd/','докучати','That noise bugged me.','Цей шум дратував мене.','regular','double','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'prefer','preferred','preferred','/prɪˈfɜː/','/prɪˈfɜːd/','/prɪˈfɜːd/','надавати перевагу','She preferred coffee to tea.','Вона надавала перевагу каві, а не чаю.','regular','double','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'refer','referred','referred','/rɪˈfɜː/','/rɪˈfɜːd/','/rɪˈfɜːd/','посилатися','He referred to his notes.','Він посилався на свої нотатки.','regular','double','/d/',NULL,'extended',NULL,NULL),
    -- EXTENDED: standard /d/
    (v_lid,'harm','harmed','harmed','/hɑːm/','/hɑːmd/','/hɑːmd/','шкодити','The storm harmed the crops.','Шторм пошкодив врожай.','regular','standard','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'inform','informed','informed','/ɪnˈfɔːm/','/ɪnˈfɔːmd/','/ɪnˈfɔːmd/','повідомляти','She informed us about the change.','Вона повідомила нас про зміну.','regular','standard','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'perform','performed','performed','/pəˈfɔːm/','/pəˈfɔːmd/','/pəˈfɔːmd/','виступати','He performed on stage.','Він виступав на сцені.','regular','standard','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'confirm','confirmed','confirmed','/kənˈfɜːm/','/kənˈfɜːmd/','/kənˈfɜːmd/','підтверджувати','She confirmed the booking.','Вона підтвердила бронювання.','regular','standard','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'offer','offered','offered','/ˈɒfə/','/ˈɒfəd/','/ˈɒfəd/','пропонувати','He offered to help.','Він запропонував допомогу.','regular','standard','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'suffer','suffered','suffered','/ˈsʌfə/','/ˈsʌfəd/','/ˈsʌfəd/','страждати','She suffered in silence.','Вона страждала мовчки.','regular','standard','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'discover','discovered','discovered','/dɪˈskʌvə/','/dɪˈskʌvəd/','/dɪˈskʌvəd/','відкривати','He discovered a new path.','Він знайшов новий шлях.','regular','standard','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'cover','covered','covered','/ˈkʌvə/','/ˈkʌvəd/','/ˈkʌvəd/','покривати','She covered the table.','Вона накрила стіл.','regular','standard','/d/',NULL,'extended',NULL,NULL),
    (v_lid,'wonder','wondered','wondered','/ˈwʌndə/','/ˈwʌndəd/','/ˈwʌndəd/','цікавитися','He wondered what happened.','Він цікавився, що сталося.','regular','standard','/d/',NULL,'extended',NULL,NULL),
    -- EXTENDED: standard /ɪd/
    (v_lid,'connect','connected','connected','/kəˈnekt/','/kəˈnektɪd/','/kəˈnektɪd/','підключати','She connected the cable.','Вона підключила кабель.','regular','standard','/ɪd/',NULL,'extended',NULL,NULL),
    (v_lid,'protect','protected','protected','/prəˈtekt/','/prəˈtektɪd/','/prəˈtektɪd/','захищати','He protected his family.','Він захищав свою родину.','regular','standard','/ɪd/',NULL,'extended',NULL,NULL),

    -- ======================================================
    -- IRREGULAR VERBS (100)
    -- ======================================================
    -- ABB essential
    (v_lid,'say','said','said','/seɪ/','/sed/','/sed/','казати','She said goodbye.','Вона попрощалася.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'make','made','made','/meɪk/','/meɪd/','/meɪd/','робити / виготовляти','He made a cake.','Він спік торт.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'have','had','had','/hæv/','/hæd/','/hæd/','мати','She had a cold.','Вона застудилася.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'hear','heard','heard','/hɪə/','/hɜːd/','/hɜːd/','чути','I heard a strange noise.','Я почув дивний шум.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'hold','held','held','/həʊld/','/held/','/held/','тримати','He held her hand.','Він тримав її руку.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'keep','kept','kept','/kiːp/','/kept/','/kept/','зберігати','She kept the secret.','Вона зберігала таємницю.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'leave','left','left','/liːv/','/left/','/left/','іти / залишати','He left early.','Він пішов рано.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'meet','met','met','/miːt/','/met/','/met/','зустрічати','She met an old friend.','Вона зустріла старого друга.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'sell','sold','sold','/sel/','/səʊld/','/səʊld/','продавати','He sold his car.','Він продав машину.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'tell','told','told','/tel/','/təʊld/','/təʊld/','розповідати','She told a story.','Вона розповіла казку.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'think','thought','thought','/θɪŋk/','/θɔːt/','/θɔːt/','думати','He thought about it.','Він думав про це.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'bring','brought','brought','/brɪŋ/','/brɔːt/','/brɔːt/','приносити','She brought flowers.','Вона принесла квіти.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'buy','bought','bought','/baɪ/','/bɔːt/','/bɔːt/','купувати','He bought a gift.','Він купив подарунок.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'catch','caught','caught','/kætʃ/','/kɔːt/','/kɔːt/','ловити','She caught the ball.','Вона зловила м''яч.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'teach','taught','taught','/tiːtʃ/','/tɔːt/','/tɔːt/','навчати','He taught maths.','Він викладав математику.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'feel','felt','felt','/fiːl/','/felt/','/felt/','відчувати','She felt tired.','Вона відчувала втому.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'sleep','slept','slept','/sliːp/','/slept/','/slept/','спати','He slept well.','Він добре спав.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'mean','meant','meant','/miːn/','/ment/','/ment/','означати','She meant it.','Вона це мала на увазі.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'send','sent','sent','/send/','/sent/','/sent/','надсилати','He sent an email.','Він надіслав електронний лист.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'spend','spent','spent','/spend/','/spent/','/spent/','витрачати','She spent all her money.','Вона витратила всі гроші.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'build','built','built','/bɪld/','/bɪlt/','/bɪlt/','будувати','He built a house.','Він побудував будинок.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'find','found','found','/faɪnd/','/faʊnd/','/faʊnd/','знаходити','She found her keys.','Вона знайшла ключі.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'lose','lost','lost','/luːz/','/lɒst/','/lɒst/','втрачати','He lost his phone.','Він загубив телефон.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'get','got','got','/ɡet/','/ɡɒt/','/ɡɒt/','отримувати','She got a letter.','Вона отримала листа.','irregular',NULL,NULL,'ABB','essential',NULL,'gotten'),
    (v_lid,'sit','sat','sat','/sɪt/','/sæt/','/sæt/','сидіти','He sat in the corner.','Він сидів у кутку.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'stand','stood','stood','/stænd/','/stʊd/','/stʊd/','стояти','She stood up quickly.','Вона швидко встала.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'understand','understood','understood','/ˌʌndəˈstænd/','/ˌʌndəˈstʊd/','/ˌʌndəˈstʊd/','розуміти','He understood the problem.','Він зрозумів проблему.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'win','won','won','/wɪn/','/wʌn/','/wʌn/','вигравати','She won the race.','Вона виграла гонку.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    (v_lid,'pay','paid','paid','/peɪ/','/peɪd/','/peɪd/','платити','He paid the bill.','Він оплатив рахунок.','irregular',NULL,NULL,'ABB','essential',NULL,NULL),
    -- ABB common
    (v_lid,'feed','fed','fed','/fiːd/','/fed/','/fed/','годувати','He fed the dog.','Він погодував пса.','irregular',NULL,NULL,'ABB','common',NULL,NULL),
    (v_lid,'lead','led','led','/liːd/','/led/','/led/','вести','She led the team.','Вона очолювала команду.','irregular',NULL,NULL,'ABB','common',NULL,NULL),
    (v_lid,'fight','fought','fought','/faɪt/','/fɔːt/','/fɔːt/','боротися','They fought for justice.','Вони боролися за справедливість.','irregular',NULL,NULL,'ABB','common',NULL,NULL),
    (v_lid,'deal','dealt','dealt','/diːl/','/delt/','/delt/','вирішувати','He dealt with the problem.','Він впорався з проблемою.','irregular',NULL,NULL,'ABB','common',NULL,NULL),
    (v_lid,'shine','shone','shone','/ʃaɪn/','/ʃɒn/','/ʃɒn/','сяяти','The sun shone brightly.','Сонце яскраво сяяло.','irregular',NULL,NULL,'ABB','common','shined','shined'),
    (v_lid,'shoot','shot','shot','/ʃuːt/','/ʃɒt/','/ʃɒt/','стріляти','He shot the target.','Він влучив у ціль.','irregular',NULL,NULL,'ABB','common',NULL,NULL),
    (v_lid,'light','lit','lit','/laɪt/','/lɪt/','/lɪt/','запалювати','She lit the candles.','Вона запалила свічки.','irregular',NULL,NULL,'ABB','common','lighted','lighted'),
    (v_lid,'lay','laid','laid','/leɪ/','/leɪd/','/leɪd/','класти / укладати','He laid the table.','Він накрив на стіл.','irregular',NULL,NULL,'ABB','common',NULL,NULL),
    (v_lid,'stick','stuck','stuck','/stɪk/','/stʌk/','/stʌk/','прилипати','The stamp stuck to the envelope.','Марка прилипла до конверта.','irregular',NULL,NULL,'ABB','common',NULL,NULL),
    -- ABB extended
    (v_lid,'bleed','bled','bled','/bliːd/','/bled/','/bled/','кровоточити','She bled from the cut.','Вона кровоточила з порізу.','irregular',NULL,NULL,'ABB','extended',NULL,NULL),
    (v_lid,'flee','fled','fled','/fliː/','/fled/','/fled/','тікати','They fled the country.','Вони втекли з країни.','irregular',NULL,NULL,'ABB','extended',NULL,NULL),
    (v_lid,'kneel','knelt','knelt','/niːl/','/nelt/','/nelt/','ставати на коліна','He knelt down.','Він опустився на коліна.','irregular',NULL,NULL,'ABB','extended','kneeled','kneeled'),
    (v_lid,'lean','leant','leant','/liːn/','/lent/','/lent/','спиратися','She leant against the wall.','Вона спиралася об стіну.','irregular',NULL,NULL,'ABB','extended','leaned','leaned'),
    (v_lid,'leap','leapt','leapt','/liːp/','/lept/','/lept/','стрибати','He leapt over the fence.','Він перестрибнув через паркан.','irregular',NULL,NULL,'ABB','extended','leaped','leaped'),
    (v_lid,'speed','sped','sped','/spiːd/','/sped/','/sped/','мчати','The car sped away.','Машина помчала.','irregular',NULL,NULL,'ABB','extended',NULL,NULL),
    -- AAA essential
    (v_lid,'cut','cut','cut','/kʌt/','/kʌt/','/kʌt/','різати','She cut the bread.','Вона порізала хліб.','irregular',NULL,NULL,'AAA','essential',NULL,NULL),
    (v_lid,'put','put','put','/pʊt/','/pʊt/','/pʊt/','класти','He put the book down.','Він поклав книгу.','irregular',NULL,NULL,'AAA','essential',NULL,NULL),
    (v_lid,'let','let','let','/let/','/let/','/let/','дозволяти','She let him go.','Вона дозволила йому піти.','irregular',NULL,NULL,'AAA','essential',NULL,NULL),
    (v_lid,'set','set','set','/set/','/set/','/set/','встановлювати','He set the alarm.','Він увімкнув будильник.','irregular',NULL,NULL,'AAA','essential',NULL,NULL),
    (v_lid,'hit','hit','hit','/hɪt/','/hɪt/','/hɪt/','вдаряти','The ball hit the window.','М''яч вдарив у вікно.','irregular',NULL,NULL,'AAA','essential',NULL,NULL),
    (v_lid,'hurt','hurt','hurt','/hɜːt/','/hɜːt/','/hɜːt/','боліти / ранити','He hurt his knee.','Він ударив коліно.','irregular',NULL,NULL,'AAA','essential',NULL,NULL),
    (v_lid,'cost','cost','cost','/kɒst/','/kɒst/','/kɒst/','коштувати','It cost ten pounds.','Це коштувало десять фунтів.','irregular',NULL,NULL,'AAA','essential',NULL,NULL),
    (v_lid,'read','read','read','/riːd/','/red/','/red/','читати','She read a novel.','Вона читала роман.','irregular',NULL,NULL,'AAA','essential',NULL,NULL),
    -- AAA common
    (v_lid,'shut','shut','shut','/ʃʌt/','/ʃʌt/','/ʃʌt/','зачиняти','He shut the door.','Він зачинив двері.','irregular',NULL,NULL,'AAA','common',NULL,NULL),
    -- AAA extended
    (v_lid,'bet','bet','bet','/bet/','/bet/','/bet/','битися об заклад','He bet on the horse.','Він поставив на коня.','irregular',NULL,NULL,'AAA','extended',NULL,NULL),
    (v_lid,'burst','burst','burst','/bɜːst/','/bɜːst/','/bɜːst/','вибухати','The pipe burst.','Труба лопнула.','irregular',NULL,NULL,'AAA','extended',NULL,NULL),
    (v_lid,'cast','cast','cast','/kɑːst/','/kɑːst/','/kɑːst/','кидати / знімати у ролі','They cast a famous actor.','Вони взяли відомого актора.','irregular',NULL,NULL,'AAA','extended',NULL,NULL),
    -- ABA essential
    (v_lid,'come','came','come','/kʌm/','/keɪm/','/kʌm/','приходити','She came home late.','Вона прийшла додому пізно.','irregular',NULL,NULL,'ABA','essential',NULL,NULL),
    (v_lid,'run','ran','run','/rʌn/','/ræn/','/rʌn/','бігти','He ran to catch the bus.','Він біг, щоб встигнути на автобус.','irregular',NULL,NULL,'ABA','essential',NULL,NULL),
    (v_lid,'become','became','become','/bɪˈkʌm/','/bɪˈkeɪm/','/bɪˈkʌm/','ставати','She became a teacher.','Вона стала вчителькою.','irregular',NULL,NULL,'ABA','essential',NULL,NULL),
    -- ABA extended
    (v_lid,'overcome','overcame','overcome','/ˌəʊvəˈkʌm/','/ˌəʊvəˈkeɪm/','/ˌəʊvəˈkʌm/','долати','He overcame his fear.','Він подолав страх.','irregular',NULL,NULL,'ABA','extended',NULL,NULL),
    -- ABC essential
    (v_lid,'go','went','gone','/ɡəʊ/','/went/','/ɡɒn/','іти / їхати','She went to the market.','Вона пішла на ринок.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'be','was/were','been','/biː/','/wɒz/wɜː/','/biːn/','бути','He was at home.','Він був вдома.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'do','did','done','/duː/','/dɪd/','/dʌn/','робити','She did her homework.','Вона зробила домашнє завдання.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'see','saw','seen','/siː/','/sɔː/','/siːn/','бачити','I saw him yesterday.','Я бачив його вчора.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'know','knew','known','/nəʊ/','/njuː/','/nəʊn/','знати','She knew the answer.','Вона знала відповідь.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'give','gave','given','/ɡɪv/','/ɡeɪv/','/ˈɡɪvən/','давати','He gave me a book.','Він дав мені книгу.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'take','took','taken','/teɪk/','/tʊk/','/ˈteɪkən/','брати','She took a photo.','Вона зробила фото.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'speak','spoke','spoken','/spiːk/','/spəʊk/','/ˈspəʊkən/','говорити','He spoke to the teacher.','Він поговорив з учителем.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'write','wrote','written','/raɪt/','/rəʊt/','/ˈrɪtən/','писати','She wrote a letter.','Вона написала листа.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'drive','drove','driven','/draɪv/','/drəʊv/','/ˈdrɪvən/','водити машину','He drove to work.','Він поїхав на роботу.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'ride','rode','ridden','/raɪd/','/rəʊd/','/ˈrɪdən/','їздити верхи / їздити','She rode a bike.','Вона їздила на велосипеді.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'grow','grew','grown','/ɡrəʊ/','/ɡruː/','/ɡrəʊn/','рости','The plant grew quickly.','Рослина росла швидко.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'throw','threw','thrown','/θrəʊ/','/θruː/','/θrəʊn/','кидати','He threw the ball.','Він кинув м''яч.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'fly','flew','flown','/flaɪ/','/fluː/','/fləʊn/','летіти','She flew to Paris.','Вона полетіла до Парижа.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'draw','drew','drawn','/drɔː/','/druː/','/drɔːn/','малювати','He drew a picture.','Він намалював картину.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'break','broke','broken','/breɪk/','/brəʊk/','/ˈbrəʊkən/','ламати','She broke the glass.','Вона розбила склянку.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'choose','chose','chosen','/tʃuːz/','/tʃəʊz/','/ˈtʃəʊzən/','вибирати','He chose the red one.','Він вибрав червоний.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'wake','woke','woken','/weɪk/','/wəʊk/','/ˈwəʊkən/','прокидатися','She woke early.','Вона прокинулася рано.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'forget','forgot','forgotten','/fəˈɡet/','/fəˈɡɒt/','/fəˈɡɒtən/','забувати','He forgot his keys.','Він забув ключі.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'fall','fell','fallen','/fɔːl/','/fel/','/ˈfɔːlən/','падати','She fell on the ice.','Вона впала на льоду.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'eat','ate','eaten','/iːt/','/et/','/ˈiːtən/','їсти','He ate a big breakfast.','Він з''їв великий сніданок.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'drink','drank','drunk','/drɪŋk/','/dræŋk/','/drʌŋk/','пити','She drank some water.','Вона випила трохи води.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'sing','sang','sung','/sɪŋ/','/sæŋ/','/sʌŋ/','співати','He sang a song.','Він заспівав пісню.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'swim','swam','swum','/swɪm/','/swæm/','/swʌm/','плавати','She swam across the river.','Вона переплила через річку.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    (v_lid,'blow','blew','blown','/bləʊ/','/bluː/','/bləʊn/','дмухати','The wind blew hard.','Вітер дмухав сильно.','irregular',NULL,NULL,'ABC','essential',NULL,NULL),
    -- ABC common
    (v_lid,'begin','began','begun','/bɪˈɡɪn/','/bɪˈɡæn/','/bɪˈɡʌn/','починати','She began a new project.','Вона розпочала новий проект.','irregular',NULL,NULL,'ABC','common',NULL,NULL),
    (v_lid,'ring','rang','rung','/rɪŋ/','/ræŋ/','/rʌŋ/','дзвонити','He rang the bell.','Він подзвонив у дзвінок.','irregular',NULL,NULL,'ABC','common',NULL,NULL),
    (v_lid,'wear','wore','worn','/weə/','/wɔː/','/wɔːn/','носити одяг','She wore a red dress.','Вона одягла червону сукню.','irregular',NULL,NULL,'ABC','common',NULL,NULL),
    (v_lid,'tear','tore','torn','/teə/','/tɔː/','/tɔːn/','рвати','He tore the paper.','Він порвав папір.','irregular',NULL,NULL,'ABC','common',NULL,NULL),
    (v_lid,'hide','hid','hidden','/haɪd/','/hɪd/','/ˈhɪdən/','ховатися','She hid behind the door.','Вона сховалася за дверима.','irregular',NULL,NULL,'ABC','common',NULL,NULL),
    (v_lid,'bite','bit','bitten','/baɪt/','/bɪt/','/ˈbɪtən/','кусати','The dog bit him.','Пес вкусив його.','irregular',NULL,NULL,'ABC','common',NULL,NULL),
    (v_lid,'freeze','froze','frozen','/friːz/','/frəʊz/','/ˈfrəʊzən/','замерзати','The river froze in winter.','Річка замерзла взимку.','irregular',NULL,NULL,'ABC','common',NULL,NULL),
    (v_lid,'steal','stole','stolen','/stiːl/','/stəʊl/','/ˈstəʊlən/','красти','Someone stole my wallet.','Хтось вкрав мій гаманець.','irregular',NULL,NULL,'ABC','common',NULL,NULL),
    (v_lid,'rise','rose','risen','/raɪz/','/rəʊz/','/ˈrɪzən/','підніматися','The sun rose at six.','Сонце зійшло о шостій.','irregular',NULL,NULL,'ABC','common',NULL,NULL),
    -- ABC extended
    (v_lid,'bear','bore','borne','/beə/','/bɔː/','/bɔːn/','терпіти / народжувати','She bore the pain bravely.','Вона мужньо терпіла біль.','irregular',NULL,NULL,'ABC','extended',NULL,NULL),
    (v_lid,'swear','swore','sworn','/sweə/','/swɔː/','/swɔːn/','клястися','He swore to tell the truth.','Він поклявся говорити правду.','irregular',NULL,NULL,'ABC','extended',NULL,NULL),
    (v_lid,'arise','arose','arisen','/əˈraɪz/','/əˈrəʊz/','/əˈrɪzən/','виникати','A problem arose.','Виникла проблема.','irregular',NULL,NULL,'ABC','extended',NULL,NULL),
    (v_lid,'forbid','forbade','forbidden','/fəˈbɪd/','/fəˈbeɪd/','/fəˈbɪdən/','забороняти','They forbade entry.','Вони заборонили вхід.','irregular',NULL,NULL,'ABC','extended',NULL,NULL),
    (v_lid,'forgive','forgave','forgiven','/fəˈɡɪv/','/fəˈɡeɪv/','/fəˈɡɪvən/','вибачати','She forgave him.','Вона вибачила йому.','irregular',NULL,NULL,'ABC','extended',NULL,NULL),
    (v_lid,'shake','shook','shaken','/ʃeɪk/','/ʃʊk/','/ˈʃeɪkən/','трясти','He shook the bottle.','Він потряс пляшку.','irregular',NULL,NULL,'ABC','extended',NULL,NULL);

END $$;
