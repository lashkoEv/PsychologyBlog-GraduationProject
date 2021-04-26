package org.ps.blog.psychology.service;

import org.ps.blog.psychology.model.Quiz;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface QuizService {

    Quiz findById(Long id);

    @Transactional(readOnly = true)
    Quiz findFetchAllPropertiesById(Long id);

    @Transactional(readOnly = true)
    Quiz findFullAndFetchAllPropertiesById(Long id);

    @Transactional(readOnly = true)
    Quiz findFullById(Long id);

    public List<Quiz> findAll();

    public Page<Quiz> findAll(Pageable pageable);

    Quiz save(Quiz quiz);

    void delete(Long id);

    public List<Quiz> findAllByOrderByIdDesc();

    List<Quiz> findAllByUserId(Long id);

    public Page<Quiz> findSearchedQuizzes(String search, Pageable pageable);
}
