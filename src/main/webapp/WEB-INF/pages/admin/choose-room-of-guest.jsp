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
        <title>Guest</title>
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
                                    <div class="page-title">Guest</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="">Guest</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">Guest Info</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">   
                                    <div class="card-head">
                                        <header>Guest Infomation</header>
                                    </div>
                                    <div class="card-body ">
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column" id="example4">
                                                <thead>
                                                    <tr>                                                                                 
                                                        <td class="center">Room</td>
                                                        <td class="center">Guest</td>
                                                        <td class="center">Information Of Guest
                                                            <div class="row"> 
                                                                <c:if test="${bookingStatus == 'CHECK_IN' && bookingDataStatus != bookingStatus}">
                                                                <div class="col-lg-3 center">
                                                                    <span>Name</span>
                                                                </div>
                                                                <div class="col-lg-3 center">
                                                                    <span>Birth Date</span>
                                                                </div>
                                                                <div class="col-lg-3 center">
                                                                    <span>Gender</span>
                                                                </div>                                                               
                                                                <div class="col-lg-3 center">
                                                                    <span>Action</span>
                                                                </div> 
                                                                </c:if>
                                                                <c:if test="${bookingStatus == 'CHECK_OUT' || bookingDataStatus == bookingStatus}">
                                                                <div class="col-lg-4 center">
                                                                    <span>Name</span>
                                                                </div>
                                                                <div class="col-lg-4 center">
                                                                    <span>Birth Date</span>
                                                                </div>
                                                                <div class="col-lg-4 center">
                                                                    <span>Gender</span>
                                                                </div>                                                               
                                                                </c:if>
                                                            </div>
                                                        </td>
                                                        <c:if test="${bookingStatus == 'CHECK_IN' && bookingDataStatus != bookingStatus}">
                                                        <td class="center">Action</td>
                                                        </c:if>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${bookingDetails}" var="bookDetail">             
                                                        <tr class="odd gradeX">
                                                            <td class="center">${bookDetail.room.roomNumber}</td>
                                                            <td class="center">${bookDetail.room.roomType.guest}</td>
                                                            <td class="center">
                                                                <div class="row">                        
                                                                    <c:forEach items="${bookDetail.guests}" var="guest" > 
                                                                        <c:if test="${bookingStatus == 'CHECK_IN' && bookingDataStatus != bookingStatus}">
                                                                        <div class="col-lg-3 center">
                                                                            <span>${guest.fullName}</span>
                                                                        </div>
                                                                        <div class="col-lg-3 center">
                                                                            <span>${guest.birthDate}</span>
                                                                        </div>
                                                                        <div class="col-lg-3 center">
                                                                            <span>${guest.gender}</span>
                                                                        </div>                                              
                                                                        <div class="col-lg-3 center" style="    padding-bottom: 5px">
                                                                            <a href="${pageContext.request.contextPath}/admin/edit-guest/${bookDetail.room.id}/${guest.id}" class="btn btn-tbl-edit btn-xs">
                                                                                <i class="fa fa-pencil"></i>
                                                                            </a>
                                                                            <a href="${pageContext.request.contextPath}/admin/delete-guest/${guest.id}" class="btn btn-tbl-delete btn-xs">
                                                                                <i class="fa fa-trash-o"></i>
                                                                            </a>                                                          
                                                                        </div>
                                                                        </c:if>
                                                                        <c:if test="${bookingStatus == 'CHECK_OUT' || bookingDataStatus == bookingStatus}">
                                                                        <div class="col-lg-4 center">
                                                                            <span>${guest.fullName}</span>
                                                                        </div>
                                                                        <div class="col-lg-4 center">
                                                                            <span>${guest.birthDate}</span>
                                                                        </div>
                                                                        <div class="col-lg-4 center">
                                                                            <span>${guest.gender}</span>
                                                                        </div>                                              
                                                                        </c:if>
                                                                    </c:forEach>                                          
                                                                </div>
                                                            </td>
                                                            <c:if test="${bookingStatus == 'CHECK_IN' && bookingDataStatus != bookingStatus}">
                                                            <td class="center">
                                                                <button class="btb btn-info">
                                                                    <a href="${pageContext.request.contextPath}/admin/add-info-guest/${bookDetail.room.id}" class="nav-link ">Add Guest</a>
                                                                </button>
                                                            </td>
                                                            </c:if>
                                                        </tr>        
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <button class="btb btn-info">
                                            <c:if test="${bookingStatus == 'CHECK_IN' && bookingDataStatus != bookingStatus}">
                                                <a href="${pageContext.request.contextPath}/admin/check-in" class="nav-link ">Check-in</a>
                                            </c:if>
                                            <c:if test="${bookingStatus == 'CHECK_OUT'}">
                                                <a href="${pageContext.request.contextPath}/admin/check-out" class="nav-link ">Check-out</a>
                                            </c:if>
                                            <c:if test="${bookingStatus == 'CHECK_IN' && bookingDataStatus == bookingStatus}">                                  
                                                <a href="${pageContext.request.contextPath}/admin/back-view-detail" class="nav-link ">BACK</a>
                                            </c:if>
                                        </button>
                                        <c:if test="${message != null}">
                                            <div class="alert alert-danger">
                                                <i>Please!!!!!!!!!!!!!!!!!!!</i>
                                            </div>
                                        </c:if>
                                        
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
