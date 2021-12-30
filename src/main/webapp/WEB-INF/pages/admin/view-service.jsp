<%-- 
    Document   : edit-room
    Created on : Oct 27, 2021, 11:08:54 PM
    Author     : KT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Service</title>
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
                                    <div class="page-title">View Services</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="">Service</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">View Services</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>All Services</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">
                                            <div class="col-md-6 col-sm-6 col-6">
                                                <div class="btn-group">
                                                    <a href="${pageContext.request.contextPath}/admin/add-service" id="addRow" class="btn btn-info">
                                                        Add New <i class="fa fa-plus"></i>
                                                    </a>
                                                </div>
                                            </div>                 
                                        </div>
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                    <tr>                                                                                 </td>
                                                        <td class="center">Name</td>
                                                        <td class="center">Create Date</td>
                                                        <td class="center">Price</td>
                                                        <td class="center">Location</td>
                                                        <td class="center">Open-time</td>
                                                        <td class="center">Status</td>
                                                        <td class="center">Action</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${services}" var="service">
                                                        <tr class="odd gradeX">
                                                            <td class="center">${service.name}</td>
                                                            <td class="center">${service.createDate}</td>
                                                            <td class="center">
                                                                 <fmt:formatNumber type="number" pattern="###,### VND" value="${service.price}" />
                                                            </td>
                                                            <td class="center">${service.location}</td>
                                                            <td class="center">${service.openTime}</td>
                                                            <td class="center">${service.status}</td>
                                                            <td class="center">
                                                                <a href="${pageContext.request.contextPath}/admin/edit-service/${service.id}" class="btn btn-tbl-edit btn-xs">
                                                                    <i class="fa fa-pencil"></i>
                                                                </a>
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
    </body>
</html>
