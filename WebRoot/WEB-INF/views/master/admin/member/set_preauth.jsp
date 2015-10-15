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

    });
</script>
<title>${system_name}</title>
</head>
<body>
    <form action="${base}/admin/member/set_preauth" method="post">
        <input type="hidden" name="id" value="${user_model.user.id}">
        <table class="detail">
            <thead>
                <tr>
                    <td colspan="2">Set Preauth</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Username</th>
                    <td>${user_model.user.username}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${user_model.archive.name}</td>
                </tr>
                <tr>
                    <th>Preauth</th>
                    <td>
                        <input type="text" name="preauth" id="preauth" value="${user_model.account.preauth}"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="actions">
                        <input type="submit" value="Submit" />
                        <input type="button" value="Back" onclick="history.go(-1);" />
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>