<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c-rt.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${system_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${base}/css/global.css" type="text/css" rel="Stylesheet" />
<script src="${thirdparty}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function()
    {

    });
</script>
</head>
<body>
    <div class="list-container">
        <h2>
            <label>User List</label>
        </h2>
        <table class="default">
            <thead>
                <tr>
                    <td>Username</td>
                    <td>Name</td>
                    <td>ID</td>
                    <td>Phone Number</td>
                    <td>E-mail</td>
                    <td>Account Balance</td>
                    <td>Preauth</td>
                    <td>Account State</td>
                    <td>Operation</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="record" items="${paginationModel.pagination.records}">
                    <tr>
                        <td>${record.user.username}</td>
                        <td>${record.archive.name}</td>
                        <td>${record.archive.idcardno}</td>
                        <td>${record.archive.phone}</td>
                        <td>${record.archive.email}</td>
                        <td>${record.account.balance}</td>
                        <td>${record.account.preauth}</td>
                        <td>${record.user.disabled?'Disabled':'Enabled'}</td>
                        <td>
                            <c:choose>
                                <c:when test="${record.user.disabled}">
                                    <a href="${base}/admin/member/set_state?id=${record.user.id}&disabled=0">Enabled</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${base}/admin/member/set_state?id=${record.user.id}&disabled=1">Disabled</a>
                                </c:otherwise>
                            </c:choose>
                            <a href="${base}/admin/member/forward_set_preauth?id=${record.user.id}">Preauth</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="9">
                        <c:import url="../../../common/pagination.jsp"></c:import>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>