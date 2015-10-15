<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c-rt.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${base}/css/global.css" type="text/css" rel="Stylesheet" />
<script src="${thirdparty}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function()
    {
        $('#btn_charge').click(function()
        {
            var userid = $('#user_id').val();
            var amount = $('#amount').val();
            window.open('${base}/subscriber/forward_mock_gateway?amount=' + amount + '&userId=' + userid);
        });
    });
</script>
<title>${system_name}</title>
</head>
<body>
    <input type="hidden" id="user_id" value="${user.id}">
    <table class="detail">
        <thead>
            <tr>
                <td colspan="2">Charge</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Username</th>
                <td>${user.username}</td>
            </tr>
            <tr>
                <th>Amount</th>
                <td>
                    <input type="text" name="amount" id="amount" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="actions">
                    <input type="button" id="btn_charge" value="Submit" />
                    <input type="button" value="Back" onclick="history.go(-1);" />
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>