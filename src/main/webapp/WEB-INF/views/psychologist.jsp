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
                    <a href="<spring:url value="/post/${p.id}"/>">
                        <h2 class="post-title">${p.title}</h2>
                    </a>
                    <p class="post-meta">Posted by

                        <!-- FIXME href ссылка на психолога -->

                        <a href="<spring:url value="/psychologist/${p.user.getId()}"/>">${p.user.getFirstName()} ${p.user.getLastName()}</a>
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
                <h1 style="color: #0085A1">TESTS</h1>
            </div>
            <hr/>

            <%--   FIXME добавить отображение тестов --%>

        </div>
    </div>

    <hr>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
    <div class="col-lg-8 col-md-10 mx-auto justify-content-center">

            <%--        FIXME переделать на кнопки --%>

        <a class="btn btn-primary" href="<spring:url value="/psychologist/edit/${user.id}"/>">Update</a>
        <a class="btn btn-primary" href="<spring:url value="/psychologist/delete/${user.id}"/>">Delete</a>
    </div>
    </sec:authorize>
    <hr>

    <%@include file="./include/footer.jsp" %>
