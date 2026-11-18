package com.learnenglish.dto.dashboard;

import com.learnenglish.model.enums.CefrLevel;

import java.util.List;
import java.util.Map;

public record DashboardResponse(
        UserStats userStats,
        List<LevelProgress> levelProgress,
        List<TopicStatus> currentLevelTopics,
        List<SkillProgress> skillProgress,
        int reviewsDue
) {
    public record UserStats(
            String name,
            String currentLevel,
            int streakDays,
            int totalXp,
            long completedLessons,
            int dailyGoalMinutes
    ) {}

    public record LevelProgress(
            CefrLevel code,
            String name,
            long totalLessons,
            long completedLessons,
            int progressPercent
    ) {}

    public record TopicStatus(
            Long lessonId,
            String name,
            String slug,
            int orderIndex,
            boolean completed,
            boolean locked,
            Integer score
    ) {}

    public record SkillProgress(
            String skill,
            int score
    ) {}
}
