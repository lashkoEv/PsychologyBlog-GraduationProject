package org.ps.blog.psychology.model;

import com.fasterxml.jackson.annotation.*;
import com.sun.istack.NotNull;
import lombok.*;
import org.aspectj.weaver.patterns.TypePatternQuestions;
import org.ps.blog.psychology.model.enums.QuizStatus;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "quizzes")
@JsonIgnoreProperties(ignoreUnknown=true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @NotBlank
    @Size(min=5)
    @NotNull
    private String title;

    @NotBlank
    @Size(min=10)
    @NotNull
    private String body;

    @Enumerated(EnumType.STRING)
    private QuizStatus status;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "quiz", orphanRemoval=true)
    @JsonManagedReference
    private List<Question> questions;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "quiz", orphanRemoval=true)
    @JsonManagedReference
    private List<Scale> scales;

//    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate createdTs;

//    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate modifiedTs;

    @PrePersist
    public void toCreate() {
        setCreatedTs(LocalDate.now());
    }

    @PreUpdate
    public void toUpdate() {
        setModifiedTs(LocalDate.now());
    }

    public String getCreatedDate(){
        int year = createdTs.getYear();
        int month = createdTs.getMonthValue();
        int dayOfMonth = createdTs.getDayOfMonth();
        StringBuilder stringBuilder = new StringBuilder();
        if(dayOfMonth < 10) {
            stringBuilder.append("0");
        }
        stringBuilder.append(dayOfMonth);
        if(month < 10){
            stringBuilder.append(".0");
        }
        stringBuilder.append(month);
        stringBuilder.append(".");
        stringBuilder.append(year);
        return stringBuilder.toString();
    }
}
