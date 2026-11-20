export interface AuthResponse {
  token: string;
  email: string;
  name: string;
  currentLevel: string;
}

export interface LoginRequest {
  email: string;
  password: string;
}

export interface RegisterRequest {
  name: string;
  email: string;
  password: string;
}

// Dashboard
export interface DashboardResponse {
  userStats: UserStats;
  levelProgress: LevelProgress[];
  currentLevelTopics: TopicStatus[];
  skillProgress: SkillProgress[];
  reviewsDue: number;
}

export interface UserStats {
  name: string;
  currentLevel: string;
  streakDays: number;
  totalXp: number;
  completedLessons: number;
  dailyGoalMinutes: number;
}

export interface LevelProgress {
  code: string;
  name: string;
  totalLessons: number;
  completedLessons: number;
  progressPercent: number;
}

export interface TopicStatus {
  lessonId: number;
  name: string;
  slug: string;
  orderIndex: number;
  completed: boolean;
  locked: boolean;
  score: number | null;
}

export interface SkillProgress {
  skill: string;
  score: number;
}

// Lesson
export interface LessonResponse {
  id: number;
  name: string;
  slug: string;
  levelCode: string;
  theory: TheoryBlock[];
  examples: Example[];
  exercises: Exercise[];
  vocabulary: VocabEntry[];
}

export interface TheoryBlock {
  id: number;
  content: string;
  orderIndex: number;
}

export interface Example {
  id: number;
  englishText: string;
  translation: string;
  audioUrl: string | null;
  orderIndex: number;
}

export interface Exercise {
  id: number;
  type: ExerciseType;
  difficulty: number;
  question: string;
  options: string[] | null;
  explanation: Record<string, string> | null;
  estimatedSeconds: number;
  orderIndex: number;
}

export type ExerciseType =
  | 'MULTIPLE_CHOICE'
  | 'FILL_IN_THE_BLANK'
  | 'SENTENCE_BUILDER'
  | 'MATCHING_PAIRS'
  | 'LISTENING'
  | 'FIND_THE_MISTAKE'
  | 'TRANSLATION'
  | 'SPEAKING'
  | 'STORY_COMPLETION';

export interface VocabEntry {
  id: number;
  word: string;
  ipa: string | null;
  translation: string;
  audioUrl: string | null;
  examples: string[] | null;
}

export interface ExerciseSubmitRequest {
  exerciseId: number;
  answer: string;
}

export interface ExerciseSubmitResponse {
  correct: boolean;
  correctAnswer: string;
  explanation: Record<string, string> | null;
  xpEarned: number;
}

// AI Practice
export interface AiMessage {
  role: 'user' | 'assistant';
  content: string;
}

export interface AiChatRequest {
  scenario: string;
  level: string;
  messages: AiMessage[];
}

export interface AiChatResponse {
  content: string;
}

export interface AiScenario {
  id: string;
  name: string;
  description: string;
  icon: string;
  hint: string;
}

// === Theory Content Block System ===

export interface InlineToken {
  t: string;    // text
  b?: boolean;  // bold
  i?: boolean;  // italic
  c?: boolean;  // inline code
}

export interface QuizOption {
  text: string;
  correct: boolean;
  explanation?: string;
}

export interface WordCard {
  word: string;
  ipa?: string;
  translation: string;
  tag?: string;
  example?: { en: string; ru: string };
}

export type BlockKind =
  | 'heading'
  | 'paragraph'
  | 'list'
  | 'table'
  | 'rule'
  | 'example'
  | 'tip'
  | 'warning'
  | 'miniQuiz'
  | 'cardGrid';

export interface ParsedBlock {
  kind: BlockKind;
  // heading
  level?: 1 | 2 | 3;
  text?: string;
  // paragraph
  tokens?: InlineToken[];
  // list
  items?: InlineToken[][];
  // table
  headers?: string[];
  rows?: string[][];
  // rule
  rule?: string;
  // example
  english?: string;
  translation?: string;
  note?: string;
  // tip / warning
  content?: string;
  // miniQuiz
  question?: string;
  options?: QuizOption[];
  // cardGrid
  cards?: WordCard[];
}
