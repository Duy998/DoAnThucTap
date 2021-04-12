<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title><dec:title default="Trang chủ" /></title>

	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="font-awesome/4.5.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
    <script type='text/javascript' src="assets/js/ace-extra.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<!-- jquery -->
	<script type='text/javascript' src="js/2.1.4/jquery.min.js"></script>

	<%--sweetalert--%>
	<script type='text/javascript' src="assets/sweetalert2/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="assets/sweetalert2/sweetalert2.min.css">
	<style>
		.chkboxType label {
			font-weight: bold;
		}
		.chkboxType input[type=checkbox] {
			margin-right: 2px;
			min-width: 16px;
			height: 16px;
			top: 2.5px;
			position: relative;
		}
		.lbl {
			margin-right: 8px;
		}

	</style>

    <style>

    </style>
</head>
<body class="no-skin">
	<!-- header -->
    <%@ include file="/common/admin/header.jsp" %>
    <!-- header -->
	
	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<!-- header -->
    	<%@ include file="/common/admin/menu.jsp" %>
    	<!-- header -->
		
		<dec:body/>
		
		<!-- footer -->
    	<%@ include file="/common/admin/footer.jsp" %>
    	<!-- footer -->
    	
    	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>

	<%--jQuery Validation Plugin--%>
	<script src="js/jqueryvalidate/jquery.validate.min.js"></script>

	<%--common javascript file--%>
	<script type="text/javascript" src="js/global_admin_script.js"></script>

	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery-ui.custom.min.js"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="assets/js/jquery.easypiechart.min.js"></script>
	<script src="assets/js/jquery.sparkline.min.js"></script>
	<script src="assets/js/jquery.flot.min.js"></script>
	<script src="assets/js/jquery.flot.pie.min.js"></script>
	<script src="assets/js/jquery.flot.resize.min.js"></script>
	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<!-- page specific plugin scripts -->
	<script src="assets/js/jquery-ui.min.js"></script>

	<script type="text/javascript">
        // function showAlertBeforeDelete(callback) {
        //     // swal({
        //     //     title: "Xác nhận xóa",
        //     //     text: "Bạn có chắc chắn xóa những dòng đã chọn",
        //     //     type: "warning",
        //     //     showCancelButton: true,
        //     //     confirmButtonText: "Xác nhận",
        //     //     cancelButtonText: "Hủy bỏ",
        //     //     confirmButtonClass: "btn btn-success",
        //     //     cancelButtonClass: "btn btn-danger"
        //     // }).then(function (res) {
        //     //     if(res.value){
        //     //         callback();
        //     //     }else if(res.dismiss == 'cancel'){
        //     //         console.log('cancel');
        //     //     }
        //     // });
        //     swal.fire
        //     swal({
        //         title: 'Do you want to save the changes?',
        //         showDenyButton: true,
        //         showCancelButton: true,
        //         confirmButtonText: `Save`,
        //         conf
        //         denyButtonText: `Don't save`,
        //     }).then((result) => {
        //         /* Read more about isConfirmed, isDenied below */
        //         if (result.isConfirmed) {
        //             callback();
        //             Swal.fire('Saved!', '', 'success')
        //         } else if (result.isDenied) {
        //             Swal.fire('Changes are not saved', '', 'info')
        //         }
        //     });
        // }
	</script>

	<script type="text/javascript">
		$(document).ready(() => {
			console.log("Ready");

			const message = localStorage.getItem("message");

			if(message) {
				// Retrieve
				document.getElementById("infoArea").innerHTML = message;

				localStorage.removeItem("message");
			}

		});
	</script>
</body>
</html>