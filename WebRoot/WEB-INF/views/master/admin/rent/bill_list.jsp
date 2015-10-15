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
            <label>Bill Record</label>
        </h2>
        <table class="default">
            <thead>
                <tr>
                    <td>Username</td>
                    <td>Name</td>
                    <td>ID</td>
                    <td>Car Model</td>
                    <td>Plate Number</td>
                    <td>Start Time</td>
                    <td>End Time</td>
                    <td>Duration(Day)</td>
                    <td>Daily Rental($/Day)</td>
                    <td>Daily Premium($/Day)</td>
                    <td>Amount($)</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="record" items="${paginationModel.pagination.records}">
                    <tr>
                        <td>${record.user.user.username}</td>
                        <td>${record.user.archive.name}</td>
                        <td>${record.user.archive.idcardno}</td>
                        <td>${record.car.modelAdapter.model.name}</td>
                        <td>${record.car.car.licencePlate}</td>
                        <td>${record.bill.startTime}</td>
                        <td>${record.bill.endTime}</td>
                        <td>${record.bill.duration}</td>
                        <td>${record.bill.dailyRental}</td>
                        <td>${record.bill.dailyPremium}</td>
                        <td>${record.bill.amount}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="11"><jsp:include page="../../../common/pagination.jsp" /></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>