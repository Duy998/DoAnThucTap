<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<%-- <c:url var="buildingListURL" value="/admin/building-list"/> --%>
<c:url value="/api/customer" var="formUrl" />

<html>
<head>
<title>Danh sách khách hàng</title>
</head>
<body>
	<!-- main content -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
                try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
            </script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a
						href="building-list.html">Home</a></li>
					<li class="active">Quản lý khách hàng</li>
					<li class="active">Danh sách khách hàng</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>

			<div class="page-content">
				<div id="errorArea"></div>
				<div id="infoArea"></div>
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="widget-box">

							<div class="widget-header">
								<h4 class="widget-title">Tìm kiếm</h4>

								<div class="widget-toolbar">
									<a href="#" data-action="collapse"> <i
										class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>

							<div class="widget-body">
								<div class="widget-main">
									<form:form cssClass="form-horizontal" commandName="modelSearch"
										action="${buildingListURL}" id="listForm" method="GET">
										<div class="form-group">
											<div class="col-sm-4">
												<label for="name" style="font-weight: bold">Tên
													khách hàng</label>
												<form:input path="fullName" cssClass="form-control" />
											</div>
											<div class="col-sm-4">
												<label for="areaRent" style="font-weight: bold">Di
													động</label>
												<form:input path="phone" cssClass="form-control" />
											</div>
											<div class="col-sm-4">
												<label for="areaRent" style="font-weight: bold">Email</label>
												<form:input path="email" cssClass="form-control" />
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-4">
												<div style="width: 5.6cm;">
													<label style="font-weight: bold">Nhân viên hiện có</label>
													<form:select cssClass="form-control" path="user"
														size="1rem">
														<form:option value=""
															label="--- Chọn nhân viên phụ trách ---" />
														<form:options items="${users.users}" />
													</form:select>
												</div>
											</div>
										</div>
										<div class="form-group" style="margin-left: 40%">
											<div class="col-sm-2">
												<button type="button" class="btn btn-sm btn-primary"
													id="btnSearch">
													Tìm kiếm <i
														class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
												</button>
											</div>
										</div>
									</form:form>
								</div>
								<!--widget main-->
							</div>
						</div>
						<!--widget box -->

						<div class="pull-right tableTools-container">
							<div class="btn-group btn-overlap">
								<div class="btn-group">
									<a href='<c:url value='/admin/customer-edit-${customers.id}'/>'><button
											data-toggle="tooltip" title="Thêm khách hàng"
											class="btn btn-white btn-info btn-bold">
											<i class="fa fa-plus-circle" aria-hidden="true"></i>
										</button></a> <a><button data-toggle="tooltip" title="Xóa khách hàng"
											onclick="btndeleteBuilding()"
											class="btn btn-white btn-warning btn-bold"
											style="margin-left: 2px;">
											<i class="fa fa-trash" aria-hidden="true"></i>
										</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- TABLE -->
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
						<div class="space space-30"></div>
						<table id="buildingList"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center"><label class="pos-rel"> <input
											type="checkbox" class="ace"> <span class="lbl"></span>
									</label></th>
									<th>Tên</th>
									<th>Nhân viên quản lý</th>
									<th>Di động</th>
									<th>Email</th>
									<th>Nhu cầu</th>
									<th>Người nhập</th>
									<th>Ngày nhập</th>
									<th>Trạng thái</th>
									<th>Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${customers.listResult}">
									<tr role="row" class="odd">
										<td class="center"><label class="pos-rel"> <input
												type="checkbox" class="ace" value="${item.id}"
												id="checkbox_${item.id}" /> <span class="lbl"></span>
										</label></td>
										<td>${item.fullName}</td>
										<td>${item.phone}</td>
										<td>${item.phone}</td>
										<td>${item.email}</td>
										<td>${item.demand}</td>
										<td>${item.createdBy}</td>
										<td>${item.createdDate}</td>
										<td>${item.status}</td>

										<td>
											<div class="hidden-sm hidden-xs btn-group">
												<button class="btn btn-sm btn-primary">
													<i class="fa fa-eye" aria-hidden="true"></i>
												</button>
												<c:url var="editcustomer" value="/admin/customer-edit" />
												<a class="btn btn-sm btn-primary"
													href="${editcustomer}-${item.id}"> <i
													class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</a>

												<button class="btn btn-sm btn-primary" data-toggle="tooltip"
													title="Giao tòa nhà">
													<i class="fa fa-share-square-o" aria-hidden="true"
														onclick="assignmentBuilding(${item.id})"></i>
												</button>

												<button class="btn btn-sm btn-primary">
													<i class="fa fa-plus" aria-hidden="true"></i>
												</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- Table ENDS -->

					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>




	<div class="modal fade" id="assignmentBuildingModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Danh sách nhân viên giao Tòa nhà</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12">
							<table class="table table-striped table-hover" id="staffList">
								<thead>
									<tr>
										<th style="text-align: center;">Chọn nhân viên</th>
										<th style="text-align: center;">Tên nhân viên</th>
									</tr>
								</thead>
								<tbody>
									<!--tr role="row" class="odd">
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td style="text-align: center;">Nguyễn Văn A</td>
                            </tr>
                            <tr role="row" class="odd">
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td style="text-align: center;">Nguyễn Văn B</td>
                            </tr-->
								</tbody>
							</table>
							<input type="hidden" id="buildingId" name="buildingId" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							id="btnAssignBuilding">Lưu thay đổi</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script>
    function assignmentBuilding(buildingId) {
        openModalAssignmentBuilding();
        loadStaffOfBuilding(buildingId);
        
        $('#buildingId').val(buildingId);
        console.log($('#buildingId').val());
    }

    function openModalAssignmentBuilding() {
        $('#assignmentBuildingModal').modal();
    }

    $('#btnAssignBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        //get checkbox
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function() {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        assignStaff(data);
    });

    function assignStaff(data) {
        $.ajax({
            type: "PUT",
            url : '${formUrl}/staffs',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (response) {
                console.log('success');
                
            },
            error: function (response) {
                console.log('failed');
                console.log(response);
            }
        });
    }

    function loadStaffOfBuilding(buildingId) {
        $.ajax({
            type: "GET",
            url : '${formUrl}/'+buildingId+'/staffs',
            //data: JSON.stringify(data),
            dataType: "json",
            //contentType: "json",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, user) {
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" value=' + user.staffId + ' id="checkbox_' + user.staffId + '" ' + user.checked + '/></td>';
                    row += '<td class="text-center">' + user.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
            },
            error: function (response) {
                console.log('failed');
                console.log(response);
            }
        });
    }

   $('#btnSearch').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
   });
</script>

	<script type="text/javascript">
		function btndeleteBuilding() {
			debugger;
			showAlertBeforeDelete(function() {
				event.preventDefault();
				var dataArray = $('tbody input[type=checkbox]:checked').map(
						function() {
							return $(this).val();
						}).get();
				deleteBuilding(dataArray);
			});
		}

		function deleteBuilding(data) {
			debugger;
			$
					.ajax({
						url : '${formUrl}',
						type : 'DELETE',
						dataType : 'json',
						contentType : 'application/json',
						data : JSON.stringify(data),
						success : function() {
							window.location.href = "<c:url value = '/admin/customer-list?message=delete_success&page=1&limit=2'/>";
						},
						error : function() {
							window.location.href = "<c:url value='/admin/customer-list?message=delete_success'/>";
						}
					});
		}
	</script>

</body>
</html>
