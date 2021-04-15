<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.duy.security.utils.SecurityUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href='<c:url value='/admin/building-list'/>' class="navbar-brand">
                <small>
                    <i class="fa fa-home"></i>
                    Trang chủ
                </small>
            </a>

            <nav role="navigation" class="navbar-menu pull-left collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-building"></i>
                            Quản lý Tòa nhà
                            &nbsp;
                            <i class="fa fa-angle-down bigger-110"></i>
                        </a>

                        <ul class="dropdown-menu dropdown-light-blue dropdown-caret">
                            <li>
                                <a href='<c:url value='/admin/building-list'/>'>
                                    Danh sách Tòa nhà
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-user"></i>
                            Quản lý Khách hàng
                            &nbsp;
                            <i class="fa fa-angle-down bigger-110"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-light-blue dropdown-caret">
                            <li>
                                <a href='<c:url value='/admin/customer-list'/>'>
                                    Danh sách Nhân Viên
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#">
                            <i class="fa fa-list-ul"></i>
                            MyList
                        </a>
                    </li>
                    
                    <li>
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-user"></i>
                            Quản lý Tài Khoản
                            &nbsp;
                            <i class="fa fa-angle-down bigger-110"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-light-blue dropdown-caret">
                            <li>
                                <a href='<c:url value='/admin/user-list'/>'>
                                    Danh sách Tài Khoản
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        Xin chào, <%=SecurityUtils.getPrincipal().getFullName()%>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="/admin/profile-<%=SecurityUtils.getPrincipal().getUsername()%>">
                                <i class="ace-icon fa fa-user"></i>
                                <%--<spring:message code="label.account.information"/>--%>
                                Thông tin tài khoản
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/profile-password"/>">
                                <i class="ace-icon fa fa-key"></i>
                                <%--<spring:message code="label.password.change"/>--%>
                                Đổi mật khẩu
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<c:url value='/logout'/>">
                                <i class="ace-icon fa fa-power-off"></i>
                                Thoát
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>