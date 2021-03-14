package org.ps.blog.psychology.service;

import org.ps.blog.psychology.model.Post;
import org.ps.blog.psychology.model.Quiz;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface PostService {

    Post findById(Long id);

    public List<Post> findAll();

    public Page<Post> findAll(Pageable pageable);

    Post save(Post post);

    void delete(Long id);

    public List<Post> findAllByOrderByIdDesc();

    public List<Post> findAllByUserId(Long id);
}
