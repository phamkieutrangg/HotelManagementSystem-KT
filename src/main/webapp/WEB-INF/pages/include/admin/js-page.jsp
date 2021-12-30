<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- start js include path -->
<script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js" />" ></script>
<script src="<c:url value="/resources-management/assets/plugins/popper/popper.min.js"  />"></script>
<script src="<c:url value="/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js" />" ></script>
<script src="<c:url value="/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" />"></script>
<!-- bootstrap -->
<script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js" />" ></script>
<script src="<c:url value="/resources-management/assets/plugins/sparkline/jquery.sparkline.min.js"  />"></script>
<script src="<c:url value="/resources-management/assets/js/pages/sparkline/sparkline-data.js" />"></script>
<!-- Common js-->
<script src="<c:url value="/resources-management/assets/js/app.js" />" ></script>
<script src="<c:url value="/resources-management/assets/js/layout.js"  />"></script>
<script src="<c:url value="/resources-management/assets/js/theme-color.js"  />"></script>
<!-- material -->
<script src="<c:url value="/resources-management/assets/plugins/material/material.min.js" />"></script>
<script src="<c:url value="/resources-management/assets/js/pages/material_select/getmdl-select.js"/>" ></script>
<script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/moment-with-locales.min.js"/>"></script>
<script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"/>"></script>
<script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/datetimepicker.js"/>"></script>
<!-- animation -->
<script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js" />" ></script>
<!-- morris chart -->
<script src="<c:url value="/resources-management/assets/plugins/morris/morris.min.js"  />"></script>
<script src="<c:url value="/resources-management/assets/plugins/morris/raphael-min.js" />" ></script>
<script src="<c:url value="/resources-management/assets/js/pages/chart/morris/morris_home_data.js"  />"></script>
<!-- dropzone -->
<script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.js"/>"></script>
<script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone-call.js"/>" ></script>
<script src="<c:url value="/resources-management/assets/js/validateForm.js" />" ></script>
<script src="<c:url value="/resources-management/assets/js/validateFormRoomType.js" />" ></script>
<script src="<c:url value="/resources-management/assets/js/ajax.js" />" ></script>
<%-- slider --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js" integrity="sha512-HGOnQO9+SP1V92SrtZfjqxxtLmVzqZpjFFekvzZVWoiASSQgSr4cw9Kqd2+l8Llp4Gm0G8GIFJ4ddwZilcdb8A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js" integrity="sha512-eP8DK17a+MOcKHXC5Yrqzd8WI5WKh6F1TIk5QZ/8Lbv+8ssblcz7oGC8ZmQ/ZSAPa7ZmsCU4e/hcovqR8jfJqA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

$('.one-time').slick({
  dots: true,
  infinite: true,
  speed: 300,
  slidesToShow: 1,
  adaptiveHeight: true
});
$('#one-time-test').slick({
  dots: true,
  infinite: true,
  speed: 300,
  slidesToShow: 1,
  adaptiveHeight: true
});	
</script>


