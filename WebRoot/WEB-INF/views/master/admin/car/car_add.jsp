<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        $('#btn_select').click(function()
        {
            var features = 'dialogWidth=800px;dialogHeight=600px;help=0;status=0;scroll=0;center=1;';
            var result = window.showModalDialog('${base}/admin/car/model_list_select', {}, features);
            $('#model_id').attr('value', result.id);
            $.get('${base}/admin/car/model_info', {
                id : result.id
            }, function(data)
            {
                if (data.id != 'undefined')
                {
                    $('#model_name').attr('value', data.name);
                    $('#dailyRental').attr('value', data.dailyRental);
                    $('#dailyPremium').attr('value', data.dailyPremium);
                    $('#preauth').attr('value', data.preauth);
                }
            });
        });
    });
</script>
</head>
<body>
    <form action="${base}/admin/car/add_car" method="post">
        <input type="hidden" id="model_id" name="modelId" />
        <table class="detail">
            <thead>
                <tr>
                    <td colspan="2">Add Car</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Model</th>
                    <td>
                        <input type="text" id="model_name" disabled="disabled" />
                        <input type="button" id="btn_select" value="select" />
                    </td>
                </tr>
                <tr>
                    <th>Daily Renta($)</th>
                    <td>
                        <input type="text" name="dailyRental" id="dailyRental" />
                    </td>
                </tr>
                <tr>
                    <th>Daily Premium($)</th>
                    <td>
                        <input type="text" name="dailyPremium" id="dailyPremium" />
                    </td>
                </tr>
                <tr>
                    <th>Preauth</th>
                    <td>
                        <input type="text" name="preauth" id="preauth" />
                    </td>
                </tr>
                <tr>
                    <th>Plate Number</th>
                    <td>
                        <input type="text" name="licencePlate" />
                    </td>
                </tr>
                <tr>
                    <th>GPS ID</th>
                    <td>
                        <input type="text" name="gpsid" />
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