package org.ps.blog.psychology.controller;

import lombok.extern.slf4j.Slf4j;
import org.ps.blog.psychology.model.Authority;
import org.ps.blog.psychology.model.Post;
import org.ps.blog.psychology.model.User;
import org.ps.blog.psychology.service.PostService;
import org.ps.blog.psychology.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.PostConstruct;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

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

//    @PostConstruct
//    private void init(){
//        log.info(" --- IndexController init");
//        User user = new User();
//        user.setUsername("addusertest");
//        user.setPassword(passwordEncoder.encode("pass"));
//        Set<Authority> authoritySet = new HashSet<>();
//        Authority authority = new Authority();
//        authority.setAuthority("ROLE_USER");
//        authority.setUser(user);
//        authoritySet.add(authority);
//        user.setAuthorities(authoritySet);
//        userService.save(user);
//    }

    @RequestMapping(value = {"/", "/home", "/index"})
    public String home(Model model,  Integer page, Integer size) {
        log.info(" --- index");
      //  Pageable pageable = PageRequest.of(page == null ? 0 : page, size == null ? 5 : size);
        Pageable pageable = PageRequest.of(page == null ? 0 : page, size == null ? 5 : size, Sort.by("id").descending());
        Page<Post> postPage = postService.findAll(pageable);
        model.addAttribute("posts", postPage.getContent());
        model.addAttribute("page", postPage);
        return "index";
    }

    @RequestMapping("/about")
    public String about(Map<String, Object> model) {
        log.info(" --- about");
        model.put("message", "You are in new page !!");
        return "about";
    }
}
