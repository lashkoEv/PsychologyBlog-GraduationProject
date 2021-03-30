package org.ps.blog.psychology.service.impl;

import org.ps.blog.psychology.model.Post;
import org.ps.blog.psychology.model.Quiz;
import org.ps.blog.psychology.repository.QuizRepository;
import org.ps.blog.psychology.repository.UserRepository;
import org.ps.blog.psychology.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class QuizServiceImpl implements QuizService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private QuizRepository quizRepository;

    @Override
    @Transactional(readOnly = true)
    public Quiz findById(Long id) {
        return quizRepository.getOne(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Quiz findFetchAllProperiesById(Long id) {
        return quizRepository.findFetchAllProperiesById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Quiz findFullAndFetchAllProperiesById(Long id) {
        return quizRepository.findFullAndFetchAllProperiesById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Quiz findFullById(Long id) {
        return quizRepository.findFullById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Quiz> findAll() {
        return quizRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Quiz> findAll(Pageable pageable) {
        return quizRepository.findAll(pageable);
    }

    @Override
    public Quiz save(Quiz post) {
        return quizRepository.save(post);
    }

    @Override
    public void delete(Long id) {
        quizRepository.deleteById(id);
    }

    @Override
    public List<Quiz> findAllByOrderByIdDesc() {
        return quizRepository.findAllByOrderByIdDesc();
    }

    @Override
    public List<Quiz> findAllByUserId(Long id) {
        return quizRepository.findAllByUserId(id);
    }
}
