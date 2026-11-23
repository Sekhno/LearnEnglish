# LearnEnglish

Интерактивная платформа для самостоятельного изучения английского языка с уровня A1 до C1 (CEFR).

## Стек технологий

| Слой | Технология |
|------|-----------|
| Frontend | Angular 17 (Standalone Components, Signals) |
| Backend | Spring Boot 3.2 (Java 21) |
| База данных | PostgreSQL 16 |
| Миграции | Flyway |
| Аутентификация | JWT (jjwt 0.12) |
| Контейнеры | Docker / Docker Compose |
| TTS | Piper TTS (en_GB-alan-low) |

## Структура проекта

```
LearnEnglish/
├── backend/                        # Spring Boot API
│   ├── src/main/java/com/learnenglish/
│   │   ├── config/                 # Security, CORS
│   │   ├── controller/             # REST endpoints
│   │   ├── dto/                    # Request / Response объекты
│   │   ├── model/                  # JPA entities
│   │   ├── repository/             # Spring Data репозитории
│   │   ├── security/               # JWT filter, provider
│   │   └── service/                # Бизнес-логика
│   └── src/main/resources/
│       ├── application.yml
│       └── db/migration/
│           ├── V1__init_schema.sql       # Полная схема БД
│           ├── V2__seed_a1_content.sql   # Контент уровня A1
│           ├── V3__enrich_demonstratives.sql
│           └── V4__seed_lesson_vocabulary.sql # Словари 20 уроков A1
├── frontend/                       # Angular приложение
│   └── src/app/
│       ├── core/                   # Models, Services, Guards, Interceptors
│       └── features/
│           ├── auth/               # Login / Register
│           ├── dashboard/          # Главный экран пользователя
│           └── lesson/             # Просмотр урока и упражнения
├── piper/                          # Piper TTS Docker-сервис
│   └── Dockerfile
├── piper-tts.sh                    # Запуск TTS локально (macOS/Linux)
├── docker-compose.yml
└── TECHNICAL.md                    # Полное техническое задание
```

## Быстрый старт

### Требования
- Docker & Docker Compose

### Запуск через Docker (рекомендуется)

```bash
docker compose up --build
```

| Сервис | URL |
|--------|-----|
| Приложение | `http://localhost:4200` |
| Backend API | `http://localhost:8080/api` |
| Piper TTS | `http://localhost:5000` |

> **Первый запуск:** Piper автоматически скачивает голосовую модель `en_GB-alan-low` (~63 MB) в Docker Volume. Последующие запуски используют кэш.

### Локальная разработка

**1. База данных + Piper TTS**
```bash
docker compose up postgres piper -d
```

**2. Backend**
```bash
cd backend
./mvnw spring-boot:run
```
API: `http://localhost:8080/api`

**3. Frontend**
```bash
cd frontend
npm install
npm start
```
Приложение: `http://localhost:4200`

> **macOS/Linux без Docker:** установите piper-tts (`pip install piper-tts`, Python 3.9–3.12) и запустите `./piper-tts.sh` вместо `docker compose up piper`.

## Piper TTS

Синтез речи обеспечивает озвучивание слов в разделе **Vocabulary** и примеров в разделе **Theory**.

| Параметр | Значение |
|----------|---------|
| Движок | [Piper TTS](https://github.com/rhasspy/piper) |
| Голос | `en_GB-alan-low` (британский мужской) |
| Порт | 5000 |
| Эндпоинт | `POST /synthesize` → WAV-поток |

Фронтенд обращается к `/tts/synthesize`, nginx проксирует на контейнер `piper:5000`.
В режиме `ng serve` проксирование настроено в `src/proxy.conf.json`.

## API

| Метод | Endpoint | Описание | Auth |
|-------|----------|----------|------|
| POST | `/api/auth/register` | Регистрация | Нет |
| POST | `/api/auth/login` | Вход | Нет |
| GET | `/api/dashboard` | Данные дашборда | JWT |
| GET | `/api/lessons/{slug}` | Урок по slug | JWT |
| POST | `/api/exercises/submit` | Проверка ответа | JWT |
| POST | `/tts/synthesize` | Синтез речи (Piper) | Нет |

## Учебная программа

**Всего: 88 тем** по 5 уровням CEFR.

| Уровень | Название | Тем | Статус |
|---------|----------|-----|--------|
| A1 | Beginner | 20 | Готово (контент + упражнения) |
| A2 | Elementary | 18 | В разработке |
| B1 | Intermediate | 18 | В разработке |
| B2 | Upper-Intermediate | 18 | В разработке |
| C1 | Advanced | 14 | В разработке |

### Уровень A1 — готовые уроки

1. Alphabet & Pronunciation
2. Greetings & Introductions
3. Personal Pronouns
4. Verb To Be
5. Articles
6. Nouns & Plurals
7. Numbers, Dates & Time
8. Possessives
9. This, That, These, Those
10. Have / Have Got
11. Present Simple
12. Adverbs of Frequency
13. Question Words
14. There Is / There Are
15. Prepositions of Place & Time
16. Can / Can't
17. Present Continuous
18. Imperatives
19. Some / Any & Countability
20. Basic Adjectives

Каждый урок содержит: теорию, примеры с переводом, 5–7 интерактивных упражнений и словарь.

## Возможности MVP

- Регистрация и вход по JWT
- Дашборд: прогресс по уровням, навыки (Reading/Writing/Listening/Speaking), XP, стрик
- Сетка 20 топиков A1 с системой блокировки (unlock по порядку)
- Просмотр урока: вкладки Theory / Practice / Vocabulary
- Упражнения: Multiple Choice, Fill in the Blank с объяснением ошибок
- XP за правильные ответы
- Неправильные ответы добавляются в очередь повторения (Spaced Repetition, FSRS-ready)

## Дорожная карта

```
MVP (сейчас)     → A1 контент (20 уроков), упражнения, словари с TTS, дашборд, авторизация
Phase 2          → Словарные карточки, аудирование, интервальное повторение (FSRS)
Phase 3          → AI диалоги, голосовые упражнения, персонализированные объяснения
Phase 4          → Адаптивное обучение, входное тестирование, аналитика
Phase 5          → A2–C1 контент, редактор уроков, локализация
```
