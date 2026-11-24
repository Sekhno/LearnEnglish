import { Component, OnInit, signal, computed, inject, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { LessonService } from '../../core/services/lesson.service';
import { TtsService } from '../../core/services/tts.service';
import { LessonResponse, Exercise, ExerciseSubmitResponse } from '../../core/models';
import { TheoryRendererComponent } from '../../shared/theory/theory-renderer.component';
import { TtsButtonComponent } from '../../shared/components/tts-button/tts-button.component';
import { VerbVocabComponent } from './verb-vocab/verb-vocab.component';

type LessonTab = 'theory' | 'practice' | 'vocabulary';

@Component({
  selector: 'app-lesson',
  standalone: true,
  imports: [RouterLink, TheoryRendererComponent, TtsButtonComponent, VerbVocabComponent],
  templateUrl: './lesson.component.html',
  styleUrl: './lesson.component.scss'
})
export class LessonComponent implements OnInit, OnDestroy {
  lesson   = signal<LessonResponse | null>(null);
  loading  = signal(true);
  error    = signal('');

  activeTab = signal<LessonTab>('theory');

  // Exercise state
  currentExerciseIdx = signal(0);
  selectedAnswer     = signal<string | null>(null);
  submitResult       = signal<ExerciseSubmitResponse | null>(null);
  submitting         = signal(false);
  score              = signal(0);
  answered           = signal(0);

  currentExercise = computed<Exercise | null>(() => {
    const lesson = this.lesson();
    if (!lesson) return null;
    return lesson.exercises[this.currentExerciseIdx()] ?? null;
  });

  isLastExercise = computed(() => {
    const lesson = this.lesson();
    return !lesson || this.currentExerciseIdx() >= lesson.exercises.length - 1;
  });

  private tts = inject(TtsService);

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private lessonService: LessonService
  ) {}

  ngOnInit(): void {
    const slug = this.route.snapshot.paramMap.get('slug') ?? '';
    this.lessonService.getLesson(slug).subscribe({
      next: (data) => { this.lesson.set(data); this.loading.set(false); },
      error: ()     => { this.error.set('Lesson not found.'); this.loading.set(false); }
    });
  }

  setTab(tab: LessonTab): void {
    this.activeTab.set(tab);
  }

  selectOption(option: string): void {
    if (this.submitResult()) return;
    this.selectedAnswer.set(option);
  }

  submitAnswer(): void {
    const exercise = this.currentExercise();
    const answer   = this.selectedAnswer();
    if (!exercise || !answer || this.submitting()) return;

    this.submitting.set(true);
    this.lessonService.submitExercise({ exerciseId: exercise.id, answer }).subscribe({
      next: (result) => {
        this.submitResult.set(result);
        this.answered.update(n => n + 1);
        if (result.correct) this.score.update(n => n + 1);
        this.submitting.set(false);

        if (this.isLastExercise()) {
          const lesson = this.lesson();
          if (lesson) {
            const scorePercent = Math.round((this.score() / this.answered()) * 100);
            this.lessonService.completeLesson(lesson.slug, scorePercent).subscribe();
          }
        }
      },
      error: () => this.submitting.set(false)
    });
  }

  ngOnDestroy(): void {
    this.tts.stop();
  }

  nextExercise(): void {
    if (!this.isLastExercise()) {
      this.currentExerciseIdx.update(n => n + 1);
      this.selectedAnswer.set(null);
      this.submitResult.set(null);
    }
  }

  get progressPercent(): number {
    const lesson = this.lesson();
    if (!lesson || lesson.exercises.length === 0) return 0;
    return Math.round((this.answered() / lesson.exercises.length) * 100);
  }

  get finalScore(): number {
    const answered = this.answered();
    return answered > 0 ? Math.round((this.score() / answered) * 100) : 0;
  }
}
