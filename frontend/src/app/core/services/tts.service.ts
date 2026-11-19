import { Injectable, signal } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { firstValueFrom } from 'rxjs';

const PIPER_VOICE = 'en_GB-alan-low';

@Injectable({ providedIn: 'root' })
export class TtsService {
  private _activeText = signal<string | null>(null);
  private _loading    = signal(false);

  readonly currentSpeakingText = this._activeText.asReadonly();
  readonly isLoading           = this._loading.asReadonly();

  private currentAudio: HTMLAudioElement | null = null;

  readonly supported = true;

  constructor(private http: HttpClient) {}

  async speak(text: string): Promise<void> {
    const clean = this.stripMarkdown(text);
    if (!clean) return;

    // Toggle off if same text is playing
    if (this._activeText() === text) {
      this.stop();
      return;
    }

    this.stop();

    this._activeText.set(text);
    this._loading.set(true);

    try {
      const blob = await firstValueFrom(
        this.http.post('/tts/synthesize', { text: clean, voice: PIPER_VOICE }, { responseType: 'blob' })
      );

      const url = URL.createObjectURL(blob);
      const audio = new Audio(url);
      this.currentAudio = audio;

      audio.onended = () => {
        URL.revokeObjectURL(url);
        this._activeText.set(null);
        this._loading.set(false);
        this.currentAudio = null;
      };

      audio.onerror = () => {
        URL.revokeObjectURL(url);
        this._activeText.set(null);
        this._loading.set(false);
        this.currentAudio = null;
      };

      this._loading.set(false);
      await audio.play();

    } catch {
      this._activeText.set(null);
      this._loading.set(false);
    }
  }

  stop(): void {
    if (this.currentAudio) {
      this.currentAudio.pause();
      this.currentAudio = null;
    }
    this._activeText.set(null);
    this._loading.set(false);
  }

  private stripMarkdown(text: string): string {
    return text
      .replace(/\*\*/g, '')
      .replace(/\*/g, '')
      .replace(/`/g, '')
      .replace(/#+\s/g, '')
      .trim();
  }
}
