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
    <table class="detail">
        <thead>
            <tr>
                <td colspan="4">Detail</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Name</th>
                <td>${user_model.archive.name}</td>
                <th>ID</th>
                <td>${user_model.archive.idcardno}</td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td>${user_model.archive.phone}</td>
                <th>E-mail</th>
                <td>${user_model.archive.email}</td>
            </tr>
            <tr>
                <th>Address</th>
                <td colspan="3">${user_model.archive.address}</td>
            </tr>
        </tbody>
    </table>
    <table class="detail">
        <thead>
            <tr>
                <td colspan="4">Detail</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Account Balance</th>
                <td>${user_model.account.balance}&nbsp;&nbsp;&nbsp;&nbsp;<a href="${base}/subscriber/forward_charge">Charge</a></td>
            </tr>
            <tr>
                <th>Preauth</th>
                <td>${user_model.account.preauth}</td>
            </tr>
        </tbody>
    </table>
    <div class="list-container">
        <h2>
            <label>Latest Record</label>
        </h2>
        <table class="default">
            <thead>
                <tr>
                    <td>Amount</td>
                    <td>Charge Time</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="record" items="${charge_records}">
                    <tr>
                        <td>${record.amount}</td>
                        <td>${record.chargeTime}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="list-container">
        <h2>
            <label>Latest Amount Record</label>
        </h2>
        <table class="default">
            <thead>
                <tr>
                    <td>Model</td>
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
                <c:forEach var="record" items="${rent_bills}">
                    <tr>
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
            </tbody>
        </table>
    </div>
</body>
</html>