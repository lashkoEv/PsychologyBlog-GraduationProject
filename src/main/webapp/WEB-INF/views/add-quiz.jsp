<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="Let's write a good quiz!"/>
<c:set var="subtitle" value="Just write it."/>
<c:set var="picture" value='${pageContext.request.contextPath}/img/29.jpg'/>

<!-- dev-->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/my.css"/>

<%@include file="include/navigation.jsp" %>
<%@include file="include/header.jsp" %>


<div class="container">

    <div class="col-lg-8 col-md-10 mx-auto">
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                <strong>Error:</strong> ${errorMessage}
            </div>
        </c:if>
    </div>

    <div class="col-lg-8 col-md-10 mx-auto my-div" id="quiz">
        <div class="row justify-content-center">
            <h3>TEST</h3>
        </div>
        <hr/>
        <div class="justify-content-md-center">
            <input type="text" required="required" class="form-control" placeholder="Title" v-model="quiz.title">
        </div>
        <br/>
        <textarea class="form-control" cols="62" rows="3" v-model="quiz.body" placeholder="Subtitle"></textarea>
        <br/>

        <ul id="question">
            <li v-for="(item, index) in quiz.questions" style="margin-bottom: 10px">
                <div class="row">
                    <div class="input-field col-md-8 s6">
                        <h5>{{ index+1 }}. {{ item.textQuestion }}
                            <button class="btn btn-sm btn-dark" style="margin-left: 3px; padding: 3px 6px 3px 6px"
                                    @click="quiz.questions.splice(index, 1)"> ×
                            </button>
                        </h5>
                    </div>
                    <div class="input-field col s4">
                        <label>Type:</label>
                        <select v-model="item.type" style="width: 68%; font-size: medium">
                            <option disabled value="">Type of question:</option>
                            <option>SINGLE</option>
                            <option>MULTIPLE</option>
                        </select>
                    </div>
                </div>

                <div class="col-form-label col-md-auto">
                    <label>Question:</label>
                    <input type="text" class="form-control" required="required" v-model="item.textQuestion">
                </div>

                <ul id="possible-answers">
                    <li v-for="(answer, index) in item.possibleAnswers">
                        <h6>{{ index+1 }}. {{ answer.textAnswer}}
                            <button class="btn btn-sm btn-dark" style="margin-left: 3px; padding: 3px 6px 3px 6px"
                                    @click="item.possibleAnswers.splice(index, 1)"> ×
                            </button>
                        </h6>

                        <div class="col-form-label col-md-auto">
                            <label>Possible answer:</label>
                            <input type="text" class="form-control" required="required" v-model="answer.textAnswer"
                                   data-validation-required-message="Р Р°Р·РјРµСЂ РЅРµ РґРѕР»Р¶РµРЅ Р±С‹С‚СЊ РјРµРЅСЊС€Рµ 5 СЃРёРјРІРѕР»РѕРІ!">
                            <label style="margin-top: 5px">Weight:</label>
                            <input type="number" class="form-control" required="required" v-model="answer.position"
                                   data-validation-required-message="Р Р°Р·РјРµСЂ РЅРµ РґРѕР»Р¶РµРЅ Р±С‹С‚СЊ РјРµРЅСЊС€Рµ 5 СЃРёРјРІРѕР»РѕРІ!">
                        </div>
                    </li>
                </ul>
                <button style="margin-left: 55px" class="btn btn-primary"
                        v-on:click="addPossibleAnswers(item)">
                    Add possible answer
                </button>

            </li>
        </ul>
        <div class="row justify-content-center">
            <button class="btn btn-primary" @click="addQuestion">Add question</button>
        </div>
        <hr/>
        <div class="row justify-content-center">
            <h3>SCALES</h3>
        </div>
        <hr/>
        <ul>
            <li v-for="(scale, index) in quiz.scales">
                <div class="row">
                    <div class="input-field col-md-12 s6">
                        <h5>{{ index+1 }}. {{ scale.textScale}}
                            <button class="btn btn-sm btn-dark" style="margin-left: 3px; padding: 3px 6px 3px 6px"
                                    @click="quiz.scales.splice(index, 1)">×
                            </button>
                        </h5>
                    </div>
                    <div class="col-form-label col-md-12">
                        <label>Scale description</label>
                        <input type="text" class="form-control" required="required" v-model="scale.textScale">
                    </div>
                    <div class="col-form-label col-md-6">
                        <label>Lower bound</label>
                        <input type="number" class="form-control" required="required" v-model="scale.min">
                    </div>
                    <div class="col-form-label col-md-6">
                        <label>Upper bound</label>
                        <input type="number" class="form-control" required="required" v-model="scale.max">
                    </div>
                </div>
            </li>
        </ul>
        <div class="row justify-content-center">
            <button class="btn btn-primary" v-on:click="addScale">Add scale
            </button>
        </div>
        <hr/>
        <div class="row justify-content-md-center">
            <button class="btn btn-primary" @click="saveQuiz">Save test</button>
        </div>


    </div>

