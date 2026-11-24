import { Component, Input, OnInit, signal, computed } from '@angular/core';
import { LessonService } from '../../../core/services/lesson.service';
import { TtsService } from '../../../core/services/tts.service';
import { VerbEntry } from '../../../core/models';

type TypeFilter = 'all' | 'regular' | 'irregular';
type DiffFilter = 'all' | 'essential' | 'common' | 'extended';

@Component({
  selector: 'app-verb-vocab',
  standalone: true,
  imports: [],
  templateUrl: './verb-vocab.component.html',
  styleUrl: './verb-vocab.component.scss'
})
export class VerbVocabComponent implements OnInit {
  @Input() lessonSlug = '';

  verbs    = signal<VerbEntry[]>([]);
  loading  = signal(true);

  typeFilter   = signal<TypeFilter>('all');
  diffFilter   = signal<DiffFilter>('all');
  groupFilter  = signal<string>('all');   // spellingRule or verbPattern
  searchQuery  = signal('');
  showTrans    = signal(true);
  expandedId   = signal<number | null>(null);

  regularCount   = computed(() => this.verbs().filter(v => v.verbType === 'regular').length);
  irregularCount = computed(() => this.verbs().filter(v => v.verbType === 'irregular').length);

  filtered = computed(() => {
    const type  = this.typeFilter();
    const diff  = this.diffFilter();
    const grp   = this.groupFilter();
    const q     = this.searchQuery().toLowerCase().trim();

    return this.verbs().filter(v => {
      if (type !== 'all' && v.verbType !== type) return false;
      if (diff !== 'all' && v.difficulty !== diff) return false;
      if (grp !== 'all') {
        const match = v.spellingRule === grp || v.verbPattern === grp || v.pronunciation === grp;
        if (!match) return false;
      }
      if (q) {
        return v.v1.includes(q) || v.v2.includes(q) || v.v3.includes(q) ||
               v.translation.toLowerCase().includes(q);
      }
      return true;
    });
  });

  groupOptions = computed(() => {
    const type = this.typeFilter();
    if (type === 'regular') {
      return [
        { value: 'all',           label: 'All rules' },
        { value: 'standard',      label: 'Standard (+ed)' },
        { value: 'double',        label: 'Double consonant' },
        { value: 'drop_e',        label: 'Drop -e' },
        { value: 'change_to_ied', label: '-y → -ied' },
        { value: '/t/',           label: 'Sounds /t/' },
        { value: '/d/',           label: 'Sounds /d/' },
        { value: '/ɪd/',          label: 'Sounds /ɪd/' },
      ];
    }
    if (type === 'irregular') {
      return [
        { value: 'all', label: 'All patterns' },
        { value: 'AAA', label: 'AAA  (run–run–run)' },
        { value: 'ABB', label: 'ABB  (keep–kept–kept)' },
        { value: 'ABA', label: 'ABA  (come–came–come)' },
        { value: 'ABC', label: 'ABC  (go–went–gone)' },
      ];
    }
    return [];
  });

  constructor(
    private lessonService: LessonService,
    public tts: TtsService
  ) {}

  ngOnInit(): void {
    this.lessonService.getVerbVocab(this.lessonSlug).subscribe({
      next:  (data) => { this.verbs.set(data); this.loading.set(false); },
      error: ()     => this.loading.set(false)
    });
  }

  setType(t: TypeFilter): void {
    this.typeFilter.set(t);
    this.groupFilter.set('all');
  }

  toggleExpand(id: number): void {
    this.expandedId.set(this.expandedId() === id ? null : id);
  }

  speak(text: string): void { this.tts.speak(text); }

  isSpeaking(text: string): boolean { return this.tts.currentSpeakingText() === text; }

  spellingLabel(rule: string | null): string {
    const map: Record<string, string> = {
      standard: '+ed', double: 'double', drop_e: 'drop -e', change_to_ied: '-y→-ied'
    };
    return rule ? (map[rule] ?? rule) : '';
  }

  diffColor(d: string): string {
    return d === 'essential' ? 'var(--success)' : d === 'common' ? 'var(--primary)' : 'var(--text-muted)';
  }
}
