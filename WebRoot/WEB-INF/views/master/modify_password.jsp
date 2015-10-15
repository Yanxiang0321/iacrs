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
        $('#btn_register').click(function()
        {
            window.location = '${base}/forward_register';
        });
    });
</script>
<title>${system_name}</title>
</head>
<body>
    <form action="${base}/master/modify_password" method="post">
        <table class="detail">
            <thead>
                <tr>
                    <td colspan="2">Change Password</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Original Password</th>
                    <td>
                        <input type="password" name="oldPassword" id="oldPassword" />
                    </td>
                </tr>
                <tr>
                    <th>New Password</th>
                    <td>
                        <input type="password" name="newPassword" />
                    </td>
                </tr>
                <tr>
                    <th>Confirm Password</th>
                    <td>
                        <input type="password" name="c_newPassword" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="actions">
                        <input type="submit" value="Submit" />
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>