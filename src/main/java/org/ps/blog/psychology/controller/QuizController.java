package org.ps.blog.psychology.controller;

import lombok.extern.slf4j.Slf4j;
import org.ps.blog.psychology.model.Quiz;
import org.ps.blog.psychology.model.User;
import org.ps.blog.psychology.service.QuizService;
import org.ps.blog.psychology.service.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.PostConstruct;
import javax.annotation.security.RolesAllowed;

@Controller
@Slf4j
@RequestMapping("/quizzes")
public class QuizController {

    private final UserService userService;

    private final QuizService quizService;

    public QuizController(UserService userService, QuizService quizService) {
        this.userService = userService;
        this.quizService = quizService;
    }

    @PostConstruct
    public void init() {
        log.info(" --- init {}", this.getClass().getName());
    }

    @ModelAttribute(name = "quiz")
    public Quiz getQuiz() {
        org.springframework.security.core.userdetails.User u = null;
        Quiz quiz = new Quiz();
        try {
            u = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            quiz.setUser(userService.findByUsername(u.getUsername()));
        } catch (Exception e) {
            log.error(" --- Error:", e);
        }
        return quiz;
    }

    @RequestMapping(method = RequestMethod.GET, path = "")
    public String index(Model model, Integer page, Integer size) {
        log.info(" --- index quiz");
        Pageable pageable = PageRequest.of(page == null ? 0 : page, size == null ? 5 : size, Sort.by("id").descending());
        Page<Quiz> quizPage = quizService.findAll(pageable);
        model.addAttribute("quizzes", quizPage.getContent());
        model.addAttribute("page", quizPage);
        return "quizzes";
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public String quiz(Model model, @PathVariable Long id) {
        log.info(" --- quiz " + id);
        Quiz quiz = quizService.findFullById(id);

        if (quiz != null) {
            model.addAttribute("quiz", quiz);
        }
        return "quiz";
    }

    @RolesAllowed({"ROLE_PSYCHOLOGIST", "ROLE_ADMIN"})
    @RequestMapping(path = "/create", method = RequestMethod.GET)
    public String create(Model model) {
        log.info(" --- create quiz (get)");
        Quiz quiz = new Quiz();
            model.addAttribute("quiz", quiz);
        return "add-quiz";
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.POST)
    public String quiz(Model model, @ModelAttribute Quiz quiz) {
        log.info(" --- quiz " + quiz);
        return "quizzes";
    }

    @RolesAllowed({"ROLE_PSYCHOLOGIST", "ROLE_ADMIN"})
    @RequestMapping(path = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        log.info(" --- delete test (test)");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        org.springframework.security.core.userdetails.User u = null;
        try {
            u = (org.springframework.security.core.userdetails.User) auth.getPrincipal();
            User user = userService.findByUsername(u.getUsername());
            User author = userService.findByUsername(quizService.findById(id).getUser().getUsername());
            if (user.equals(author) || u.getAuthorities().toString().contains("ROLE_ADMIN")) {
                quizService.delete(id);
                log.info(" --- deleted test id {}", id);
                redirectAttributes.addFlashAttribute("msg", "Successfully deleted");
            }
        } catch (AuthenticationException e) {
            log.error(" --- Error ", e.getLocalizedMessage());
        }
        model.addAttribute("posts", quizService.findAll());
        return "redirect:/";
    }
}
