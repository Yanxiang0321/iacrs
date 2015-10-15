<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c-rt.tld"%>
<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="${thirdparty}/dojo/../dijit/themes/claro/claro.css">
	
	<script>dojoConfig = {async: true, parseOnLoad: true}</script>
	<script src='${thirdparty}/dojo/dojo.js'></script>
	
	<script>
	require(["dojo/parser", "dijit/form/ValidationTextBox","dojox/validate/web","dojox/validate/creditCard","dijit/form/ComboBox"]);
	</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${base}/css/global.css" type="text/css" rel="Stylesheet" />
<script src="${thirdparty}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function()
    {
        var submit = function()
        {
            $.post($("#charge_form").attr('action'), $("#charge_form").serialize(), function(result)
            {
                window.close();
            });
        };

        $('#btn_success').click(function()
        {
            $('#success').attr('value', '1');
            submit();
        });

        $('#btn_failure').click(function()
        {
            $('#success').attr('value', '0');
            submit();
        });
    });
</script>
<title>Simulation of Payment Gateway</title>
</head>
<body>
    <form id="charge_form" action="${base}/service/charge_callback">
        <input type="hidden" name="amount" value="${amount}">
        <input type="hidden" name="userId" value="${userId}">
        <input type="hidden" name="success" id="success">
    </form>
    <!-- dojo -->
    <form>
    <table class="detail" style="width: 50%;">
        <thead>
            <tr>
                <td colspan="2">This page is a Simulation of Payment Gateway</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Amount ($)</th>
                <td>${amount}</td>
            </tr>
            <tr>
                <th>Card Number</th>
                <td><input type="text" name="credit" required="true" onkeyup="(function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)"
    data-dojo-type="dijit/form/ValidationTextBox"
    data-dojo-props="regExp:'^4\\d{15}$',
        invalidMessage:'This is not a valid creditcardNum!'"
        /><img src="${base}/images/visa.png" /></td>
            </tr>
            <tr>
                <th>Valid Date</th>
                <td><select  id="date" name="date">
    <option selected>01</option>
    <option>02</option>
    <option>03</option>
    <option>04</option>
    <option>05</option>
    <option>06</option>
    <option>07</option>
    <option>08</option>
    <option>09</option>
    <option>10</option>
    <option>11</option>
    <option>12</option>
</select> / <select  id="year" name="year">
    <option selected>14</option>
    <option>15</option>
    <option>16</option>
    <option>17</option>
    <option>18</option>
    <option>19</option>
    <option>20</option>
    <option>21</option>
    <option>22</option>
    <option>23</option>
    <option>24</option>
</select></td>
            </tr>
            <tr>
                <th>CVV</th>
                <td>    <input id="cvv" name="cvv" required
    data-dojo-type="dijit/form/ValidationTextBox"
    data-dojo-props="regExp:'\\d{3}', invalidMessage:'Invalid CVV.'"
     />
</td>
            </tr>
            <tr>
                <th>Name</th>
                <td><input type ="text" data-dojo-type="dijit/form/ValidationTextBox" required = "true"></td>
            </tr>
            <tr>
                <td class="actions" colspan="2">
                    <input type="button" id="btn_success" value="Successful">
                    <input type="button" id="btn_failure" value="Failing">
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>