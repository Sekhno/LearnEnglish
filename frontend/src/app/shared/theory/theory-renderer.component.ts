import {
  Component,
  ChangeDetectionStrategy,
  inject,
  input,
  computed
} from '@angular/core';
import { MarkdownParserService } from '../../core/services/markdown-parser.service';
import { TtsButtonComponent } from '../components/tts-button/tts-button.component';
import { MiniQuizComponent } from './mini-quiz/mini-quiz.component';
import { TheoryBlock, ParsedBlock } from '../../core/models';

@Component({
  selector: 'app-theory-renderer',
  standalone: true,
  imports: [TtsButtonComponent, MiniQuizComponent],
  templateUrl: './theory-renderer.component.html',
  styleUrl: './theory-renderer.component.scss',
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class TheoryRendererComponent {
  blocks = input.required<TheoryBlock[]>();

  private parser = inject(MarkdownParserService);

  allParsed = computed<ParsedBlock[]>(() =>
    this.blocks().flatMap(b => this.parseBlock(b.content))
  );

  private parseBlock(content: string): ParsedBlock[] {
    const c = content.trim();
    if (c.startsWith('[')) {
      try { return JSON.parse(c) as ParsedBlock[]; } catch { /* fall through */ }
    }
    return this.parser.parse(c);
  }
}
