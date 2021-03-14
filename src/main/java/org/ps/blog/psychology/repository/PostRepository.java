package org.ps.blog.psychology.repository;

import org.ps.blog.psychology.model.Post;
import org.ps.blog.psychology.model.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {
    List<Post> findAllByOrderByIdDesc();
    List<Post> findAllByUserId(Long id);
}
