<%@include file="/common/taglib.jsp"%>
<c:url var="buildingAPI" value="/api/building" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<c:url var="formUrl" value="/api/customer" />
<html>
<head>
<title>Chỉnh sửa khách hàng</title>
</head>
<body>

	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
                try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
            </script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a
						href="building-list.html">Home</a></li>
					<li class="active">Khách hàng</li>
					<li class="active">Thêm mới khách hàng</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>

			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty message}">
							<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									<i class="ace-icon fa fa-times"></i>
								</button>
								${message}
							</div>
						</c:if>
						<!-- PAGE CONTENT BEGINS -->
						<h1
							style="color: #19afdc; border-bottom: 1px solid; padding-bottom: 3rem;">
							Thông tin khách hàng</h1>
						<!-- <form class="form-horizontal" role="form" id="formEdit"> -->

						<form:form class="form-horizontal" role="form" id="formSubmit"
							modelAttribute="model">
							<div class="form-group">
								<label class="col-sm-3  text-left" for="rentPrice">Tên
									đầy đủ </label>

								<div class="col-sm-9">
									<%-- <input type="text" id="rentPrice" class="form-control" value="${model.fullName }"> --%>
									<form:input path="fullName" cssClass="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 text-left" for="rentPriceDescription">Số
									điện thoại </label>

								<div class="col-sm-9">
									<%-- <input type="text" id="rentPriceDescription" class="form-contro" value="${model.phone }" > --%>
									<form:input path="phone" cssClass="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 text-left" for="serviceCost">Email
								</label>

								<div class="col-sm-9">
									<%-- <input type="text" id="serviceCost" class="form-control" value="${model.email }"> --%>
									<form:input path="email" cssClass="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 text-left" for="carFee">Tên Công
									ty </label>

								<div class="col-sm-9">
									<input type="text" id="carFee" class="form-control" value="">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 text-left" for="overTimeFee">nhu
									cầu </label>

								<div class="col-sm-9">
									<input type="text" id="overTimeFee" class="form-control"
										value="${model.demand }">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 text-left" for="overTimeFee">Ghi
									chú </label>

								<div class="col-sm-9">
									<textarea id="overTimeFee" class="form-control"></textarea>
								</div>
							</div>

							<div class="form-group pull-right">

								<div class="col-sm-9">
									<c:if test="${empty model.id}">
										<button type="button" class="btn btn-primary btn-bold"
											id="btnAddOrUpdateCustomer">Thêm mới Khách hàng</button>
									</c:if>
									<c:if test="${not empty model.id}">
										<button type="button" class="btn btn-primary btn-bold"
											id="btnAddOrUpdateCustomer">Cập nhật Khách hàng</button>
									</c:if>
									<a href="http://localhost:8081/spring-boot/admin/customer-list" class="btn btn-warning btn-bold">
										Hủy</a>

								</div>
							</div>
							<form:hidden path="id" id="customerid" />
						</form:form>




					</div>
				</div>
				<!-- /.row -->
				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->

	<script>
	$('#btnAddOrUpdateCustomer').click(function(e) {
		debugger;
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		var id = $('#customerid').val();
		
		if (id == "") {		
			addBuilding(data);
		} else {
			updaBuilding(data,id);
		}
	});

	function addBuilding(data) {
		$.ajax({
			url : '${formUrl}',
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json',
			data : JSON.stringify(data),
			success : function(res) {
				$('#loading_image').hide();
				window.location.href = "<c:url value='/admin/customer-edit-"
					+ res.id + "?message=insert-success_system'/>";
			},
			error : function(res) {
				window.location.href = "<c:url value='/admin/customer-edit-"
						+ res.id + "?message=error_system'/>";
			}
		});
	}

	function updaBuilding(data, id) {
		$.ajax({
			url : '${formUrl}',
			type : 'PUT',
			dataType : 'json',
			contentType : 'application/json',
			data : JSON.stringify(data),
			success : function(res) {
				window.location.href = "<c:url value='/admin/customer-edit-"
						+ res.id + "?message=update_success'/>";
			},
			error : function(res) {
				window.location.href = "<c:url value='/admin/customer-edit-" 
				+ res.id+ "?message=error_system'/>";
			}
		});
	}
</script>
</body>
</html>
