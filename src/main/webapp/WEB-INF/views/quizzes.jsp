<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="Психологические тесты"/>
<c:set var="subtitle" value="Ещё один способ узнать себя чуточку лучше..."/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/18.jpg"/>

<%@include file="include/navigation.jsp" %>
<%@include file="include/header.jsp" %>


<%--FIXME переделать когда будут готовы тесты--%>
<!-- Main Content -->
<div class="container">

    <div class="col-lg-8 col-md-10 mx-auto" style="margin-bottom: 30px">
        <form action="<c:url value="/quizzes"/>">
            <div class="row justify-content-center">
                <div class="form-group floating-label-form-group controls col-lg-8 col-md-12">
                    <label for="search">Поиск</label>
                    <input id="search" name="search" type="text" required="required"
                           class="form-control" placeholder="Введите данные для поиска..."/>
                </div>
                <span>&nbsp;</span>
                <button type="submit" class="btn btn-light">
                    <i class="fas fa-search"></i>
                </button>
                <span>&nbsp;</span>
                <a class="btn btn-light" style="padding-top: 27px" href="<spring:url value="/quizzes"/>"><i class="fa fa-times" aria-hidden="true"></i></a>
            </div>
        </form>
    </div>

    <div class="row">

        <div class="col-lg-8 col-md-10 mx-auto">
            <c:forEach items="${quizzes}" var="t" varStatus="state">
                <c:if test="${not state.first}">
                <hr>
                </c:if>
                <div class="post-preview">
                    <a href="<spring:url value="/quizzes/${t.id}"/>">
                        <h2 class="post-title" style="font-size: 20pt">${t.title}</h2>
                    </a>
                    <p class="post-meta">Автор

                        <!-- FIXME href ссылка на психолога -->

                        <a href="<spring:url value="/psychologists/${t.user.getId()}"/>">${t.user.getFirstName()} ${t.user.getLastName()}</a>,
                        добавлено ${t.getCreatedDate()}</p>
                </div>

            </c:forEach>

            <%@include file="include/pagination.jsp" %>

        </div>
    </div>
</div>


<hr>

<%@include file="./include/footer.jsp" %>
