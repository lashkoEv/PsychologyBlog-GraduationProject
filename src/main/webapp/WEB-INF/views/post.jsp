<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="${post.title}"/>
<c:set var="subtitle" value="Posted by ${post.user.getFirstName()} ${post.user.getLastName()} on ${post.createdTs}"/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/22.jpg"/>

<%@include file="include/navigation.jsp" %>
<%@include file="include/header.jsp" %>



<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <!-- Post Content -->
            <p>${post.body}</p>
        </div>

        <sec:authorize access="hasAnyRole('ROLE_PSYCHOLOGIST', 'ROLE_ADMIN')">
            <div class="col-lg-8 col-md-10 mx-auto">
                <a class="btn btn-primary" href="<spring:url value="/posts/edit/${post.id}"/>">Update</a>
                <a class="btn btn-primary" href="<spring:url value="/posts/delete/${post.id}"/>">Delete</a>
            </div>
        </sec:authorize>
    </div>
</div>

<hr>

<%@include file="./include/footer.jsp" %>
