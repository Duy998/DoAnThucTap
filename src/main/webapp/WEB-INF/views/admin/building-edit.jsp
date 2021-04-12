<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 3/13/2021
  Time: 12:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <form class="form-horizontal" role="form" id="formEdit">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="name">Tên tòa nhà
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name">
                            </div>
                        </div>
                        <!--
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="name">Quận
                            </label>

                            <div class="col-sm-9">
                                <div style="width: 3.7cm;">
                                    <select class="form-control" id="district">
                                        <option>--- Chọn quận ---</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>4</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="ward">Phường
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="ward" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="street">Đường
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="street" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="structure">Kết cấu
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="structure" class="form-control">
                            </div>
                        </div>
                        -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="numberOfBasement">Số tầng
                                hầm
                            </label>

                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control"
                                       name="numberOfBasement">
                            </div>
                        </div>
                        <!--
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="floorArea">Diện tích sàn
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="floorArea" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="direction">Hướng
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="direction" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="level">Hạng
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="level" class="form-control">
                            </div>
                        </div>
                        -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentArea">Diện tích thuê
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="rentArea" class="form-control" name="rentArea">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentAreaDescription">Mô tả
                                diện tích
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="rentAreaDescription" class="form-control"
                                       style="height: 2.5cm;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentPrice">Giá thuê
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="rentPrice" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentPriceDescription">Mô tả
                                giá
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="rentPriceDescription" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="serviceCost">Phí dịch vụ
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="serviceCost" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="carFee">Phí ô tô
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="carFee" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="motorFee">Phí mô tô
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="motorFee" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="overTimeFee">Phí ngoài giờ
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="overTimeFee" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="electricityFee">Tiền điện
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="electricityFee" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="deposit">Đặt cọc
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="deposit" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="payment">Thanh toán
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="payment" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentTime">Thời hạn thuê
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="rentTime" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="decorTime">Thời gian trang
                                trí
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="decorTime" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="managerName">Tên quản lý
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="managerName" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="managerPhone">SĐT quản lý
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="managerPhone" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="brokerageFee">Phí môi giới
                            </label>

                            <div class="col-sm-9">
                                <input type="text" id="brokerageFee" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Loại tòa nhà
                            </label>

                            <div class="col-sm-9" id="formBuildingTypes">
                                <div>
                                    <label>
                                        <input name="form-field-checkbox" type="checkbox" class="ace"
                                               value="TANG_TRET" id="buidlingTypes" name="buidlingTypes">
                                        <span class="lbl">Tầng trệt</span>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input name="form-field-checkbox" type="checkbox" class="ace"
                                               value="NGUYEN_CAN" id="buidlingTypes" name="buidlingTypes">
                                        <span class="lbl">Nguyên căn</span>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input name="form-field-checkbox" type="checkbox" class="ace"
                                               value="NOI_THAT" id="buidlingTypes" name="buidlingTypes">
                                        <span class="lbl">Nội thất</span>
                                    </label>
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
                        <div class="form-group pull-right">
                            <div class="col-sm-9">
                                <button class="btn btn-white btn-info btn-bold" id="btnAddBuilding">
                                    Thêm mới Tòa nhà
                                </button>
                            </div>
                        </div>
                    </form>




                </div>
            </div><!-- /.row -->
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<script>
    $('#btnAddBuilding').click(function (e) {
        e.preventDefault();
        // var name = $('name').value();
        var data = {};
        var buildingTypes = [];
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (index, v) {
            if (v.name == 'buildingTypes') {
                buildingTypes.push(v.value);
            } else {
                data['' + v.name + ''] = v.value;
            }
        });
        data['buildingTypes'] = buildingTypes;
        $.ajax({
            type: "POST",
            url: "http://localhost8080/api-building",
            data: JSON.stringify(data),
            dataType: "JSON", // data from Server to Client
            contentType: "JSON", // data from Client to Server
            success: function (response) {
                console.log('success');
            },
            error: function (response) {
                console.log('failed');
                console.log(response);
            }
        });
    });
</script>
</body>
</html>
