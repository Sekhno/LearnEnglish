package com.learnenglish.repository;

import com.learnenglish.model.ReviewItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface ReviewItemRepository extends JpaRepository<ReviewItem, Long> {

    @Query("SELECT r FROM ReviewItem r WHERE r.user.id = :userId AND r.dueDate <= :now ORDER BY r.dueDate ASC")
    List<ReviewItem> findDueByUserId(@Param("userId") Long userId, @Param("now") LocalDateTime now);

    long countByUserIdAndDueDateLessThanEqual(Long userId, LocalDateTime now);
}
