                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- start sidebar menu -->
                <div class="sidebar-container">
                    <div class="sidemenu-container navbar-collapse collapse fixed-menu">
                        <div id="remove-scroll">
                            <ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                                <li class="sidebar-toggler-wrapper hide">
                                    <div class="sidebar-toggler">
                                        <span></span>
                                    </div>
                                </li>
                                <li class="sidebar-user-panel">
                                    <div class="user-panel">
                                        <div class="row">
                                            <div class="sidebar-userpic">
                                                <img src="<c:url value="resources-management/assets/img/dp.jpg"/>" class="img-responsive" alt=""> </div>
                                        </div>
                                        <div class="profile-usertitle">
                                            <div class="sidebar-userpic-name"> Kieu Trang </div>
                                            <div class="profile-usertitle-job"> Manager </div>
                                        </div>
                                        <div class="sidebar-userpic-btn">
                                            <a class="tooltips" href="user_profile.html" data-placement="top" data-original-title="Profile">
                                                <i class="material-icons">person_outline</i>
                                            </a>
                                            <a class="tooltips" href="email_inbox.html" data-placement="top" data-original-title="Mail">
                                                <i class="material-icons">mail_outline</i>
                                            </a>
                                            <a class="tooltips" href="chat.html" data-placement="top" data-original-title="Chat">
                                                <i class="material-icons">chat</i>
                                            </a>
                                            <a class="tooltips" href="login.html" data-placement="top" data-original-title="Logout">
                                                <i class="material-icons">input</i>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="menu-heading">
                                    <span>-Manage-</span>
                                </li>
                                
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">vpn_key</i>
                                        <span class="title">Room</span>
                                        <span class="arrow"></span>                  
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/admin/add-room" class="nav-link ">
                                                <span class="title">Add Room</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/admin/view-all-rooms" class="nav-link ">
                                                <span class="title">View All Room</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">business_center</i>
                                        <span class="title">Room Type</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/admin/add-roomType" class="nav-link ">
                                                <span class="title">Add Room Type</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/admin/view-roomType" class="nav-link ">
                                                <span class="title">View All Room Type</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">vpn_key</i>
                                        <span class="title">Promotion</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/admin/add-promotion" class="nav-link ">
                                                <span class="title">Add Promotion</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/admin/view-promotion" class="nav-link ">
                                                <span class="title">View All Promotion</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">group</i>
                                        <span class="title">Service</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                             <a href="${pageContext.request.contextPath}/admin/add-service" class="nav-link ">
                                                <span class="title">Add Service</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/admin/view-service" class="nav-link ">
                                                <span class="title">View All Service</span>
                                            </a>
                                        </li>          
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">local_taxi</i>
                                        <span class="title">Booking</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/admin/view-booking" class="nav-link ">
                                                <span class="title">View All Booking</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                   
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end sidebar menu --> 