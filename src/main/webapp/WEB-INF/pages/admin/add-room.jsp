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
        <c:if test="${action == 'add'}">
            <title>Add Room</title>
        </c:if>
        <c:if test="${action == 'edit'}">
            <title>Update Room</title>
        </c:if>     
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
                                    <c:if test="${action == 'add'}">
                                        <div class="page-title">Add Room</div>
                                    </c:if>
                                    <c:if test="${action == 'edit'}">
                                        <div class="page-title">Update Room</div>
                                    </c:if>   
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="#">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="#">Rooms</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <c:if test="${action == 'add'}">
                                        <li class="active">Add Room</li>
                                    </c:if>
                                    <c:if test="${action == 'edit'}">
                                        <li class="active">Update Room</li>
                                    </c:if>   
                                </ol>
                            </div>
                        </div>
                        <mvc:form action="${pageContext.request.contextPath}/admin/result-room" method="post" id="form-1"
                                  modelAttribute="room" >
                            <c:if test="${action == 'edit'}">
                                <input type="text" class="form-control" name="id"
                                       value="${room.id}" hidden>
                            </c:if>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-box">
                                        <div class="card-head">
                                            <c:if test="${action == 'add'}">
                                                <header>Add Room</header>
                                                </c:if>
                                                <c:if test="${action == 'edit'}">
                                                <header>Update Room</header>
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
                                                    <label for="roomNumber">Room Number</label>
                                                    <input name="roomNumber" type="text" class="form-control" id="roomNumber" value="${room.roomNumber}"/>
                                                    <span class="form-message" style="color: red"></span>
                                                    <c:if test="${overloop != null}">
                                                <span class="form-message" style="color: red">Loop</span>
                                                </c:if>
                                                </div>
                                            </div>   
                                            <div class="col-12 col-lg-6 ">
                                                <div class="form-group padding">
                                                    <label for="roomType.id">Room Type</label>
                                                    <select name="roomType.id" class="form-control" id="roomType">
                                                        <option>[Choose yours]</option>
                                                        <c:forEach items="${roomType}" var="type">
                                                            <c:if test="${type.id == room.roomType.id}">
                                                                <option value="${type.id}" selected>${type.name}</option>
                                                            </c:if>
                                                            <c:if test="${type.id != room.roomType.id}">
                                                                <option value="${type.id}">${type.name}</option>
                                                            </c:if>
                                                        </c:forEach>   
                                                    </select>
                                                    <span class="form-message" style="color: red"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-lg-6">
                                                <div class="form-group padding">
                                                    <label for="numberOfBed">Number of Bed</label>
                                                    <input name="numberOfBed" type="number" class="form-control" id="numberOfBed" value="${room.numberOfBed}"/>
                                                    <span class="form-message" style="color: red"></span>
                                                </div>
                                            </div>   
                                            <div class="col-12 col-lg-6">
                                                <div class="form-group padding">
                                                    <label for="status">Status</label>
                                                    <select name="status" class="form-control" id="status">
                                                        <option>[Choose yours]</option>
                                                        <c:forEach items="${roomStatus}" var="roomSta">
                                                            <c:if test="${roomSta == room.status}">
                                                                <option value="${roomSta}" selected>${roomSta}</option>
                                                            </c:if>
                                                            <c:if test="${roomSta != room.status}">
                                                                <option value="${roomSta}">${roomSta}</option>
                                                            </c:if>
                                                        </c:forEach>   
                                                    </select>
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
            form: '#form-1',
            rules: [
                Validator.isRoomNumber('#roomNumber'),
                Validator.isRoomType('#roomType'),
                Validator.isNumberOfBed('#numberOfBed'),
                Validator.isStatus('#status')
            ]
        });
    </script>
</body>
</html>
