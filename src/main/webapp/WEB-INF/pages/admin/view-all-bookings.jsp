<%-- 
    Document   : edit-room
    Created on : Oct 27, 2021, 11:08:54 PM
    Author     : KT
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking</title>
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
                                    <div class="page-title">Booking</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="">Booking</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">All Bookings</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>All Bookings</header>
                                            <c:if test="${action == 'edit'}">
                                            <input type="text" class="form-control" name="id"
                                                   value="${booking.id}" hidden>
                                        </c:if>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">
                                            <div class="col-md-3 col-sm-3 col-2">
                                                <div class="btn-group">
                                                    <form action="${pageContext.request.contextPath}/admin/search-name" id="form-search-name" method="get">
                                                        <input type="text" placeholder="Search name.." name="search" id="search" value="${search}">
                                                        <button type="submit"><i class="fa fa-search"></i></button>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-8">
                                                <form action="${pageContext.request.contextPath}/admin/search-dateFrom-dateTo" method="get" id="form-search-date">
                                                    <div class="row">
                                                        <div class="col-lg-1" style="padding: 0px">
                                                            <span>From</span>
                                                        </div>
                                                        <div class="col-lg-4"style="padding: 0px">
                                                            <input type="date" name="dateFrom" id="dateFrom" value=${dateFrom} class="form-control">
                                                        </div>
                                                        <div class="col-lg-1"style="padding-right: 0px">
                                                            <span>To</span>
                                                        </div>
                                                        <div class="col-lg-4"style="padding: 0px">
                                                            <input type="date" name="dateTo" id="dateTo" value=${dateTo} class="form-control">
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div class="btn-group">
                                                                <button type="submit"><i class="fa fa-search"></i></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-2">
                                                <div class="btn-group pull-right">
                                                    <a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Tools
                                                        <i class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li>
                                                            <a href="${pageContext.request.contextPath}/admin/export-file-month">
                                                                <i class="fa fa-file-pdf-o"></i> Export Excel Of Month </a>
                                                        </li>
                                                        <li>
                                                            <a href="${pageContext.request.contextPath}/admin/export-file">
                                                                <i class="fa fa-file-excel-o"></i> Export to Excel </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body ">          
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                    <tr>                                                                                
                                                        <td class="center">Name</td>
                                                        <td class="center">Booking Date</td>
                                                        <td class="center">Check in</td>
                                                        <td class="center">Check out</td>
                                                        <td class="center">Booking Status</td>
                                                        <td class="center">Total Price</td>
                                                        <td class="center">Action</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${bookings}" var="book">
                                                        <tr class="odd gradeX">
                                                            <td class="center">${book.user.fullName}</td>
                                                            <td class="center">${book.bookingDate}</td>
                                                            <td class="center">${book.checkin}</td>
                                                            <td class="center">${book.checkout}</td>
                                                            <td class="center">${book.status}</td>
                                                            <td class="center">
                                                                <span>  <fmt:formatNumber type="number" pattern="###,###VND" value="${book.totalPrice}" /></td> </span>
                                                            <td class="center">         
                                                                <button class="btb btn-info"><a href="${pageContext.request.contextPath}/admin/viewDetailService/${book.id}" class="nav-link ">View more</a></button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
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
        <script>

            Validator({
                    form: '#form-search-name',
                    rules: [
                            Validator.isSearchName('#search')
                    ]
            });
//            Validator({
//
//            form: '#form-search-date',
//                    rules: [
//                            Validator.isDateFrom('#dateFrom'),
//                            Validator.isDateTo('#dateTo')
//                    ]
//            });

        </script>
    </body>
</html>
