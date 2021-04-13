<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url value="/api/building" var="formUrl" />

<html>
<head>
    <title>Danh sách tòa nhà</title>
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
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="building-list.html">Home</a>
                </li>
                <li class="active">Quản lý Tòa nhà</li>
                <li class="active">Danh sách Tòa nhà</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div id="errorArea">

            </div>
            <div id="infoArea">

            </div>
            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="widget-box">

                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm</h4>

                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form cssClass="form-horizontal" commandName="modelSearch" action="${buildingListURL}" id="listForm" method="GET">
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <label for="name" style="font-weight:bold">Tên tòa nhà</label>
                                                <form:input path="name" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-6">
                                                <label for="areaRent" style="font-weight:bold">Diện tích sàn</label>
                                                <form:input path="areaRent" cssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <div style="width: 3.6cm;">
                                                    <label style="font-weight:bold">Quận hiện có</label>
                                                    <form:select cssClass="form-control" path="district">
                                                        <form:option value="" label="--- Chọn quận ---"/>
                                                        <form:options items="${mapDistricts}"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="ward" style="font-weight:bold">Phường</label>
                                                <form:input path="ward" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="street" style="font-weight:bold">Đường</label>
                                                <form:input path="street" cssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <label for="numberOfBasement" style="font-weight:bold">Số tầng hầm</label>
                                                <form:input path="numberOfBasement" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="direction" style="font-weight:bold">Hướng</label>
                                                <form:input path="direction" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="level" style="font-weight:bold">Hạng</label>
                                                <form:input path="level" cssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-3">
                                                <label for="areaRentFrom" style="font-weight:bold">Diện tích từ</label>
                                                <form:input path="areaRentFrom" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-3">
                                                <label for="areaRentTo" style="font-weight:bold">Diện tích đến</label>
                                                <form:input path="areaRentTo" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-3">
                                                <label for="costRentFrom" style="font-weight:bold">Giá thuê từ</label>
                                                <form:input path="costRentFrom" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-3">
                                                <label for="costRentTo" style="font-weight:bold">Giá thuê đến</label>
                                                <form:input path="costRentTo" cssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <label for="managerName" style="font-weight:bold">Tên quản lý</label>
                                                <form:input path="managerName" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="managerPhone" style="font-weight:bold">Điện thoại quản lý</label>
                                                <form:input path="managerPhone" cssClass="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="width: 5.9cm;">
                                                    <label style="font-weight:bold">Chọn nhân viên phụ trách</label>
                                                    <form:select cssClass="form-control" path="staffId">
                                                        <form:option value="" label="--- Chọn nhân viên phụ trách ---"/>
                                                        <form:options items="${mapStaffs}"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <div class="chkboxType">
                                                    <form:checkboxes path="buildingTypes" element="span class='lbl'" items="${mapTypes}"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <button type="button" class="btn btn-sm btn-primary" id="btnSearch">
                                                    Tìm kiếm
                                                    <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                                </button>
                                            </div>
                                        </div>
                                </form:form>
                            </div> <!--widget main-->
                        </div>
                    </div> <!--widget box -->

                    <div class="pull-right tableTools-container">
                        <div class="btn-group btn-overlap">
                            <div class="btn-group">
                                <a href='<c:url value='/admin/building-edit'/>'><button data-toggle="tooltip" title="Thêm tòa nhà"
                                           class="btn btn-white btn-info btn-bold"><i class="fa fa-plus-circle"
                                                                                      aria-hidden="true"></i></button></a>
                                <a><button data-toggle="tooltip" title="Xóa tòa nhà"
                                           class="btn btn-white btn-warning btn-bold" style="margin-left: 2px;"><i
                                        class="fa fa-trash" aria-hidden="true"></i></button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- TABLE -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="space space-30"></div>
                    <table id="buildingList" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên tòa nhà</th>
                            <th>Số tầng hầm</th>
                            <th>Địa chỉ</th>
                            <th>Số điện thoại</th>
                            <th>Diện tích sàn</th>
                            <th>D.T trống</th>
                            <th>Giá thuê</th>
                            <th>Phí dịch vụ</th>
                            <th>Phí MG</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${buildings}">
                                <tr role="row" class="odd">
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" value="${item.id}" id="checkbox_${item.id}"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td>${item.name}</td>
                                    <td>${item.numberOfBasement}</td>
                                    <td>${item.street}, ${item.ward}, ${item.district}</td>
                                    <td>Test</td>
                                    <td>${item.buildingArea}</td>
                                    <td>Test</td>
                                    <td>Test</td>
                                    <td>Test</td>
                                    <td>Test</td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-sm btn-primary">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                            </button>
											<c:url var="editbuilding" value="/admin/building-edit" />
                                            <a class="btn btn-sm btn-primary" href="${editbuilding}-${item.id}">
                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
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
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div> <!-- /.main-content -->

<!-- Modal -->
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
                    <button type="button" class="btn btn-default" id="btnAssignBuilding">Lưu thay đổi</button>
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

</body>
</html>
