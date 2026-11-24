import { Component, OnInit, signal, computed } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { DashboardService } from '../../core/services/dashboard.service';
import { AuthService } from '../../core/services/auth.service';
import { DashboardResponse, LevelProgress, TopicStatus } from '../../core/models';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [RouterLink],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.scss'
})
export class DashboardComponent implements OnInit {
  dashboard = signal<DashboardResponse | null>(null);
  loading   = signal(true);
  error     = signal('');

  activeLevel = signal<string>('A1');

  readonly levelColors: Record<string, string> = {
    A1: '#3B82F6', A2: '#10B981', B1: '#F59E0B', B2: '#EC4899', C1: '#8B5CF6'
  };

  readonly TOTAL_TOPICS = 88;
  readonly TOTAL_LEVELS = 5;
  readonly TOTAL_SKILLS = 4;

  currentLevelData = computed<LevelProgress | null>(() => {
    const d = this.dashboard();
    if (!d) return null;
    return d.levelProgress.find(l => l.code === this.activeLevel()) ?? null;
  });

  currentTopics = computed<TopicStatus[]>(() => {
    return this.currentLevelData()?.topics ?? [];
  });

  constructor(
    private dashService: DashboardService,
    public auth: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.dashService.getDashboard().subscribe({
      next: (data) => {
        this.dashboard.set(data);
        this.activeLevel.set(data.userStats.currentLevel);
        this.loading.set(false);
      },
      error: () => { this.error.set('Failed to load dashboard.'); this.loading.set(false); }
    });
  }

  selectLevel(code: string, unlocked: boolean): void {
    if (unlocked) this.activeLevel.set(code);
  }

  startLesson(topic: TopicStatus): void {
    if (!topic.locked) {
      this.router.navigate(['/lessons', topic.slug]);
    }
  }

  topicIcon(topic: TopicStatus): string {
    if (topic.completed) return '✓';
    if (topic.locked)    return '🔒';
    return String(topic.orderIndex);
  }

  levelColor(code: string): string {
    return this.levelColors[code] ?? '#6C63FF';
  }

  xpToNextLevel(xp: number): number {
    return Math.max(0, 500 - (xp % 500));
  }

  xpProgress(xp: number): number {
    return Math.round((xp % 500) / 500 * 100);
  }
}
