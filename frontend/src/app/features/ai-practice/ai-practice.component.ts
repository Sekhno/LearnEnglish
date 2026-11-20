import { Component, signal, computed, ViewChild, ElementRef, AfterViewChecked } from '@angular/core';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { AiService } from '../../core/services/ai.service';
import { AuthService } from '../../core/services/auth.service';
import { AiMessage, AiScenario } from '../../core/models';

interface ChatMessage {
  role: 'user' | 'assistant';
  text: string;
  correction: string | null;
}

@Component({
  selector: 'app-ai-practice',
  standalone: true,
  imports: [RouterLink, FormsModule],
  templateUrl: './ai-practice.component.html',
  styleUrl: './ai-practice.component.scss'
})
export class AiPracticeComponent implements AfterViewChecked {
  @ViewChild('chatEnd') chatEnd!: ElementRef;

  readonly scenarios: AiScenario[] = [
    { id: 'cafe',          name: 'Coffee Shop',    description: 'Order drinks and food, ask about the menu', icon: '☕', hint: 'Start with: "Hi, I would like to order..."' },
    { id: 'airport',       name: 'Airport',        description: 'Check in for a flight, handle baggage',      icon: '✈️', hint: 'Start with: "Excuse me, I need to check in..."' },
    { id: 'hotel',         name: 'Hotel',          description: 'Check in, ask about facilities and services', icon: '🏨', hint: 'Start with: "Hello, I have a reservation..."' },
    { id: 'job_interview', name: 'Job Interview',  description: 'Practice your English in a job interview',   icon: '💼', hint: 'Start with: "Good morning, I am here for the interview..."' },
    { id: 'shopping',      name: 'Shopping',       description: 'Ask about clothes, sizes and prices',        icon: '🛍️', hint: 'Start with: "Excuse me, can I see this in a different size?"' },
    { id: 'apartment',     name: 'Apartment',      description: 'Ask about renting an apartment',             icon: '🏠', hint: 'Start with: "Hi, I saw your listing online..."' },
  ];

  readonly levels = ['A1', 'A2', 'B1', 'B2', 'C1'];

  selectedScenario = signal<AiScenario | null>(null);
  selectedLevel    = signal('A1');
  messages         = signal<ChatMessage[]>([]);
  inputText        = signal('');
  loading          = signal(false);
  error            = signal('');

  private shouldScroll = false;

  constructor(
    private aiService: AiService,
    public auth: AuthService
  ) {}

  ngAfterViewChecked(): void {
    if (this.shouldScroll) {
      this.chatEnd?.nativeElement?.scrollIntoView({ behavior: 'smooth' });
      this.shouldScroll = false;
    }
  }

  selectScenario(scenario: AiScenario): void {
    this.selectedScenario.set(scenario);
    this.messages.set([]);
    this.inputText.set('');
    this.error.set('');
  }

  backToScenarios(): void {
    this.selectedScenario.set(null);
    this.messages.set([]);
    this.inputText.set('');
    this.error.set('');
  }

  setLevel(level: string): void {
    this.selectedLevel.set(level);
  }

  sendMessage(): void {
    const text = this.inputText().trim();
    const scenario = this.selectedScenario();
    if (!text || !scenario || this.loading()) return;

    const userMsg: ChatMessage = { role: 'user', text, correction: null };
    this.messages.update(msgs => [...msgs, userMsg]);
    this.inputText.set('');
    this.loading.set(true);
    this.error.set('');
    this.shouldScroll = true;

    const apiMessages: AiMessage[] = this.messages().map(m => ({
      role: m.role,
      content: m.text
    }));

    this.aiService.chat({
      scenario: scenario.id,
      level: this.selectedLevel(),
      messages: apiMessages
    }).subscribe({
      next: (res) => {
        const { text: mainText, correction } = this.parseResponse(res.content);
        this.messages.update(msgs => [...msgs, { role: 'assistant', text: mainText, correction }]);
        this.loading.set(false);
        this.shouldScroll = true;
      },
      error: () => {
        this.error.set('Failed to get response. Make sure LLM Studio is running at http://127.0.0.1:1234');
        this.loading.set(false);
      }
    });
  }

  onEnter(event: KeyboardEvent): void {
    if (event.key === 'Enter' && !event.shiftKey) {
      event.preventDefault();
      this.sendMessage();
    }
  }

  private parseResponse(content: string): { text: string; correction: string | null } {
    // Remove <think>...</think> blocks if model outputs them
    const cleaned = content.replace(/<think>[\s\S]*?<\/think>/gi, '').trim();

    const correctionMarker = '📝 Correction:';
    const idx = cleaned.indexOf(correctionMarker);
    if (idx === -1) {
      return { text: cleaned, correction: null };
    }
    return {
      text: cleaned.slice(0, idx).trim(),
      correction: cleaned.slice(idx + correctionMarker.length).trim()
    };
  }

  useHint(): void {
    const scenario = this.selectedScenario();
    if (scenario) this.inputText.set(scenario.hint);
  }
}
