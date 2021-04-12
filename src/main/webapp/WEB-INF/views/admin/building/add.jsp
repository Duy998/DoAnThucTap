<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="createBuilding" value="/api/building"/>

<html>
<head>
    <title>Chỉnh sửa tòa nhà</title>
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
                <li class="active">Tòa nhà</li>
                <li class="active">Thêm mới Tòa nhà</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <form:form cssClass="form-horizontal" commandName="building" action="${createBuilding}" id="formAdd" method="POST">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="name">Tên tòa nhà</label>

                            <div class="col-sm-9">
                                <form:input path="name" cssClass="form-control"/>
                                <!--input type="text" id="name" class="form-control" name="name" value=""/-->
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="district">Quận</label>

                            <div class="col-sm-9">
                                <div style="width: 4.2cm;">
                                    <form:select cssClass="form-control" path="district">
                                        <form:option value="" label="--- Chọn quận ---"/>
                                        <form:options items="${mapDistricts}"/>
                                    </form:select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="ward">Phường</label>

                            <div class="col-sm-9">
                                <form:input path="ward" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="street">Đường</label>

                            <div class="col-sm-9">
                                <form:input path="street" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="structure">Kết cấu</label>

                            <div class="col-sm-9">
                                <form:input path="structure" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="numberOfBasement">Số tầng hầm</label>

                            <div class="col-sm-9">
                                <form:input path="numberOfBasement" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="floorArea">Diện tích sàn</label>

                            <div class="col-sm-9">
                                <form:input path="floorArea" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="direction">Hướng</label>

                            <div class="col-sm-9">
                                <form:input path="direction" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="level">Hạng</label>

                            <div class="col-sm-9">
                                <form:input path="level" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="areaRent">Diện tích thuê</label>

                            <div class="col-sm-9">
                                <form:input path="areaRent" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="areaRentDescription">Mô tả diện tích</label>

                            <div class="col-sm-9">
                                <form:input path="areaRentDescription" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="costRent">Giá thuê</label>

                            <div class="col-sm-9">
                                <form:input path="costRent" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="costDescription">Mô tả giá</label>

                            <div class="col-sm-9">
                                <form:input path="costDescription" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="serviceCost">Phí dịch vụ</label>

                            <div class="col-sm-9">
                                <form:input path="serviceCost" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="carCost">Phí ô tô</label>

                            <div class="col-sm-9">
                                <form:input path="carCost" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="motorbikeCost">Phí mô tô</label>

                            <div class="col-sm-9">
                                <form:input path="motorbikeCost" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="overtimeCost">Phí ngoài giờ</label>

                            <div class="col-sm-9">
                                <form:input path="overtimeCost" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="electricityCost">Tiền điện</label>

                            <div class="col-sm-9">
                                <form:input path="electricityCost" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="deposit">Đặt cọc</label>

                            <div class="col-sm-9">
                                <form:input path="deposit" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="payment">Thanh toán</label>

                            <div class="col-sm-9">
                                <form:input path="payment" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="timeRent">Thời hạn thuê</label>

                            <div class="col-sm-9">
                                <form:input path="timeRent" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="timeDecorator">Thời gian trang trí</label>

                            <div class="col-sm-9">
                                <form:input path="timeDecorator" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="brokerageFee">Phí môi giới</label>

                            <div class="col-sm-9">
                                <input type="text" id="brokerageFee" class="form-control" name="brokerageFee" value=""/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Loại tòa nhà</label>
                            <div class="col-sm-9" id="formBuildingTypes">
                                <div class="chkboxType">
                                    <form:checkboxes path="buildingTypes" element="span class='lbl'" items="${mapTypes}"/>
                                </div>
                            </div>
                        </div>
                        <!--
                        <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="note">Ghi chú
                        </label>

                        <div class="col-sm-9">
                        <input type="text" id="level" class="form-control">
                        </div>
                        </div>

                        <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="productLink">Link sản phẩm
                        </label>

                        <div class="col-sm-9">
                        <input type="text" id="level" class="form-control">
                        </div>
                        </div>
                        -->
                        <!--
                        <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="level">Bản đồ
                        </label>

                        <div class="col-sm-9">
                        <input type="text" id="level" class="form-control">
                        </div>
                        </div>

                        <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="level">Hình đại diện
                        </label>

                        <div class="col-sm-9">
                        <input type="text" id="level" class="form-control">
                        </div>
                        </div>
                        -->
                        <div class="btn-group pull-right">
                            <button class="btn btn-primary btn-bold" id="btnAddBuilding">
                                Thêm tòa nhà
                            </button>

                            <a type="button" class="btn btn-warning btn-bold" href="/admin/building-list">Hủy</a>
                            <!--button type="button" class="btn btn-warning btn-bold">
                                Hủy
                            </button-->

                        </div>
                    </form:form>
                </div>
            </div><!-- /.row -->
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<script>

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
