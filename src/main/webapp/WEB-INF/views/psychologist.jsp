<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="${user.getFirstName()} ${user.getLastName()}"/>
<c:set var="subtitle" value="Born ${user.getBirthDate()} Email: ${user.getEmail()}"/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/19.jpg"/>

<%@include file="include/navigation.jsp" %>
<%@include file="include/header.jsp" %>


<!-- FIXME добавить пагинацию -->

<div class="container">
    <div class="row">

        <div class="col-md-6">
            <div class="row justify-content-md-center">
                <h1 style="color: #0085A1">POSTS</h1>
            </div>
            <hr/>
            <c:forEach items="${posts}" var="p">
                <div class="post-preview">
                    <a href="<spring:url value="/posts/${p.id}"/>">
                        <h2 class="post-title">${p.title}</h2>
                    </a>
                    <p class="post-meta">Posted by

                        <!-- FIXME href ссылка на психолога -->

                        <a href="<spring:url value="/psychologists/${p.user.getId()}"/>">${p.user.getFirstName()} ${p.user.getLastName()}</a>
                        on ${p.createdTs}</p>
                </div>
                <hr>
            </c:forEach>
        </div>
        <%--    </div>--%>
        <hr/>
        <%--    <div class="row">--%>
        <div class="col-md-6">
            <div class="row justify-content-md-center">
                <h1 style="color: #0085A1">QUIZZES</h1>
            </div>
            <hr/>

            <%--   FIXME добавить отображение тестов --%>
            <c:forEach items="${quizzes}" var="t">
                <div class="post-preview">
                    <a href="<spring:url value="/quizzes/${t.id}"/>">
                        <h2 class="post-title">${t.title}</h2>
                    </a>
                    <p class="post-meta">Posted by

                        <!-- FIXME href ссылка на психолога -->

                        <a href="<spring:url value="/psychologists/${t.user.getId()}"/>">${t.user.getFirstName()} ${t.user.getLastName()}</a>
                        on ${t.createdTs}</p>
                </div>
                <hr>
            </c:forEach>
        </div>
    </div>


    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
    <hr>
    <div class="col-lg-8 col-md-10 mx-auto justify-content-center">

            <%--        FIXME переделать на кнопки --%>

        <a class="btn btn-primary" href="<spring:url value="/psychologists/edit/${user.id}"/>">Update</a>
        <a class="btn btn-primary" href="<spring:url value="/psychologists/delete/${user.id}"/>">Delete</a>
    </div>
    </sec:authorize>
    <hr>

    <%@include file="./include/footer.jsp" %>
