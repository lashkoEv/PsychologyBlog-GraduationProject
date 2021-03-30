package org.ps.blog.psychology.repository;

import org.ps.blog.psychology.model.Post;
import org.ps.blog.psychology.model.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizRepository extends JpaRepository<Quiz, Long> {
    List<Quiz> findAllByOrderByIdDesc();

//    @Query(value = "SELECT distinct q FROM Quiz q LEFT JOIN fetch q.user where q.id= :id")
//    Quiz findFullById(@Param("id")  Long id);

    @Query(value = "SELECT distinct q FROM Quiz q fetch all properties  where q.id= :id")
    Quiz findFetchAllProperiesById(@Param("id")  Long id);

    @Query(value = "SELECT distinct q FROM Quiz q LEFT JOIN fetch q.user " +
            "left join fetch q.questions " +
            "fetch all properties " +
            "where q.id= :id")
    Quiz findFullAndFetchAllProperiesById(@Param("id")  Long id);


    @Query(value = "SELECT distinct q FROM Quiz q LEFT JOIN fetch q.user " +
            "left join fetch q.questions " +
            "where q.id= :id")
    Quiz findFullById(@Param("id")  Long id);

    List<Quiz> findAllByUserId(Long id);

}
