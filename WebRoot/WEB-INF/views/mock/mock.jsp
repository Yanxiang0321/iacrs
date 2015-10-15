<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c-rt.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>${system_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${base}/css/global.css" type="text/css" rel="Stylesheet" />


<!-- Le styles -->
    <link href="${base}/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <link href="${base}/css/bootstrap-responsive.css" rel="stylesheet">

<script src="${thirdparty}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function()
    {
        $('#btn_ok').click(function()
        {
            $.post($("#mock_form").attr('action'), $("#mock_form").serialize(), function(result)
            {
                alert(result);
            });
        });

        $('#btn_position_ok').click(function()
        {
            $.post($("#mock_position_form").attr('action'), $("#mock_position_form").serialize(), function(result)
            {
                alert('successful');
            });
        });
    });
</script>
</head>
<body>
    <form id="mock_form" action="${base}/service/read_card">
        <table class="detail" style="width: 50%;">
            <thead>
                <tr>
                    <td colspan="2">Simulation of Swiping Id Card</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Simulation of GPS ID</th>
                    <td>
                        <input type="text" name="gpsid" value="0555" />
                    </td>
                </tr>
                <tr>
                    <th>Simulation of User ID</th>
                    <td>
                        <input type="text" name="idcardno" style="width: 400px;" value="555-55-5555" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="actions">
                        <input type="button" id="btn_ok" value="Submit">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    <form id="mock_position_form" action="${base}/service/position_feedback">
        <table class="detail" style="width: 50%;">
            <thead>
                <tr>
                    <td colspan="2">Simulation of Receiving Location Information</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Simulation of GPS ID</th>
                    <td>
                        <input type="text" name="gpsid" value="0888" />
                    </td>
                </tr>
                <tr>
                    <th>Longitude</th>
                    <td>
                        <input type="text" name="longitude" value="-71.106657"/>
                    </td>
                </tr>
                <tr>
                    <th>Latitude</th>
                    <td>
                        <input type="text" name="latitude" value="42.333078"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="actions">
                        <input type="button" id="btn_position_ok" value="Submit">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    <script src="${base}/js/bootstrap-transition.js"></script>
    <script src="${base}/js/bootstrap-alert.js"></script>
    <script src="${base}/js/bootstrap-modal.js"></script>
    <script src="${base}/js/bootstrap-dropdown.js"></script>
    <script src="${base}/js/bootstrap-scrollspy.js"></script>
    <script src="${base}/js/bootstrap-tab.js"></script>
    <script src="${base}/js/bootstrap-tooltip.js"></script>
    <script src="${base}/js/bootstrap-popover.js"></script>
    <script src="${base}/js/bootstrap-button.js"></script>
    <script src="${base}/js/bootstrap-collapse.js"></script>
    <script src="${base}/js/bootstrap-carousel.js"></script>
    <script src="${base}/js/bootstrap-typeahead.js"></script>
</body>
</html>