package org.ps.blog.psychology.service;

import org.ps.blog.psychology.model.Quiz;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface QuizService {

    Quiz findById(Long id);

    @Transactional(readOnly = true)
    Quiz findFetchAllProperiesById(Long id);

    @Transactional(readOnly = true)
    Quiz findFullAndFetchAllProperiesById(Long id);

    @Transactional(readOnly = true)
    Quiz findFullById(Long id);

    public List<Quiz> findAll();

    public Page<Quiz> findAll(Pageable pageable);

    Quiz save(Quiz quiz);

    void delete(Long id);

    public List<Quiz> findAllByOrderByIdDesc();

    List<Quiz> findAllByUserId(Long id);

}
