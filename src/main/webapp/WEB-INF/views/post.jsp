<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="${post.title}"/>
<c:set var="subtitle" value="Автор ${post.user.getFirstName()} ${post.user.getLastName()}, добавлено ${post.createdTs}"/>
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
    </div>
    <sec:authorize access="hasAnyRole('ROLE_PSYCHOLOGIST', 'ROLE_ADMIN')">
        <div class="row justify-content-md-center">
            <div class="align-content-lg-center">
                <a class="btn btn-primary" href="<spring:url value="/posts/edit/${post.id}"/>">Редактировать</a>

                <a class="btn btn-primary" href="<spring:url value="/posts/delete/${post.id}"/>">Удалить</a>
            </div>
        </div>
    </sec:authorize>

</div>
<div class="btn btn-light fixed-bottom to-up" style="margin: 30px 30px 30px 90%">Наверх</div>

<script>
    document.addEventListener('DOMContentLoaded', () => {

    let toTopBtn = document.querySelector('.to-up');

    window.onscroll = function () {
        if (window.pageYOffset > 580) {
            toTopBtn.style.display = 'block'
        } else {
            toTopBtn.style.display = 'none'
        }
    }

    // плавный скролл наверх
    toTopBtn.addEventListener('click', function () {
        window.scrollBy({
            top: -document.documentElement.scrollHeight,
            behavior: 'smooth'
        });
    });
});
</script>
<hr>

<%@include file="./include/footer.jsp" %>
