<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="Log in"/>
<c:set var="subtitle" value="Please enter username and password."/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/37.jpg"/>

<%@include file="include/navigation.jsp" %>
<link href="<spring:url value="/css/login-page.css"/>" rel="stylesheet">

<div class="container-fluid">
    <br/>
    <div class="row">
        <div class="col-lg-10 col-xl-9 mx-auto">
            <div class="card card-signin flex-row my-5">
                <div class="card-img-left d-none d-md-flex" style="background: url('${picture}')">
                </div>
                <div class="card-body">
                    <br/><br/><br/>
                    <h5 class="card-title text-center font-weight-bold">LOG IN</h5>
                    <br/>
                    <form class="form-signin" method="POST" action="<spring:url value="/login"/>">
                        <div class="form-label-group">
                            <input type="text" id="inputUserame" name="username" class="form-control" placeholder="Username" required autofocus>
                            <label for="inputUserame">Username</label>
                        </div>

<%--                        <div class="form-label-group">--%>
<%--                            <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required>--%>
<%--                            <label for="inputEmail">Email address</label>--%>
<%--                        </div>--%>

<%--                        <hr>--%>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
                            <label for="inputPassword">Password</label>
                        </div>
<%--                        <div class="form-label-group">--%>
<%--                            <input type="password" id="inputConfirmPassword" class="form-control" placeholder="Password" required>--%>
<%--                            <label for="inputConfirmPassword">Confirm password</label>--%>
<%--                        </div>--%>

                        <div class="form-check">
                            <input type="checkbox" class="custom-checkbox" id="remember-me" name="remember-me">
                            <label class="form-check-label" for="remember-me">Remember password</label>
                        </div>


                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
<%--                        <a class="d-block text-center mt-2 small" href="#">Sign In</a>--%>
<%--                        <hr class="my-4">--%>
<%--                        <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>--%>
<%--                        <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>--%>

                        <br/><br/><br/><br/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<hr/>

<%@include file="./include/footer.jsp" %>
