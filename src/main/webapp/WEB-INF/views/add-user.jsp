<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="Добро пожаловать!"/>
<c:set var="subtitle" value="Новые лица - новые идеи..."/>
<c:set var="picture" value='${pageContext.request.contextPath}/img/28.jpg'/>


<%@include file="include/navigation.jsp" %>
<%@include file="include/header.jsp" %>


<!-- Main Content -->
<div class="container">
    <div class="row">

        <div class="col-lg-8 col-md-10 mx-auto">
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">
                    <strong>Ошибка:</strong> ${errorMessage}
                </div>
            </c:if>
        </div>


        <div class="col-lg-8 col-md-10 mx-auto">
            <!-- Post Content -->

            <form:form method="POST" modelAttribute="user">

                <form:errors path="*" cssClass="alert alert-danger" element="div"/>


                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="username">Логин</form:label>
                        <form:input id="username" path="username" name="username" type="text" required="required"
                                    class="form-control" placeholder="Логин"/>

                        <form:errors path="username" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="password">Пароль</form:label>
                        <form:input id="password" path="password" name="password" type="password" required="required"
                                    class="form-control" placeholder="Пароль"/>
                        <form:errors path="password" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="firstName">Имя</form:label>
                        <form:input id="firstName" path="firstName" name="firstName" type="text" required="required"
                                    class="form-control" placeholder="Имя"/>
                        <form:errors path="firstName" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="lastName">Фамилия</form:label>
                        <form:input id="lastName" path="lastName" name="lastName" type="text" required="required"
                                    class="form-control" placeholder="Фамилия"/>
                        <form:errors path="lastName" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="email">Email</form:label>
                        <form:input id="email" path="email" name="email" type="text" required="required"
                                    class="form-control"
                                    placeholder="Email"/>
                        <form:errors path="email" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="birthDate">Дата рождения</form:label>
                        <form:input id="birthDate" path="birthDate" name="birthDate" type="text" required="required"
                                    class="datepicker" placeholder="Дата рождения"/>
                        <form:errors path="birthDate" cssClass="error"/>
                    </div>
                </div>

                <br/>
                <div class="row justify-content-center">
                    <button type="submit" class="btn btn-primary">Сохранить
                        <i class="material-icons right" style="font-size: small">send</i>
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<hr>

<%@include file="./include/footer.jsp" %>