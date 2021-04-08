<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="Psychology Quizzes"/>
<c:set var="subtitle" value="More about you."/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/18.jpg"/>

<%@include file="include/navigation.jsp" %>
<%@include file="include/header.jsp" %>


<%--FIXME переделать когда будут готовы тесты--%>
<!-- Main Content -->
<div class="container">

    <div class="col-lg-8 col-md-10 mx-auto">
        <form action="<c:url value="/quizzes"/>">
            <div class="row">
                <div class="form-group floating-label-form-group controls col-md-8">
                    <label for="search">Search</label>
                    <input id="search" name="search" type="text" required="required"
                           class="form-control" placeholder="Search"/>
                </div>
                <span>&nbsp;</span>
                <button type="submit" class="btn btn-light">SEARCH
                    <i class="fas fa-search"></i>
                </button>
                <span>&nbsp;</span>
                <a class="btn btn-light" style="padding-top: 27px" href="<spring:url value="/"/>">CLEAR</a>

            </div>

        </form>
    </div>

    <div class="row">

        <div class="col-lg-8 col-md-10 mx-auto">
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

            <%@include file="include/pagination.jsp" %>

        </div>
    </div>
</div>


<hr>

<%@include file="./include/footer.jsp" %>
