package org.ps.blog.psychology.repository;

import org.ps.blog.psychology.model.Post;
import org.ps.blog.psychology.model.Quiz;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizRepository extends JpaRepository<Quiz, Long> {
    List<Quiz> findAllByOrderByIdDesc();

//    @Query(value = "SELECT distinct q FROM Quiz q LEFT JOIN fetch q.user where q.id= :id")
//    Quiz findFullById(@Param("id")  Long id);

    @Query(value = "SELECT distinct q FROM Quiz q fetch all properties  where q.id= :id")
    Quiz findFetchAllPropertiesById(@Param("id")  Long id);

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

    @Query(value = "SELECT distinct q FROM Quiz q, Question qu, PossibleAnswer p, User u where " +
            "qu.quiz = q and p.question = qu and q.user = u and" +
            "(q.title like %?1% or q.body like %?1% " +
            "or qu.textQuestion  like %?1% " +
            "or p.textAnswer like %?1% " +
            "or u.username like %?1% or u.email like %?1% or u.lastName like %?1% or u.firstName like %?1%)")
    Page<Quiz> findSearchedQuizzes(String search, Pageable pageable);

}
