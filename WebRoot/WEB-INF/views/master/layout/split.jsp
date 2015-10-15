<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>frame_split</title>
    <style type="text/css">
    <!--
    html,body {
        height: 100%;
    }
    
    body {
        margin: 0;
        background: rgb(51, 122, 187);
    }
    
    body table {
        width: 9px;
        height: 100%;
        text-align: left;
        border: 0;
    }
    -->
    </style>
    <script>
        function setLeftVisible()
        {
            var mainFrameSet = window.parent.document.getElementById("mainFrameSet");
            var imgObject = document.getElementById("setVisibleImage");
    
            if (mainFrameSet.cols == "0,9,*")
            {
                imgObject.src = "../images/right.gif";
                mainFrameSet.cols = "180,9,*";
            } else
            {
                imgObject.src = "../images/left.gif";
                mainFrameSet.cols = "0,9,*";
            }
        }
    </script>
    </head>
    <body>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div onclick="setLeftVisible()">
                        <img id="setVisibleImage" src="../images/right.gif" width="9" height="50">
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
