<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Registry-${system_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        $('#btn_goback').click(function(){
            window.location = '${base}/forward_login';
        });
    });
</script>
<SCRIPT LANGUAGE=javascript>
function isEmail(strEmail) {
if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
return true;
else
alert("Illegal format");
document.getElementById("email").focus();
}
function isRight(cp) {
if (cp.value!=document.getElementById(password).value){
alert("Password not match");

}
}
function checkNull(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var name = document.getElementById("name").value;
	var text = document.getElementById("text").value;
	var phone = document.getElementById("phone").value;
	var email = document.getElementById("email").value;
	var address = document.getElementById("address").value;
	
	if(username==""||password==""||name==""||text==""||phone==""||email==""||address==""){
		alert("Information not Complete");
		return false;
	}
}
</SCRIPT>
</head>

  <script type="text/javascript">
 var XMLHttpReq;

    function createXMLHttpRequest(){
      if(window.ActiveXObject){
      XMLHttpReq=new ActiveXObject("Microsoft.XMLHTTP");
       }
       else if(window.XMLHttpRequest){
      XMLHttpReq = new XMLHttpRequest();    
       }
         }
    function send(url){
     createXMLHttpRequest();
     XMLHttpReq.open("get",url,true);
     XMLHttpReq.onreadystatechange=proce;     //select the response function
     XMLHttpReq.send(null);    //send request
  
     }
    function proce(){
     if(XMLHttpReq.readyState==4){
     
      if(XMLHttpReq.status==200 || XMLHttpReq.status==0){
      var root=XMLHttpReq.responseXML;

      var res=root.getElementsByTagName("content")[0].childNodes[0].nodeValue;//get response
      var f=root.getElementsByTagName("flag")[0].childNodes[0].nodeValue;//get flag
      document.getElementById("u").innerText = res;
	  //input the username again
      	if(f==0){
      		document.getElementById("username").focus();
      	}
      }else{
       window.alert("Page error!");
       }
       }
       }
    //check user
    function checkUser(){
     var username=document.getElementById("username").value;
      if(username==""){
       alert("Please input your username");
       document.getElementById("username").value = "";
       document.getElementById("username").focus();
       return false;
       }
       else{
    	//alert(username);
        //send('login?name='+name);  
        document.getElementById("u").style.display='';    
        send('CheckUser?username='+username);
        document.getElementById("u").style.display='block';          
        }
	}
</script>


<body>
    <form action="${base}/register"  onsubmit="return checkNull()" method="post">
        <table class="detail" style="width:30%;">
            <thead>
                <tr>
                    <td colspan="2">Register</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Username</th>
                    <td>
                        <input type="text" name="username" id="username" onBlur="checkUser()" required/><div id="u">Auto-Check</div>
                    </td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td>
                        <input type="password" name="password" id="password" required/>
                    </td>
                </tr>
                
                <tr>
                    <th>Name</th>
                    <td>
                        <input type="text" name="name" id="name" required/>
                    </td>
                </tr>
                <tr>
                    <th>IDNumber</th>
                    <td>
                        <input type="text" name="idcardno" id="text" onkeyup="(function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)" required/>
                    </td>
                </tr>
                <tr>
                    <th>PhoneNumber</th>
                    <td>
                        <input type="text" name="phone" id="phone" onkeyup="(function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)" required/>
                    </td>
                </tr>
                <tr>
                    <th>E-mail</th>
                    <td>
                        <input type="text" name="email" id="email" onblur="isEmail(this.value)" required/>
                    </td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>
                        <input type="text" name="address" id="address" required/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="actions">
                        <input type="submit" value="Submit">
                        <input type="button" id="btn_goback" value="Back">
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