</div>


<hr>

<%@include file="./include/footer.jsp" %>


<script>

    function Scale() {
        return {
            id: null,
            min: 1,
            max: 3,
            textScale: ""
        }
    }


    function PossibleAnswer() {
        return {
            id: null,
            textAnswer: "",
            position: 1
        }
    }


    function Question() {
        return {
            id: null,
            textQuestion: "",
            position: 1,
            possibleAnswers: [
                {
                    id: null,
                    textAnswer: "",
                    position: 1
                }
            ],
            type: "SINGLE"
        }

    }

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
            title: "",
            body: "",
            status: "OPENED",
            questions: [
                {
                    id: null,
                    textQuestion: "",
                    position: 1,
                    possibleAnswers: [
                        {
                            id: null,
                            textAnswer: "",
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
                    textScale: ""
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
                quiz: new Quiz(),
                // title: "title test",
                id: 1
            }
        },
        created: function () {
            // `this` указывает на экземпляр vm
            console.log('Значение i: ' + this.i);
            // this.getData();
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
                        console.log(vm.quiz);

                    });
            },

            addScale: function () {
                var vm = this;
                var scale = new Scale();
                vm.quiz.scales.push(scale);
            },

            addQuestion: function () {
                var vm = this;
                var question = new Question();
                var positionMax = vm.quiz.questions.map(q => q.position);
                positionMax = Math.max.apply(Math, positionMax);
                question.position = positionMax + 1;
                vm.quiz.questions.push(question);
            },

            addPossibleAnswers: function (item) {
                var possibleAnswer = new PossibleAnswer()
              //  var positionMax = item.possibleAnswers.map(q => q.position);
              //  positionMax = Math.max.apply(Math, positionMax);
             //   possibleAnswer.position = positionMax + 1;
                item.possibleAnswers.push(possibleAnswer);
                console.log(item);
            },

            saveQuiz: async function () {
                var vm = this;
                // Fetch our array of posts from an API
                // fetch(`${window.location.pathname}/api/v1/quiz/${vm.id}`)
                //var url = window.location.protocol + "//" + window.location.host + "/psychology_war_exploded/api/v1/quiz";
                // var url = window.location.protocol + "//" + window.location.host + "/api/v1/quiz";
                var url = "/api/v1/quizzes";
                var data = this.quiz;
                console.log(url);

                try {
                    const response = await
                        fetch(url, {
                            method: 'POST', // или 'PUT'
                            body: JSON.stringify(data), // данные могут быть 'строкой' или {объектом}!
                            headers: {
                                'Content-Type': 'application/json'
                            }
                        });
                    const json = await
                        response.json();
                    console.log('Успех:', JSON.stringify(json));
                    window.location.href = "/quizzes";
                } catch (error) {
                    console.error('Ошибка:', error);
                }
            },

        }
    })

</script>
