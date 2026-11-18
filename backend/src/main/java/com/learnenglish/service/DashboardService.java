package com.learnenglish.service;

import com.learnenglish.dto.dashboard.DashboardResponse;
import com.learnenglish.model.User;
import com.learnenglish.model.UserProgress;
import com.learnenglish.model.enums.CefrLevel;
import com.learnenglish.repository.LessonRepository;
import com.learnenglish.repository.ReviewItemRepository;
import com.learnenglish.repository.UserProgressRepository;
import com.learnenglish.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final UserRepository userRepository;
    private final UserProgressRepository progressRepository;
    private final LessonRepository lessonRepository;
    private final ReviewItemRepository reviewItemRepository;

    @Transactional(readOnly = true)
    public DashboardResponse getDashboard() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByEmail(email).orElseThrow();

        long completedLessons = progressRepository.countCompletedByUserId(user.getId());

        DashboardResponse.UserStats userStats = new DashboardResponse.UserStats(
                user.getName(),
                user.getCurrentLevel(),
                user.getStreakDays(),
                user.getTotalXp(),
                completedLessons,
                user.getDailyGoalMinutes()
        );

        List<DashboardResponse.LevelProgress> levelProgress = Arrays.stream(CefrLevel.values())
                .map(level -> buildLevelProgress(level, user.getId()))
                .toList();

        CefrLevel currentLevel = CefrLevel.valueOf(user.getCurrentLevel());
        List<DashboardResponse.TopicStatus> topics = buildTopicStatus(currentLevel, user.getId());

        List<DashboardResponse.SkillProgress> skills = List.of(
                new DashboardResponse.SkillProgress("Reading", 0),
                new DashboardResponse.SkillProgress("Writing", 0),
                new DashboardResponse.SkillProgress("Listening", 0),
                new DashboardResponse.SkillProgress("Speaking", 0)
        );

        long reviewsDue = reviewItemRepository.countByUserIdAndDueDateLessThanEqual(
                user.getId(), LocalDateTime.now());

        return new DashboardResponse(userStats, levelProgress, topics, skills, (int) reviewsDue);
    }

    private DashboardResponse.LevelProgress buildLevelProgress(CefrLevel level, Long userId) {
        long total = lessonRepository.countPublishedByLevel(level);
        List<UserProgress> progress = progressRepository.findByUserIdAndLevel(userId, level);
        long completed = progress.stream().filter(UserProgress::getCompleted).count();
        int percent = total > 0 ? (int) ((completed * 100) / total) : 0;
        return new DashboardResponse.LevelProgress(level, level.getDisplayName(), total, completed, percent);
    }

    private List<DashboardResponse.TopicStatus> buildTopicStatus(CefrLevel level, Long userId) {
        List<com.learnenglish.model.Lesson> lessons = lessonRepository.findPublishedByLevel(level);
        Map<Long, UserProgress> progressMap = progressRepository
                .findByUserIdAndLevel(userId, level)
                .stream()
                .collect(Collectors.toMap(p -> p.getLesson().getId(), p -> p));

        boolean previousCompleted = true;
        java.util.List<DashboardResponse.TopicStatus> result = new java.util.ArrayList<>();

        for (int i = 0; i < lessons.size(); i++) {
            var lesson = lessons.get(i);
            UserProgress progress = progressMap.get(lesson.getId());
            boolean completed = progress != null && progress.getCompleted();
            boolean locked = i > 0 && !previousCompleted;
            Integer score = progress != null ? progress.getScore() : null;

            result.add(new DashboardResponse.TopicStatus(
                    lesson.getId(), lesson.getName(), lesson.getSlug(),
                    i + 1, completed, locked, score));
            previousCompleted = completed;
        }
        return result;
    }
}
