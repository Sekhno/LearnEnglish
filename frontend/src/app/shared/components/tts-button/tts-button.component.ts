import {
  Component,
  ChangeDetectionStrategy,
  inject,
  computed,
  input
} from '@angular/core';
import { TtsService } from '../../../core/services/tts.service';

@Component({
  selector: 'app-tts-button',
  standalone: true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  template: `
    @if (tts.supported) {
      <button
        class="tts-btn"
        [class.speaking]="isActive()"
        [attr.aria-label]="isActive() ? 'Stop' : 'Read aloud'"
        title="Listen"
        (click)="toggle()"
      >
        {{ isActive() ? '⏸' : '🔊' }}
      </button>
    }
  `,
  styles: [`
    .tts-btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 28px;
      height: 28px;
      border-radius: 50%;
      border: 1.5px solid var(--border);
      background: var(--bg-card);
      font-size: 13px;
      color: var(--text-secondary);
      transition: var(--transition);
      flex-shrink: 0;
      cursor: pointer;
      line-height: 1;
    }
    .tts-btn:hover {
      border-color: var(--primary);
      color: var(--primary);
      background: var(--primary-light);
    }
    .tts-btn.speaking {
      border-color: var(--primary);
      background: var(--primary-light);
      color: var(--primary);
    }
  `]
})
export class TtsButtonComponent {
  text = input.required<string>();
  lang = input<string>('en-US');

  tts = inject(TtsService);
  isActive = computed(() => this.tts.currentSpeakingText() === this.text());

  toggle(): void {
    this.tts.speak(this.text(), this.lang());
  }
}
