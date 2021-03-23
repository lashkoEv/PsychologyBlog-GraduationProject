<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<c:set var="title" value="Log in"/>
<c:set var="subtitle" value="Please enter username and password."/>
<c:set var="picture" value="${pageContext.request.contextPath}/img/37.jpg"/>

<%@include file="include/navigation.jsp" %>
<link href="<spring:url value="/css/login-page.css"/>" rel="stylesheet">

<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col-lg-8 col-md-10 mx-auto">--%>
<%--            <form method="POST" action="<spring:url value="/login"/>" novalidate>--%>
<%--                <div class="control-group">--%>
<%--                    <div class="form-group floating-label-form-group controls">--%>
<%--                        <label>Name</label>--%>
<%--                        <input type="text" class="form-control" placeholder="Username" id="username" required="required"--%>
<%--                               data-validation-required-message="Please enter your username." name="username"/>--%>
<%--                        &lt;%&ndash;                        <p class="help-block text-danger"></p>&ndash;%&gt;--%>
<%--                    </div>--%>
<%--                    <div class="form-group floating-label-form-group controls">--%>
<%--                        <label>Password</label>--%>
<%--                        <input type="password" class="form-control" placeholder="Password" id="password"--%>
<%--                               required="required" name="password"--%>
<%--                               data-validation-required-message="Please enter your password."/>--%>
<%--                        &lt;%&ndash;                        <p class="help-block text-danger"></p>&ndash;%&gt;--%>
<%--                    </div>--%>
<%--                    <br/>--%>
<%--                    <div class="row justify-content-center">--%>
<%--                        <button type="submit" class="btn btn-primary">LOGIN--%>
<%--                            <i class="material-icons right" style="font-size: small">send</i>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<hr>--%>




<%--<div class="container-fluid">--%>
<%--    <div class="row no-gutter">--%>
<%--        <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image" style="background-image: url('${picture}')"></div>--%>
<%--        <div class="col-md-8 col-lg-6">--%>
<%--            <div class="login d-flex align-items-center py-5">--%>
<%--                <div class="container card-body">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-md-9 col-lg-8 mx-auto">--%>
<%--                            <h3 class="login-heading mb-4 text-center">Welcome back!</h3>--%>
<%--                            <form method="POST" action="<spring:url value="/login"/>">--%>
<%--                                <div class="form-label-group">--%>
<%--                                    <input type="text" id="username" name="username" class="form-control" placeholder="Email address" required autofocus>--%>
<%--                                    <label for="username">Username</label>--%>
<%--                                </div>--%>

<%--                                <div class="form-label-group">--%>
<%--                                    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>--%>
<%--                                    <label for="inputPassword">Password</label>--%>
<%--                                </div>--%>

<%--                                <div class="custom-control custom-checkbox mb-3 ">--%>
<%--                                    <input type="checkbox" class="custom-control-input" id="customCheck1">--%>
<%--                                    <label class="custom-control-label" for="customCheck1">Remember password</label>--%>
<%--                                </div>--%>
<%--                                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Sign in</button>--%>
<%--                                <div class="text-center">--%>
<%--                                    <a class="small" href="#">Forgot password?</a></div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<hr/>--%>




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
