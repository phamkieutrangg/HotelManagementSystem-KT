<%-- 
    Document   : edit-room
    Created on : Oct 27, 2021, 11:08:54 PM
    Author     : KT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Service Booking</title>
        <jsp:include page="../include/admin/css-page.jsp"/>
        <link href="<c:url value="/resources-management/css/view-DetailService.css" />" type="text/css" rel="stylesheet" />
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
                                    <div class="page-title">View Service Booking</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="">Service Booking</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">View Service Booking</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">           
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Add Service For Room: ${sessionScope.room.roomNumber} of Booking ${sessionScope.booking.id}</header>
                                        <input type="hidden" value="${booking.id}" id="bookingId"/>
                                        <input type="hidden" value="${room.id}" id="roomId"/>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                        </div>
                                    </div>

                                    <div class="card-body ">                
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column" id="example4">
                                                <thead>
                                                    <tr>                                                                                 
                                                        <td class="center">Service</td>
                                                        <td class="center">Price</td>
                                                        <td class="center">Quantity</td> 
                                                        <td class="center">Book</td> 
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${services}" var="service"> 
                                                        <mvc:form action="${pageContext.request.contextPath}/admin/add-service/${service.id}" method="post" 
                                                                  modelAttribute="service" onsubmit = "return(validateFormRoom());">
                                                            <tr class="odd gradeX">
                                                                <td class="center">${service.name}</td>
                                                                <td class="center">
                                                                    <span> <fmt:formatNumber type="number" pattern="###,###VND" value="${service.price}" /></span>
                                                                </td>
                                                                <td class="center">
                                                                    <input type="number" min="1" max="10" value="1" name="quantity" id="quantity"/>
                                                                </td>
                                                                <td class="center">
                                                                    <button type ="submit" value="Add" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink"
                                                                            onclick="addService('')">                
                                                                        ADD
                                                                </td>
                                                            </tr> 
                                                        </mvc:form>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>                                       
                                    </div>
                                </div>
                                <div class="card card-box">                    
                                    <div class="card-head">
                                        <header>List Service Booking You Choose</header>
                                    </div>
                                    <div class="card-body ">   
                                        <mvc:form action="${pageContext.request.contextPath}/admin/view_service_booking" method="post" 
                                                  modelAttribute="serviceBooking" onsubmit = "return(validateFormRoom());">
                                            <div class="table-scrollable" id="allDetailService">
                                                <table class="table table-hover table-checkable order-column" id="addServiceTB">
                                                    <thead>
                                                        <tr>                                                                                 
                                                            <td class="center">Service</td>
                                                            <td class="center">Quantity</td>
                                                            <td class="center">Price</td> 
                                                            <td class="center">Action</td> 
                                                        </tr>
                                                    </thead>
                                                    <c:forEach items="${serviceBookings}" var="map" varStatus="index">
                                                        <c:set var="priceService" value="${priceService + map.price*map.quantity}"></c:set>
                                                        <tr class="odd gradeX">
                                                            <td class="center">${map.service.name}</td>
                                                            <td class="center">${map.quantity}</td>
                                                            <td class="center"><span> <fmt:formatNumber type="number" pattern="###,###VND" value="${map.price}" /></span></td>
                                                            <td class="center">
                                                                <button class="btb btn-info">
                                                                    <a href="${pageContext.request.contextPath}/admin/remove-service-session/${index.index}" class="nav-link ">Remove</a>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                    <tr class="odd gradeX">
                                                        <td class="" colspan="3">Total</td>
                                                        <td class="center"><span> <fmt:formatNumber type="number" pattern="###,###VND" value="${priceService}" /></span></td>
                                                    </tr>
                                                </table>
                                                <div style="text-align: center">
                                                    <button type ="submit" value="Add" class="mdl-button mdl-js-button
                                                            mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">  ADD                
                                                </div>
                                            </div>               
                                        </mvc:form>                                   
                                    </div>
                                </div>           
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../include/admin/footer.jsp"/>          
            </div>
            <jsp:include page="../include/admin/js-page.jsp"/>  
    </body>
</html>
