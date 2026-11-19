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
    <button
      class="tts-btn"
      [class.speaking]="isActive()"
      [class.loading]="isLoading()"
      [attr.aria-label]="isActive() ? 'Stop' : 'Read aloud'"
      title="Listen"
      [disabled]="isLoading()"
      (click)="toggle()"
    >
      @if (isLoading()) { <span class="tts-spinner"></span> }
      @else { {{ isActive() ? '⏸' : '🔊' }} }
    </button>
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
    .tts-btn.loading {
      border-color: var(--border);
      opacity: .7;
    }
    .tts-spinner {
      display: block;
      width: 11px;
      height: 11px;
      border: 2px solid var(--border);
      border-top-color: var(--primary);
      border-radius: 50%;
      animation: tts-spin .6s linear infinite;
    }
    @keyframes tts-spin { to { transform: rotate(360deg); } }
  `]
})
export class TtsButtonComponent {
  text = input.required<string>();

  tts = inject(TtsService);
  isActive  = computed(() => this.tts.currentSpeakingText() === this.text());
  isLoading = computed(() => this.tts.isLoading() && this.tts.currentSpeakingText() === this.text());

  toggle(): void {
    void this.tts.speak(this.text());
  }
}
