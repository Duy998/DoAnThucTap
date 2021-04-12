<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="customerListURL" value="/admin/customer-list"/>
<c:url var="formAjax" value="/api/building"/>
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
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="building-list.html">Home</a>
                </li>
                <li class="active">Quản lý Khách hàng</li>
                <li class="active">Danh sách Khách hàng</li>
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
                                <form:form cssClass="form-horizontal" commandName="model" action="${customerListURL}" id="listForm" method="GET">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="fullName">Tên khách hàng</label>

                                        <div class="col-sm-6">
                                            <form:input path="fullName" cssClass="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="phone">Di động</label>

                                        <div class="col-sm-6">
                                            <form:input path="phone" cssClass="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="phone">Email</label>

                                        <div class="col-sm-6">
                                            <form:input path="email" cssClass="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="users">Chọn nhân viên phụ trách</label>

                                        <div class="col-sm-9">
                                            <form:select cssStyle="width: 5.9cm" cssClass="form-control" path="users">
                                                <form:option value="" label="--- Chọn nhân viên phụ trách ---"/>
                                                <form:options items="${mapStaffs}"/>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div style="padding-left: 10cm" class="col-sm-3 control-label no-padding-right">
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
                                <a href='<c:url value='/admin/customer-new'/>'>
                                    <button data-toggle="tooltip" title="Thêm khách hàng" class="btn btn-white btn-info btn-bold">
                                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                    </button>
                                </a>
                                    <button id="btnDeleteBuilding" data-toggle="tooltip" title="Xóa khách hàng"
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
                            <th>Tên</th>
                            <th>Nhân viên quản lý</th>
                            <th>Email</th>
                            <th>Nhu cầu</th>
                            <th>Người nhập</th>
                            <th>Ngày nhập</th>
                            <th>Tình trạng</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${customers}">
                                <tr role="row" class="odd">
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" name="id" value="${item.id}" id="checkbox_${item.id}"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td>${item.fullName}</td>
                                    <td>Test</td>
                                    <td>${item.email}</td>
                                    <td>${item.demand}</td>
                                    <td>${item.modifiedBy}</td>
                                    <td><fmt:formatDate value="${item.modifiedDate}" pattern="dd/MM/yyyy"/></td>
                                    <td>${item.status}</td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-sm btn-primary">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                            </button>


                                            <a type="button" class="btn btn-sm btn-primary" title="Chỉnh sửa"
                                               href="/admin/customer-edit-${item.id}">
                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>


                                            <button class="btn btn-sm btn-primary" data-toggle="tooltip"
                                                    title="Giao khách hàng">
                                                <i class="fa fa-share-square-o" aria-hidden="true"
                                                   onclick="assignmentCustomer(${item.id})"></i>
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
<div class="modal fade" id="assignmentCustomerModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên giao khách hàng</h4>
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

                            </tbody>
                        </table>
                        <input type="hidden" id="customerId" name="customerId" value="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnAssignCustomer">Lưu thay đổi</button>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    function assignmentCustomer(customerId) {
        openModalAssignmentCustomer();
        loadStaffOfCustomer(customerId);
        $('#customerId').val(customerId);
        console.log($('#customerId').val());
    }

    function openModalAssignmentCustomer() {
        $('#assignmentCustomerModal').modal();
    }

    function loadStaffOfCustomer(customerId) {
        // var data = {};
        // data['customerId'] = customerId;
        $.ajax({
            type: "POST",
            url: '/api/customer-staffmodal',
            data: JSON.stringify(customerId),
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

    $('#btnAssignCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        //get checkbox
        var staffIds = $('#staffList').find('tbody input[type=checkbox]:checked').map(function() {
            return $(this).val();
        }).get();
        data['staffIds'] = staffIds;
        assignCustomer(data);
    });

    function assignCustomer(data) {
        $.ajax({
            type: "POST",
            url: "/api-customer-assignment",
            data: JSON.stringify(data),
            //dataType: "json",
            contentType: "application/json",
            success: function (response) {
                window.location.href = "<c:url value='/admin/customer-list'/>";
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
