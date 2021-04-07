<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="Psychology Blog"/>
<c:set var="subtitle" value="Some interesting things."/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/14.jpg"/>

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
            <form action="<c:url value="/"/>">
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

        <div class="col-lg-8 col-md-10 mx-auto">
            <c:if test="${not empty msgErr}">
                <div class="alert alert-danger">
                    <strong>Message:</strong> ${msgErr}
                </div>
            </c:if>
        </div>

        <div class="col-lg-8 col-md-10 mx-auto">

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

            <%@include file="include/pagination.jsp" %>

        </div>
    </div>
</div>


<hr>

<%@include file="./include/footer.jsp" %>