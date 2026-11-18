-- ============================================================
-- V1: Initial Schema
-- ============================================================

CREATE TABLE IF NOT EXISTS levels (
    id          BIGSERIAL PRIMARY KEY,
    code        VARCHAR(2)   NOT NULL UNIQUE,
    name        VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    order_index INTEGER      NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
    id          BIGSERIAL PRIMARY KEY,
    level_id    BIGINT       NOT NULL REFERENCES levels(id),
    name        VARCHAR(200) NOT NULL,
    description VARCHAR(500),
    order_index INTEGER      NOT NULL
);

CREATE TABLE IF NOT EXISTS modules (
    id          BIGSERIAL PRIMARY KEY,
    course_id   BIGINT       NOT NULL REFERENCES courses(id),
    name        VARCHAR(200) NOT NULL,
    description VARCHAR(500),
    order_index INTEGER      NOT NULL
);

CREATE TABLE IF NOT EXISTS topics (
    id                BIGSERIAL PRIMARY KEY,
    module_id         BIGINT       NOT NULL REFERENCES modules(id),
    name              VARCHAR(200) NOT NULL,
    description       VARCHAR(500),
    order_index       INTEGER      NOT NULL,
    estimated_minutes INTEGER
);

CREATE TABLE IF NOT EXISTS lessons (
    id          BIGSERIAL PRIMARY KEY,
    topic_id    BIGINT       NOT NULL REFERENCES topics(id),
    name        VARCHAR(200) NOT NULL,
    slug        VARCHAR(200) NOT NULL UNIQUE,
    order_index INTEGER      NOT NULL,
    is_published BOOLEAN     NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS theory_blocks (
    id          BIGSERIAL PRIMARY KEY,
    lesson_id   BIGINT  NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
    content     TEXT    NOT NULL,
    order_index INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS examples (
    id           BIGSERIAL PRIMARY KEY,
    lesson_id    BIGINT       NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
    english_text VARCHAR(500) NOT NULL,
    translation  VARCHAR(500) NOT NULL,
    audio_url    VARCHAR(500),
    order_index  INTEGER      NOT NULL
);

CREATE TABLE IF NOT EXISTS exercises (
    id               BIGSERIAL PRIMARY KEY,
    lesson_id        BIGINT       NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
    type             VARCHAR(50)  NOT NULL,
    difficulty       INTEGER      NOT NULL DEFAULT 1,
    question         TEXT         NOT NULL,
    options          JSONB,
    correct_answer   TEXT,
    explanation      JSONB,
    tags             TEXT[],
    estimated_seconds INTEGER,
    order_index      INTEGER      NOT NULL
);

CREATE TABLE IF NOT EXISTS vocabulary_entries (
    id          BIGSERIAL PRIMARY KEY,
    lesson_id   BIGINT       REFERENCES lessons(id) ON DELETE SET NULL,
    word        VARCHAR(200) NOT NULL,
    ipa         VARCHAR(100),
    translation VARCHAR(200) NOT NULL,
    audio_url   VARCHAR(500),
    examples    JSONB,
    level_code  VARCHAR(2)
);

CREATE TABLE IF NOT EXISTS users (
    id                  BIGSERIAL PRIMARY KEY,
    email               VARCHAR(255) NOT NULL UNIQUE,
    password_hash       VARCHAR(255) NOT NULL,
    name                VARCHAR(100) NOT NULL,
    current_level       VARCHAR(2)   DEFAULT 'A1',
    daily_goal_minutes  INTEGER      DEFAULT 15,
    streak_days         INTEGER      DEFAULT 0,
    total_xp            INTEGER      DEFAULT 0,
    created_at          TIMESTAMP    NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMP    NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS user_progress (
    id           BIGSERIAL PRIMARY KEY,
    user_id      BIGINT    NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    lesson_id    BIGINT    NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
    completed    BOOLEAN   NOT NULL DEFAULT FALSE,
    score        INTEGER,
    started_at   TIMESTAMP,
    completed_at TIMESTAMP,
    UNIQUE (user_id, lesson_id)
);

CREATE TABLE IF NOT EXISTS attempts (
    id          BIGSERIAL PRIMARY KEY,
    user_id     BIGINT      NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    exercise_id BIGINT      NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
    answer      TEXT        NOT NULL,
    is_correct  BOOLEAN     NOT NULL,
    created_at  TIMESTAMP   NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS review_items (
    id               BIGSERIAL PRIMARY KEY,
    user_id          BIGINT         NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    item_type        VARCHAR(50)    NOT NULL,
    item_id          BIGINT         NOT NULL,
    due_date         TIMESTAMP      NOT NULL,
    interval_days    DOUBLE PRECISION DEFAULT 1.0,
    repetitions      INTEGER        DEFAULT 0,
    ease_factor      DOUBLE PRECISION DEFAULT 2.5,
    last_reviewed_at TIMESTAMP
);

-- Indexes
CREATE INDEX idx_lessons_slug         ON lessons(slug);
CREATE INDEX idx_user_progress_user   ON user_progress(user_id);
CREATE INDEX idx_user_progress_lesson ON user_progress(lesson_id);
CREATE INDEX idx_attempts_user        ON attempts(user_id);
CREATE INDEX idx_review_items_user_due ON review_items(user_id, due_date);
CREATE INDEX idx_vocab_level          ON vocabulary_entries(level_code);
