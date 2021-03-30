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
    <div class="row">

        <div class="col-lg-8 col-md-10 mx-auto">
            <c:if test="${not empty msg}">
                <div class="alert alert-success">
                    <strong>Message:</strong> ${msg}
                </div>
            </c:if>
        </div>

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
