package com.learnenglish.repository;

import com.learnenglish.model.Level;
import com.learnenglish.model.enums.CefrLevel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface LevelRepository extends JpaRepository<Level, Long> {
    Optional<Level> findByCode(CefrLevel code);
}
