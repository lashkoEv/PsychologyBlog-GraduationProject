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
            <c:if test="${not empty msgErr}">
                <div class="alert alert-danger">
                    <strong>Message:</strong> ${msgErr}
                </div>
            </c:if>
        </div>

        <div class="col-lg-8 col-md-10 mx-auto">

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

            <div class="row justify-content-md-center">
                <c:if test="${page.totalPages > 1}">
                    <div class="row">
                        <ul class="pagination pagination-sm pagination-lg pagination-control">
                            <c:choose>
                                <c:when test="${page.hasPrevious()}">
                                    <li style="margin-right: 20px; padding: 10px" class="waves-effect">
                                        <a href="${url}?page=${page.number-1}&size=${page.size}">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li style="margin-right: 20px; padding: 10px" class="disabled">
                                        <a href="#!"><i class="material-icons">chevron_left</i></a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <c:forEach var="i" begin="1" end="${page.totalPages}">
                                <c:choose>
                                    <c:when test="${page.number + 1 == i}">
                                        <li style="margin-right: 20px; padding: 10px" class="active btn-light"><a
                                                href="${url}?page=${i-1}&size=${page.size}">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li style="margin-right: 20px; padding: 10px" class="waves-effect"><a
                                                href="${url}?page=${i-1}&size=${page.size}">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${page.hasNext()}">
                                    <li style="margin-right: 20px; padding: 10px" class="waves-effect">
                                        <a href="${url}?page=${page.number+1}&size=${page.size}">
                                            <i class="material-icons">chevron_right</i>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li style="margin-right: 20px; padding: 10px" class="disabled"><a href="#!">
                                        <i class="material-icons">chevron_right</i></a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>


<hr>

<%@include file="./include/footer.jsp" %>
