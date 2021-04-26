package org.ps.blog.psychology.controller;

import lombok.extern.slf4j.Slf4j;
import org.ps.blog.psychology.model.Quiz;
import org.ps.blog.psychology.service.QuizService;
import org.ps.blog.psychology.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.PostConstruct;
import java.util.List;

@RestController
@RequestMapping(value = "/api/v1/quizzes")
@Slf4j
public class RestQuizController {

    @Autowired
    private UserService userService;

    @Autowired
    private QuizService quizService;

    @PostConstruct
    public void init() {
        log.info(" --- init {}", this.getClass().getName());
    }

    @RequestMapping(method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    public List<Quiz> getAll() {
        return quizService.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getById(@PathVariable Long id) {
//        Quiz quiz = quizService.findFullById(id);
        Quiz quiz = quizService.findFullAndFetchAllPropertiesById(id);
        return ResponseEntity.ok(quiz);
    }

    @RequestMapping(method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getById(@RequestBody Quiz quiz) {
//        Quiz quiz = quizService.findFullById(id);
//        Quiz quiz = quizService.findFullAndFetchAllProperiesById(id);
//        quiz.getQuestions().forEach(question -> {
//            log.info(" --- -- question  text '{}'", question.getTextQuestion());
//            question.getPossibleAnswers().forEach(possibleAnswer -> {
//                log.info(" --- -- -- possible answer  text '{}'", possibleAnswer.getTextAnswer());
//            });
//        });
        log.info(quiz.toString());
        org.springframework.security.core.userdetails.User u = null;
        try {
            u = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            quiz.setUser(userService.findByUsername(u.getUsername()));
//            quiz.setUser(userService.findByUsername("user0"));
            quiz = quizService.save(quiz);
        } catch (Exception e) {
            log.error(" --- Error:", e);
            return ResponseEntity.badRequest().body(e.getMessage());
        }
        return ResponseEntity.ok(quiz);
}


}
