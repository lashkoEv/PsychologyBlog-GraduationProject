package org.ps.blog.psychology.controller;

import lombok.extern.slf4j.Slf4j;
import org.ps.blog.psychology.model.Post;
import org.ps.blog.psychology.model.User;
import org.ps.blog.psychology.service.PostService;
import org.ps.blog.psychology.service.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@Slf4j
public class IndexController {

    private final UserService userService;

    private final PostService postService;

    //    @Autowired
    private PasswordEncoder passwordEncoder;

    public IndexController(UserService userService, PostService postService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.postService = postService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping(value = {"/", "/home", "/index"})
    public String home(Model model, Integer page, Integer size, @Param("search") String search) {
        log.info(" --- index");
        Pageable pageable = PageRequest.of(page == null ? 0 : page, size == null ? 5 : size, Sort.by("id").descending());
        Page<Post> postPage;
        if (search != null) {
            postPage = postService.findSearchedPosts(search, pageable);
        } else {
            postPage = postService.findAll(pageable);
        }
        model.addAttribute("posts", postPage.getContent());
        model.addAttribute("page", postPage);
        return "index";
    }

    @RequestMapping("/about")
    public String about(Map<String, Object> model) {
        log.info(" --- about");
        model.put("message", "You are in about page!!!");
        return "about";
    }

    @GetMapping("/login")
    public String login() {
        log.info(" --- login");
        return "login";
    }

    @GetMapping("/success")
    public String authorizationSuccess(RedirectAttributes redirectAttributes) {
        log.info(" --- index successfully authorized");
        redirectAttributes.addFlashAttribute("msg", "Successfully authorized!");
        return "redirect:/";
    }

    @GetMapping("/login/error")
    public String authorizationError(RedirectAttributes redirectAttributes) {
        log.info(" --- index authorisation error");
        redirectAttributes.addFlashAttribute("msgErr", "Authorisation Error!");
        return "redirect:/";
    }

    @GetMapping("/logout/success")
    public String logout(RedirectAttributes redirectAttributes) {
        log.info(" --- index logout");
        redirectAttributes.addFlashAttribute("msg", "Successfully logged out!");
        return "redirect:/";
    }
}
