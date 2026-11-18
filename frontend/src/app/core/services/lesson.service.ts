import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ExerciseSubmitRequest, ExerciseSubmitResponse, LessonResponse } from '../models';
import { environment } from '../../../environments/environment';

@Injectable({ providedIn: 'root' })
export class LessonService {
  constructor(private http: HttpClient) {}

  getLesson(slug: string): Observable<LessonResponse> {
    return this.http.get<LessonResponse>(`${environment.apiUrl}/lessons/${slug}`);
  }

  submitExercise(req: ExerciseSubmitRequest): Observable<ExerciseSubmitResponse> {
    return this.http.post<ExerciseSubmitResponse>(`${environment.apiUrl}/exercises/submit`, req);
  }
}
