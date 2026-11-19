import { Injectable, signal } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class TtsService {
  private synth: SpeechSynthesis | null =
    typeof window !== 'undefined' && 'speechSynthesis' in window
      ? window.speechSynthesis
      : null;

  private _activeText = signal<string | null>(null);

  readonly currentSpeakingText = this._activeText.asReadonly();

  get supported(): boolean {
    return this.synth !== null;
  }

  speak(text: string, lang = 'en-US'): void {
    if (!this.synth) return;

    // Strip Markdown syntax before speaking
    const clean = text
      .replace(/\*\*/g, '')
      .replace(/\*/g, '')
      .replace(/`/g, '')
      .replace(/#+\s/g, '')
      .trim();

    if (!clean) return;

    // Toggle off if the same text is already playing
    if (this.synth.speaking && this._activeText() === text) {
      this.synth.cancel();
      this._activeText.set(null);
      return;
    }

    if (this.synth.speaking) {
      this.synth.cancel();
    }

    const utt = new SpeechSynthesisUtterance(clean);
    utt.lang = lang;
    utt.rate = 0.9;
    utt.pitch = 1.0;

    utt.onstart = () => this._activeText.set(text);
    utt.onend   = () => this._activeText.set(null);
    utt.onerror = () => this._activeText.set(null);

    this._activeText.set(text);
    this.synth.speak(utt);
  }

  stop(): void {
    this.synth?.cancel();
    this._activeText.set(null);
  }
}
