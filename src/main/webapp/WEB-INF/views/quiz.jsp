<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="${quiz.title}"/>
<c:set var="subtitle" value="Автор: ${quiz.user.getFirstName()} ${quiz.user.getLastName()}"/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/32.jpg"/>

<!-- dev-->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/my.css"/>

<%@include file="include/navigation.jsp" %>
<%@include file="include/header.jsp" %>



<div class="container">
    <div class="col-lg-8 col-md-10 mx-auto my-div" id="quiz">
        <div class="row justify-content-center">
            <h3>ТЕСТ</h3>
        </div>
        <hr/>
        <div class="justify-content-md-center">
            <input type="text" required="required" class="form-control" placeholder="Название теста" v-model="quiz.title" disabled>
        </div>
        <br/>
        <textarea class="form-control" cols="62" rows="3" v-model="quiz.body" placeholder="Краткая информация о тесте" disabled></textarea>
        <br/>

        <ul id="question">
            <li v-for="(item, index) in quiz.questions" style="margin-bottom: 10px">
                <div class="row">
                    <div class="input-field col-md-8 s6">
                        <h5>{{ index+1 }}. {{ item.textQuestion }}</h5>
                    </div>
                </div>

                <ul id="answers">
                    <li style="list-style-type: none" v-for="(answer, index) in item.possibleAnswers">
                        <input v-bind:name="'question-' + item.id" v-bind:type="item.type != 'SINGLE' ? 'checkbox' : 'radio'" v-model="answer.checked" class="btn-primary">
                        <label class="post-title">{{answer.textAnswer}}</label>
                    </li>
                </ul>



            </li>
        </ul>
        <hr/>
        <div class="row justify-content-md-center">
            <button class="btn btn-primary" @click="checkQuiz">Ответ</button>
        </div>
        <div style="margin-top: 10px" class="row justify-content-md-center btn-outline-dark" v-if="showText">
            {{text}}
        </div>

        <sec:authorize access="hasAnyRole('ROLE_PSYCHOLOGIST', 'ROLE_ADMIN')">
            <hr/>
            <div class="row justify-content-md-center">
<%--                <a class="btn btn-primary" href="<spring:url value="/post/edit/${post.id}"/>">Update</a>--%>
                <a class="btn btn-primary" href="<spring:url value="/quizzes/delete/${quiz.id}"/>">Удалить</a>
            </div>
        </sec:authorize>
    </div>

</div>

<hr>

<%@include file="./include/footer.jsp" %>


<script>
    function Quiz() {
        return {
            id: null,
            user: null,
            user: {
                id: null,
                username: null,
                firstName: null,
                lastName: null,
                birthDate: null,
                email: null,
                enabled: 1
            },
            title: "title",
            body: "body body body body body",
            status: "OPENED",
            questions: [
                {
                    id: null,
                    textQuestion: "textQuestion",
                    position: 1,
                    possibleAnswers: [
                        {
                            id: null,
                            textAnswer: "textAnswer",
                            position: 1
                        }
                    ],
                    type: "SINGLE"
                }
            ],
            scales: [
                {
                    id: null,
                    min: 1,
                    max: 3,
                    textScale: "Отличный выбор"
                }
            ]
        }
    }

    new Vue({
        el: '#quiz',
        data: function () {
            return {
                menu: false,
                showText: false,
                text: "",
                quiz: new Quiz(),
                // title: "title test",
                id: 1
            }
        },
        created: function () {
            // `this` указывает на экземпляр vm


            this.id = window.location.pathname.substring(window.location.pathname.lastIndexOf('/') + 1);
            console.log('Значение id: ' + this.id);
            this.getData();
        },
        methods: {
            getData: function () {
                var vm = this;
                // Fetch our array of posts from an API
                //fetch(`${window.location.pathname}/api/v1/quiz/${vm.id}`)
                //fetch(`${window.location.protocol}://${window.location.host}:${window.location.port}/psychology_war_exploded/api/v1/quiz/${vm.id}`)
                fetch("/api/v1/quizzes/" + vm.id)
                    .then(function (response) {
                        return response.json();
                    })
                    .then(function (data) {
                        vm.quiz = data;
                        vm.quiz.questions.forEach(q => {
                            q.possibleAnswers.forEach(pa => {
                                pa.checked = false;
                            });
                        });
                        console.log(vm.quiz);

                    });
            },


            checkQuiz: function () {
                var vm = this;
                var countBall = 0;
                console.log(" --- check");
                this.quiz.questions.forEach(q => {
                    console.log(q.textQuestion);
                    q.possibleAnswers.forEach(pa => {
                        console.log(pa.checked);
                        if(pa.checked == null || pa.checked){
                            console.log(pa.position);
                            countBall = countBall + pa.position;
                            console.log(countBall)
                        }
                    });
                });
                console.log(countBall);
                this.quiz.scales.forEach(s => {
                   if(s.min <= countBall && countBall <= s.max){
                       this.text = s.textScale;
                       this.showText = true;
                   }
                });
            }
        }
    })


</script>
