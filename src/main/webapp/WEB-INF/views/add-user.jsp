<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="Let's welcome!"/>
<c:set var="subtitle" value="New faces - new ideas."/>
<c:set var="picture" value='${pageContext.request.contextPath}/img/28.jpg'/>


<%@include file="include/navigation.jsp" %>
<%@include file="include/header.jsp" %>


<!-- Main Content -->
<div class="container">
    <div class="row">

        <div class="col-lg-8 col-md-10 mx-auto">
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">
                    <strong>Error:</strong> ${errorMessage}
                </div>
            </c:if>
        </div>


        <div class="col-lg-8 col-md-10 mx-auto">
            <!-- Post Content -->

            <form:form method="POST" modelAttribute="user">

                <form:errors path="*" cssClass="alert alert-danger" element="div"/>


                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="username">Username</form:label>
                        <form:input id="username" path="username" name="username" type="text" required="required"
                                    class="form-control" placeholder="Username"/>

                        <form:errors path="username" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="password">Password</form:label>
                        <form:input id="password" path="password" name="password" type="text" required="required"
                                    class="form-control" placeholder="Password"/>
                        <form:errors path="password" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="firstName">First name</form:label>
                        <form:input id="firstName" path="firstName" name="firstName" type="text" required="required"
                                    class="form-control" placeholder="First name"/>
                        <form:errors path="firstName" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <form:label path="lastName">Last name</form:label>
                        <form:input id="lastName" path="lastName" name="lastName" type="text" required="required"
                                    class="form-control" placeholder="Last name"/>
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
                        <form:label path="birthDate">Birth date</form:label>
                        <form:input id="birthDate" path="birthDate" name="birthDate" type="text" required="required"
                                    class="datepicker" placeholder="Birth date"/>
                        <form:errors path="birthDate" cssClass="error"/>
                    </div>
                </div>

                <br/>
                <div class="row justify-content-center">
                    <button type="submit" class="btn btn-primary">SAVE NEW PSYCHOLOGIST
                        <i class="material-icons right" style="font-size: small">send</i>
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<hr>

<%@include file="./include/footer.jsp" %>