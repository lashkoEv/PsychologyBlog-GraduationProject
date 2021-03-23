<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="secure" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${title}</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="<spring:url value="/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="<spring:url value="/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">--%>

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="<spring:url value="/css/clean-blog.min.css"/>" rel="stylesheet">
    <link href="<spring:url value="/css/error.css"/>" rel="stylesheet">

</head>

<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="<spring:url value="/"/>">S ubconscious game S</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<spring:url value="/"/>">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<spring:url value="/quiz"/>">Tests</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<spring:url value="/psychologist"/>">Psychologists</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<spring:url value="/about"/>">About</a>
                </li>
                <sec:authorize access="hasAnyRole('ROLE_PSYCHOLOGIST', 'ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="<spring:url value="/post/create"/>">Add post</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_PSYCHOLOGIST', 'ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="<spring:url value="/quiz/create"/>">Add test</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="<spring:url value="/psychologist/create"/>">Register</a>
                    </li>
                </sec:authorize>
                <li class="nav-item">
                    <sec:authorize access="isAnonymous()">
                        <a class="nav-link" href="<spring:url value="/login"/>">Login</a>
                    </sec:authorize>
                    <sec:authorize access="!isAnonymous()">
                        <a class="nav-link"
                           href="<spring:url value="/logout"/>">Logout '${pageContext.request.userPrincipal.name}' </a>
                    </sec:authorize>
                </li>
            </ul>

        </div>
    </div>
</nav>

