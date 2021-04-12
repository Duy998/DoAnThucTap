<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="createCustomer" value="/api/customer"/>

<html>
<head>
    <title>Thêm khách hàng</title>
</head>
<body>

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
                <li class="active">Quản lý khách hàng</li>
                <li class="active">Thêm mới khách hàng</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <form:form cssClass="form-horizontal" modelAttribute="customer" action="${createCustomer}" id="formAdd" method="POST">
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
                            <label class="col-sm-3 control-label no-padding-right" for="demand">Nhu cầu</label>

                            <div class="col-sm-6">
                                <form:input path="demand" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="btn-group pull-right">
                            <button class="btn btn-primary btn-bold" id="btnAddUser">
                                Thêm khách hàng
                            </button>

                            <a type="button" class="btn btn-warning btn-bold" href="/admin/customer-list">Hủy</a>
                        </div>
                    </form:form>
                </div>
            </div><!-- /.row -->
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<script>
    $(document).ready(() => {
        console.log("Ready");
    });

    $('#btnAddUser').click(function (e) {
        e.preventDefault();
        // var name = $('name').value();
        var data = {};
        var formData = $('#formAdd').serializeArray();
        $.each(formData, function (index, v) {
            if (v.value != '' && v.value != null) {
                data['' + v.name + ''] = v.value;
            }
        });
        $.ajax({
            type: 'POST',
            url: '/api/customer',
            data: JSON.stringify(data),
            dataType: "json", // data from Server to Client
            contentType: "application/json", // data from Client to Server
            success: function (response) {
                window.location.href = "<c:url value='/admin/customer-list'/>";
            },
            error: function (response) {
                console.log('failed');
                console.log(response);
            }
        });
    });

    function assignmentBuilding() {
        openModalAssignmentBuilding();
    }

    function openModalAssignmentBuilding() {
        $('assignmentBuildingModal').modal();
    }
</script>
<script type='text/javascript' src="/admin/index.js"></script>
</body>
</html>
