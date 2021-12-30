<%-- 
    Document   : edit-room
    Created on : Oct 27, 2021, 11:08:54 PM
    Author     : KT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources-management/css/form.css" />" type="text/css" rel="stylesheet" />
        <title>Guest Info</title>
        <jsp:include page="../include/admin/css-page.jsp"/>

    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">
            <jsp:include page="../include/admin/menu.jsp"/>
            <!-- start page container -->
            <div class="page-container">
                <jsp:include page="../include/admin/sidebar.jsp"/>  
                <!-- start page content -->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <div class="page-title">Guest</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="#">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="#">Guest</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">Guest Info</li>
                                </ol>
                            </div>
                        </div>
                        <mvc:form action="${pageContext.request.contextPath}/admin/result-more-guest" method="post" id="form-guest"
                                  modelAttribute="guest" >
                            <c:if test="${action == 'edit'}">
                                <input type="text" class="form-control" name="id"
                                       value="${guest.id}" hidden>
                            </c:if>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-box">
                                        <div class="card-head">
                                            <c:if test="${action == 'add'}">
                                                <header>Add Guest</header>
                                            </c:if>
                                            <c:if test="${action == 'edit'}">
                                                <header>Update Guest</header>
                                            </c:if> 
                                            <button id = "panel-button" 
                                                    class = "mdl-button mdl-js-button mdl-button--icon pull-right" 
                                                    data-upgraded = ",MaterialButton">
                                                <i class = "material-icons">more_vert</i>
                                            </button>
                                            <ul class = "mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                                data-mdl-for = "panel-button">
                                                <li class = "mdl-menu__item"><i class="material-icons">assistant_photo</i>Action</li>
                                                <li class = "mdl-menu__item"><i class="material-icons">print</i>Another action</li>
                                                <li class = "mdl-menu__item"><i class="material-icons">favorite</i>Something else here</li>
                                            </ul>
                                        </div>


                                        <div class="row">
                                            <div class="col-12 col-lg-6 ">
                                                <div class="form-group padding">
                                                    <label for="fullName">Full Name</label>
                                                    <input name="fullName" type="text" class="form-control" id="fullName" value="${guest.fullName}"/>
                                                    <span class="form-message" style="color: red"></span>
                                                </div>
                                            </div>   
                                            <div class="col-12 col-lg-6 ">
                                                <div class="form-group padding">
                                                    <label for="gender">Gender</label>
                                                    <select name="gender" class="form-control" id="gender">
                                                        <option>[Choose yours]</option>
                                                        <c:forEach items="${genderStatus}" var="genderSta">
                                                            <c:if test="${genderSta == guest.gender}">
                                                                <option value="${genderSta}" selected>${genderSta}</option>
                                                            </c:if>
                                                            <c:if test="${genderSta != guest.gender}">
                                                                <option value="${genderSta}">${genderSta}</option>
                                                            </c:if>
                                                        </c:forEach>   
                                                    </select>
                                                    <span class="form-message" style="color: red"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-lg-6 ">
                                                <div class="form-group padding">
                                                    <label for="name">Birth Date</label>
                                                    <input name="birthDate" type="date" class="form-control" id="birthDate" value="${guest.birthDate}"/>
                                                    <span class="form-message"></span>
                                                </div>
                                            </div> 
                                            <div class="col-12 col-lg-6">
                                                <div class="form-group padding">
                                                    <label for="email">Email</label>
                                                    <input name="email" type="email" class="form-control" id="email" value="${guest.email}"/>
                                                    <span class="form-message" style="color: red"></span>
                                                </div>
                                            </div>   
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-lg-6">
                                                <div class="form-group padding">
                                                    <label for="phoneNumber">Phone</label>
                                                    <input name="phoneNumber" type="text" class="form-control" id="phoneNumber" value="${guest.phoneNumber}"/>
                                                    <span class="form-message" style="color: red"></span>
                                                </div>
                                            </div>   
                                            <div class="col-12 col-lg-6">
                                                <div class="form-group padding">
                                                    <label for="idCard">ID Card</label>
                                                    <input name="idCard" type="text" class="form-control" id="idCard" value="${guest.idCard}"/>
                                                    <span class="form-message" style="color: red"></span>
                                                </div>
                                            </div>   
                                        </div>
                                        <div class="row">

                                            <div class="col-12 col-lg-6">
                                                <div class="form-group padding">
                                                    <label for="address">Address</label>
                                                    <input name="address" type="text" class="form-control" id="address" value="${guest.address}"/>
                                                    <span class="form-message" style="color: red"></span>
                                                </div>
                                            </div>  
                                        </div>
                                        <div class="row">
                                            <div class="col-12 text-align-center padding-bottom-10px">
                                                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink ">Submit</button>
                                                <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
                                            </div>
                                        </div>

                                    </div>
                                </mvc:form>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
            <!-- end page content -->
        </div>
        <jsp:include page="../include/admin/footer.jsp"/>          
    </div>
    <jsp:include page="../include/admin/js-page.jsp"/> 
    <script>

        Validator({

            form: '#form-guest',
            rules: [
                Validator.isNameGuest('#fullName'),
                Validator.isGenderGuest('#gender'),
                Validator.isBirthDate('#birthDate'),
                Validator.isEmailGuest('#email'),
                Validator.isPhoneGuest('#phoneNumber'),
                Validator.isAdressGuest('#address'),
                Validator.isIdCard('#idCard')
            ]
        });
    </script>
</body>
</html>
