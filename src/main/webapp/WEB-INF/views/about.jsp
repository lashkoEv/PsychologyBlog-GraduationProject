<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="About us"/>
<c:set var="subtitle" value="This is what we do."/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/31.jpg"/>

<%@include file="./include/header.jsp" %>


<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <p>Цель блога - размещать все лучшее, что есть в современной психологии. Блог одновременно является неким
                дайджестом, подборкой самых интересных материалов разных психологов.</p>
            <p>В жизни каждого человека возникают сложные темы, в которых хочется разобраться. Взрослый это или ребенок,
                но у каждого есть основное желание - быть счастливым.</p>
        </div>
    </div>
</div>

<hr>

<%@include file="./include/footer.jsp" %>
