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
        <title>View All Rooms</title>
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
                                    <div class="page-title">Booking</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="">Booking</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">View More</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Information of customer : ${booking.user.fullName}</header>
                                    </div>
                                    <div class="card-body "> 
                                        <mvc:form action="${pageContext.request.contextPath}/admin/edit-user" method="get" 
                                                  modelAttribute="booking">      
                                            <div class="table-scrollable">
                                                <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                    <tbody>                           
                                                    <input type="text" class="form-control" name="id"
                                                           value="${booking.id}" hidden>                                                 
                                                    <tr class="odd gradeX">
                                                        <td class="center">Birth Date : ${booking.user.birthDate}</td>
                                                        <td class="center">Gender : ${booking.user.gender}</td>
                                                    </tr>
                                                    <tr class="odd gradeX">                                                      
                                                        <td class="center">Address : ${booking.user.address} </td>
                                                        <td class="center">Phone : ${booking.user.phoneNumber} </td>
                                                    </tr>
                                                    <tr class="odd gradeX">                                                       
                                                        <td class="center">Email : ${booking.user.email} </td>
                                                        <td class="center">Booking Date : ${booking.bookingDate} </td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <c:if test="${booking.status != 'CHECK_OUT' && booking.status != 'CANCEL' }">
                                                        <c:if test="${booking.status == 'CHECK_IN'}">
                                                        <td class="center">      
                                                            <label>Booking Status:</label>
                                                            <select name="status" class="form-control" id="status">
                                                                
                                                                    <option value="CHECK_IN" ${'CHECK_IN' == booking.status ? 'selected' : '' }>CHECK_IN</option>
                                                                    <option value="CHECK_OUT">CHECK_OUT</option>
                                                               
                                                            </select>            
                                                        </td>
                                                        </c:if>
                                                        <c:if test="${booking.status != 'CHECK_IN'}">
                                                        <td class="center">      
                                                            <label>Booking Status:</label>
                                                            <select name="status" class="form-control" id="status">
                                                                <c:forEach items="${bookingStatus}" var="bookingSta">
                                                                    <option value="${bookingSta}" ${bookingSta == booking.status ? 'selected' : '' }>${bookingSta}</option>
                                                                </c:forEach>
                                                            </select>            
                                                        </td>
                                                        </c:if>
                                                        </c:if>
                                                        <c:if test="${booking.status == 'CHECK_OUT' || booking.status == 'CANCEL' }">
                                                            <td class="center">Booking Status: ${booking.status} </td>
                                                        </c:if>
                                                        
                                                        <td class="center"></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                <c:if test="${booking.status != 'CHECK_OUT'&& booking.status != 'CANCEL'}">
                                                <button type="submit">UPDATE</button>
                                                </c:if>   
                                            </div>
                                        </mvc:form>                
                                    </div>
                                </div>
                                <c:if test="${booking.status == 'CHECK_OUT' }">
                                <div class="card card-box">                    
                                    <div class="card-head">
                                        <header>List Guests of Booking:
                                            <button class="btb btn-info"><a href="${pageContext.request.contextPath}/admin/view-list-guest">View Details</a></button>
                                    </div>
                                </div>
                                </c:if>    
                                <div class="card card-box">                    
                                    <div class="card-head">
                                        <header>Booking Room</header>
                                    </div>
                                    <div class="card-body ">   
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                    <tr>                                                                                
                                                        <td class="center">Room Name</td>
                                                        <td class="center">Price</td>
                                                        <td class="center">Discount</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${bookingDetails}" var="bookingDetail">
                                                        <c:set var="priceRoom" value="${priceRoom + bookingDetail.price*(1-(bookingDetail.discount/100))}"></c:set>
                                                            <tr class="odd gradeX">
                                                                <td class="center">${bookingDetail.room.roomNumber}</td>
                                                            <td class="center">
                                                                <fmt:formatNumber type="number" pattern="###,###VND" value="${bookingDetail.price}" /></td>
                                                            <td class="center">
                                                                ${bookingDetail.discount}%</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                                <tr class="odd gradeX">
                                                    <td class="" colspan="2">Total of Room</td>
                                                    <td class="center">
                                                        <fmt:formatNumber type="number" pattern="###,###VND" value="${priceRoom}" /></td></td>
                                                </tr>
                                            </table>
                                        </div>                                   
                                    </div>
                                </div>                
                                <div class="card card-box">   
                                    <div class="card-head">
                                        <header>Service</header>
                                    </div>
                                    <div class="card-body ">   
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column" id="example4">
                                                <thead>
                                                    <tr>                                                                                 
                                                        <td class="center">Room</td>
                                                        <td class="center">Service</td>
                                                        <c:if test="${booking.status != 'CHECK_OUT'&& booking.status != 'CANCEL'}">
                                                            <td class="center">Action</td>
                                                        </c:if>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${bookingDetails}" var="bookDetail">             
                                                        <tr class="odd gradeX">
                                                            <td class="center">${bookDetail.room.roomNumber}</td>
                                                            <td>
                                                                <div class="row">                        
                                                                    <c:forEach items="${bookDetail.serviceBooking}" var="serviceBooking" >
                                                                        <c:set var="priceService" value="${priceService + serviceBooking.quantity*serviceBooking.price}"></c:set>
                                                                        <c:if test="${booking.status != 'CHECK_OUT'&& booking.status != 'CANCEL'}">
                                                                        <div class="col-lg-3 center">
                                                                            <span>${serviceBooking.service.name}</span>
                                                                        </div>
                                                                        <div class="col-lg-3 center">
                                                                            <span>${serviceBooking.quantity}</span>
                                                                        </div>
                                                                        <div class="col-lg-3 center">
                                                                            <span> <fmt:formatNumber type="number" pattern="###,###VND" value="${serviceBooking.price}" />
                                                                            </span>
                                                                        </div>
                                                                        <div class="col-lg-3 center" style="margin-bottom: 5px">
                                                                            <button class="btb btn-info">
                                                                                <a href="${pageContext.request.contextPath}/admin/delete-serviceBooking/${serviceBooking.id}" class="nav-link ">Remove</a>
                                                                            </button>
                                                                        </div>
                                                                        </c:if>
                                                                        <c:if test="${booking.status == 'CHECK_OUT' || booking.status == 'CANCEL' }">
                                                                        <div class="col-lg-4 center">
                                                                            <span>${serviceBooking.service.name}</span>
                                                                        </div>
                                                                        <div class="col-lg-4 center">
                                                                            <span>${serviceBooking.quantity}</span>
                                                                        </div>
                                                                        <div class="col-lg-4 center">
                                                                            <span> <fmt:formatNumber type="number" pattern="###,###VND" value="${serviceBooking.price}" />
                                                                            </span>
                                                                        </div>    
                                                                        </c:if>
                                                                    </c:forEach>                                          
                                                                </div>
                                                            </td>
                                                            <c:if test="${booking.status != 'CHECK_OUT'&& booking.status != 'CANCEL'}">
                                                                <td class="center">
                                                                    <button class="btb btn-info">
                                                                        <a href="${pageContext.request.contextPath}/admin/add-serviceBooking/${bookDetail.room.id}" class="nav-link ">Add</a>
                                                                    </button>
                                                                </td>  
                                                            </c:if>
                                                        </tr>        
                                                    </c:forEach>
                                                </tbody>                                  
                                                <tr class="odd gradeX">
                                                    <td class="" colspan="2">Total of Service</td>
                                                    <td class="center">
                                                        <fmt:formatNumber type="number" pattern="###,###VND" value="${priceService}" /></td>
                                                </tr>                                           
                                            </table>
                                        </div>
                                    </div>
                                </div>                        
                                <div class="card card-box">                    
                                    <div class="card-head">
                                        <header>Total Price Of Booking:
                                            <fmt:formatNumber value = "${priceService + priceRoom}" pattern="###,###VND" type = "number"/></header>
                                    </div>
                                </div>                   
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
</body>
</html>
