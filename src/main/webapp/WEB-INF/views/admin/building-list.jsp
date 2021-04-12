<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingListURL" value="/admin/building-list"/>
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 3/12/2021
  Time: 11:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tìm kiếm tòa nhà</title>
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
                                <form:form commandName="modelSearch" action="${buildingListURL}" id="listForm" method="GET">
                                    <div class="form-horizontal" id="formList">
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <div>
                                                    <label for="name" class="lblTitle">Tên tòa nhà</label>

                                                    <form:input path="name" cssClass="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div>
                                                    <label for="rentArea" class="lblTitle">Diện tích sàn</label>
                                                    <input type="number" class="form-control" id="rentArea">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <div style="width: 3.7cm;">
                                                    <label for="district">Quận hiện có</label>
                                                    <select class="form-control" id="district">
                                                        <option>--- Chọn quận ---</option>
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>4</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="ward">Phường</label>
                                                    <input type="text" class="form-control" id="ward"></input>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="street">Đường</label>
                                                    <input type="text" class="form-control" id="street"></input>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="numberOfBasements">Số tầng hầm</label>
                                                    <input type="number" class="form-control"
                                                           id="numberOfBasements"></input>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="direction">Hướng</label>
                                                    <input type="text" class="form-control" id="direction"></input>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="level">Hạng</label>
                                                    <input type="text" class="form-control" id="level"></input>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-3">
                                                <div>
                                                    <label for="areaFrom">Diện tích từ</label>
                                                    <input type="number" class="form-control" id="areaFrom"></input>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div>
                                                    <label for="areaTo">Diện tích đến</label>
                                                    <input type="number" class="form-control" id="areaTo"></input>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div>
                                                    <label for="rentPriceFrom">Giá thuê từ</label>
                                                    <input type="number" class="form-control"
                                                           id="rentPriceFrom"></input>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div>
                                                    <label for="rentPriceTo">Giá thuê đến</label>
                                                    <input type="number" class="form-control" id="rentPriceTo"></input>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="managerName">Tên quản lý</label>
                                                    <input type="text" class="form-control" id="managerName"></input>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="phoneManager">Điện thoại quản lý</label>
                                                    <input type="text" class="form-control" id="phoneManager"></input>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div style="width: 6.5cm;">
                                                    <label for="">Chọn nhân viên phụ trách</label>
                                                    <select class="form-control" id="">
                                                        <option>--- Chọn nhân viên phụ trách ---</option>
                                                        <option>Nguyễn Văn A</option>
                                                        <option>Nguyễn Văn B</option>
                                                        <option>Nguyễn Văn C</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <label>
                                                    <input name="form-field-checkbox" type="checkbox" class="ace">
                                                    <span class="lbl">Tầng trệt</span>
                                                </label>
                                                <label>
                                                    <input name="form-field-checkbox" type="checkbox" class="ace">
                                                    <span class="lbl">Nguyên căn</span>
                                                </label>
                                                <label>
                                                    <input name="form-field-checkbox" type="checkbox" class="ace">
                                                    <span class="lbl">Nội thất</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <button type="button" class="btn btn-sm btn-success" id="btnSearching">
                                                    Tìm kiếm
                                                    <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>


                    <div class="pull-right tableTools-container">
                        <div class="btn-group btn-overlap">
                            <div class="btn-group">
                                <a><button data-toggle="tooltip" title="Thêm tòa nhà"
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
                    <table id="simple-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th style="width: 5cm;">Tên sản phẩm</th>
                            <th style="width: 7cm;">Địa chỉ</th>
                            <th>Tên quản lý</th>
                            <th>Số điện thoại</th>
                            <th>D.T sàn</th>
                            <th style="width: 7cm;">D.T trống</th>
                            <th>Giá thuê</th>
                            <th>Phí dịch vụ</th>
                            <th>Phí MG</th>
                            <th style="width: 4cm;">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr role="row" class="odd">
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>Nam Giao Building Tower</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <button class="btn btn-sm btn-primary">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                    </button>

                                    <button class="btn btn-sm btn-primary">
                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    </button>

                                    <button class="btn btn-sm btn-primary" data-toggle="tooltip"
                                            title="Giao tòa nhà">
                                        <i class="fa fa-share-square-o" aria-hidden="true"
                                           onclick="assignmentBuilding()"></i>
                                    </button>

                                    <button class="btn btn-sm btn-primary">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr role="row" class="odd">
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>ACM Tower</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <button class="btn btn-sm btn-primary">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                    </button>

                                    <button class="btn btn-sm btn-primary">
                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    </button>

                                    <button class="btn btn-sm btn-primary" data-toggle="tooltip"
                                            title="Giao tòa nhà">
                                        <i class="fa fa-share-square-o" aria-hidden="true"
                                           onclick="assignmentBuilding()"></i>
                                    </button>

                                    <button class="btn btn-sm btn-primary">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
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
                    <button type="button" class="btn btn-default">Lưu thay đổi</button>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    function assignmentBuilding() {
        openModalAssignmentBuilding();
        loadStaffOfBuilding();
        $('#buildingId').val(buildingId);
        console.log($('#buildingId').val());
    }

    function openModalAssignmentBuilding() {
        $('#assignmentBuildingModal').modal();
    }

    function loadStaffOfBuilding() {
        $.ajax({
            type: "GET",
            url: "http://localhost:8081/api/demo",
            //data: JSON.stringify(data),
            dataType: "json",
            //contentType: "json",
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

    $('#btnSearching').click(function (e) {
        e.preventDefault();
        ${'#listForm'}.submit();
    });
</script>

</body>
</html>
