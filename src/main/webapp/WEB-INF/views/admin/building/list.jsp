<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="formAjax" value="/api/building"/>
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

            <div class="row">
                <div class="col-xs-12">
                    <div id="infoArea" style="color: #1d6fa6">

                    </div>
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
                                                <label for="floorArea" style="font-weight:bold">Diện tích sàn</label>
                                                <form:input path="floorArea" cssClass="form-control"/>
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

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <a href='<c:url value='/admin/building-new'/>'>
                                    <button data-toggle="tooltip" title="Thêm tòa nhà" class="btn btn-white btn-info btn-bold">
                                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                    </button>
                                </a>
                                    <button id="btnDeleteBuilding" data-toggle="tooltip" title="Xóa tòa nhà"
                                            onclick="warningBeforeDelete()"
                                            class="btn btn-white btn-warning btn-bold">
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                    </button>
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
                                    <input type="checkbox" id="checkboxAll">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Ngày</th>
                            <th>Tên tòa nhà</th>
                            <th>Địa chỉ</th>
                            <th>Hướng</th>
                            <th>Loại tòa nhà</th>
                            <th>Diện tích sàn</th>
                            <th>Diện tích thuê</th>
                            <th>Mô tả</th>
                            <th>Nhân viên quản lý</th>
                            <th>Giá thuê</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${buildings}">
                                <tr role="row" class="odd">
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" name="id" value="${item.id}" id="checkbox_${item.id}"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td><fmt:formatDate value="${item.modifiedDate}" pattern="dd/MM/yyyy"/></td>
                                    <td>${item.name}</td>
                                    <td>${item.address}</td>
                                    <td>${item.direction}</td>
                                    <td>${item.buildingTypesConverted}</td>
                                    <td>${item.floorArea}</td>
                                    <td>${item.areaRent}</td>
                                    <td>${item.areaRentDescription}</td>
                                    <td>${item.staffsNameAndPhoneConverted}</td>
                                    <td>${item.costRent}</td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-sm btn-primary">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                            </button>


                                            <a type="button" class="btn btn-sm btn-primary" title="Chỉnh sửa"
                                               href="/admin/building-edit-${item.id}">
                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>


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
            </div> <!-- Table ENDS -->
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

    function loadStaffOfBuilding(buildingId) {
        var data = {};
        data['buildingId'] = buildingId;
        $.ajax({
            type: "POST",
            url: '/api/staffs',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (response) {
                var row = '';
                $.each(response, function (index, user) {
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" value=' + user.id + ' id="checkbox_' + user.id + '" ' + user.checked + '/></td>';
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
            type: "POST",
            url: "http://localhost:8081/api-user-assignment",
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

    // function warningBeforeDelete() {
    //     showAlertBeforeDelete(function () {
    //         var data = {};
    //         var buildingIds = $('#buildingList').find('tbody input[type=checkbox]:checked').map(function() {
    //             return $(this).val();
    //         }).get();
    //         data.lstBuildingId = buildingIds;
    //         deleteBuilding(data);
    //     });
    // }

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();
        //var data = {};
        var buildingIds = $('#buildingList').find('tbody input[type=checkbox]:checked').map(function() {
            return $(this).val();
        }).get();
        //data.lstBuildingId = buildingIds;

        //deleteBuilding(data);
        deleteBuilding(buildingIds);
    });
    //
    // function warningBeforeDelete() {
    //     showAlertBeforeDelete(function () {
    //         event.preventDefault();
    //         var dataArray = $('tbody input[type=checkbox]:checked').map(function () {
    //             return $(this).val();
    //         }).get();
    //         deleteUser(dataArray);
    //     });
    // }

    function deleteBuilding(data) {
        $.ajax({
            type: "DELETE",
            url: '${formAjax}',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (response) {               // Store
                //localStorage.setItem("message", "You deleted the building successfully!");
                window.location.href = "http://localhost:8080/admin/building-list";
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

    $('#checkboxAll').click(function (e) {
        e.preventDefault();
        if ($(this).is(":checked"))
            $('.chkCheckBoxId').prop('checked', true);
        else
            $('.chkCheckBoxId').prop('checked', false);
    });
</script>

</body>
</html>
