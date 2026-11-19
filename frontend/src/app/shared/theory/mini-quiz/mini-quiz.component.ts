import {
  Component,
  ChangeDetectionStrategy,
  input,
  signal,
  computed
} from '@angular/core';
import { QuizOption } from '../../../core/models';

@Component({
  selector: 'app-mini-quiz',
  standalone: true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  templateUrl: './mini-quiz.component.html',
  styleUrl: './mini-quiz.component.scss'
})
export class MiniQuizComponent {
  question = input.required<string>();
  options  = input.required<QuizOption[]>();

  selected  = signal<number | null>(null);
  submitted = signal(false);

  isCorrect = computed(() => {
    const sel = this.selected();
    if (sel === null) return false;
    return this.options()[sel]?.correct ?? false;
  });

  select(idx: number): void {
    if (!this.submitted()) this.selected.set(idx);
  }

  submit(): void {
    if (this.selected() !== null) this.submitted.set(true);
  }

  retry(): void {
    this.selected.set(null);
    this.submitted.set(false);
  }

  optionClass(idx: number): string {
    if (!this.submitted()) return this.selected() === idx ? 'selected' : '';
    if (this.options()[idx].correct) return 'correct';
    if (this.selected() === idx)     return 'wrong';
    return 'dim';
  }

  get selectedExplanation(): string | undefined {
    const sel = this.selected();
    if (sel === null) return undefined;
    return this.options()[sel]?.explanation;
  }
}
