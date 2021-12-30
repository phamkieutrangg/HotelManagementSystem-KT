<table class="table table-hover table-checkable order-column" id="example4">
    <thead>
        <tr>                                                                                 
            <td class="center">Room</td>
            <td class="center">Service</td>
            <td class="center">Action</td>  
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${bookingDetails}" var="bookDetail">             
        <tr class="odd gradeX">
            <td class="center">${bookDetail.room.roomNumber}</td>
            <td>
                <div class="row">                        
                    <c:forEach items="${bookDetail.serviceBooking}" var="serviceBooking" >
                        <c:set var="service" value="${service + serviceBooking.quantity*serviceBooking.price}"></c:set>
                        <div class="col-lg-3 center">
                            <span>${serviceBooking.service.name}</span>
                        </div>
                        <div class="col-lg-3 center">
                            <span>${serviceBooking.quantity}</span>
                        </div>
                        <div class="col-lg-3 center">
                            <span> <fmt:formatNumber type="number" pattern="###.###$" value="${serviceBooking.price}" />
                            </span>
                        </div>
                        <div class="col-lg-3 center" style="margin-bottom: 5px">
                            <button class="btb btn-info">
                                <a href="${pageContext.request.contextPath}/admin/delete-serviceBooking/${serviceBooking.id}" class="nav-link ">Remove</a>
                            </button>
                        </div>
                    </c:forEach>                                          
                </div>
            </td>           
            <td class="center">
                <button class="btb btn-info">
                    <a href="${pageContext.request.contextPath}/admin/add-serviceBooking/${bookDetail.booking.id}/${bookDetail.room.id}" class="nav-link ">Add</a>
                </button>
            </td>  
        </tr>        
    </c:forEach>
</tbody>
<tr class="odd gradeX">
    <td class="" colspan="2">Total of Service</td>
    <td class="center">
<fmt:formatNumber type="number" pattern="###.###$" value="${service}" /></td>
</tr>
</table>