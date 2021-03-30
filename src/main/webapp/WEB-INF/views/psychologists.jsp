<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="Psychologists"/>
<c:set var="subtitle" value="Have questions? We have answers."/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/11.jpg"/>

<%@include file="include/navigation.jsp" %>
<%@include file="include/header.jsp" %>

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
            <c:forEach items="${users}" var="u">
                <div class="post-preview">
                    <a href="<spring:url value="/psychologists/${u.id}"/>">
                        <h2 class="post-title">${u.getFirstName()} ${u.getLastName()}</h2>
                    </a>
                </div>
                <hr>
            </c:forEach>

            <%@include file="include/pagination.jsp" %>

        </div>
    </div>
</div>

<hr>

<%@include file="./include/footer.jsp" %>