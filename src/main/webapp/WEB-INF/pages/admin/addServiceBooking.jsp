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
                                        <header>Add Service For Room: ...</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">               
                                        </div>
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column" id="example4">
                                                <thead>
                                                    <tr>                                                                                 
                                                        <td class="center">Service</td>
                                                        <td class="center">Price</td>
                                                        <td class="center">Quantity</td> 
                                                        <td class="center">Action</td> 
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${services}" var="service">             
                                                        <tr class="odd gradeX">
                                                            <td class="center">${service.name}</td>
                                                            <td class="center">
                                                               <span> <fmt:formatNumber type="number" pattern="###,###$" value="${service.price}" /></span>
                                                            </td>
                                                            <td class="center">
                                                               <input type="number" min="1" max="10" value="1"/>
                                                            </td>
                                                            <td class="center">
                                                                <input type="button" value="Add" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-pink" onclick="book(this)"/>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="table-scrollable" id="allDetailService">
                                            <table class="table table-hover table-checkable order-column" id="example4">
                                                <thead>
                                                    <tr>                                                                                 
                                                        <td class="center">Service</td>
                                                        <td class="center">Quantity</td>
                                                        <td class="center">Price</td> 
                                                        <td class="center">Action</td> 
                                                    </tr>
                                                </thead>
                                                <tbody>                                                          
                                                        <tr class="odd gradeX">
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>                   
                                                </tbody>
                                                 <tr class="odd gradeX">
                                                    <td class="" colspan="3">Total</td>
                                                    <td class="center">111</td>
                                                </tr>
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
            function book(x){
                var tr = x.parentElement.parentElement;
                var td = tr.children;
                var service = td[0].innerHTML;
                var price = td[1].children[0].innerHTML;
                var quantity = td[2].children[0].value;
                var total = parseInt(price)*parseInt(quantity);
                alert(quantity);
            }
        </script>
    </body>
</html>
