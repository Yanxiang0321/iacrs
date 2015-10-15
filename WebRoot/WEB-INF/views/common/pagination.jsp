<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c-rt.tld"%>
<c:set var="pa" value="${paginationModel}"></c:set>
<c:set var="p" value="${paginationModel.pagination}"></c:set>
<script type="text/javascript">
    function gotoPage()
    {
        var page = document.getElementById("Page").value;
        var regex = /^[1-9][\d]*$/;
        
        //if less than one return 1
        if (!regex.test(page))
        {
            page = 1;
        }

        $("body").append('<form id="goto_form" action="" method="POST" style="display:none;"></form>');
        $("#goto_form").attr("action",'${pa.forwardPageUrl}' + page);
        $("#goto_form").submit();
    }
</script>
<table class="pagination">
        <tr>
            <td>
                <c:set var="count" value="${p.totalCount}"></c:set>
                number： <font color="#ff0000">${p.pageNo}</font>/${p.totalPage}&nbsp;&nbsp;all&nbsp;
                <font color="#ff0000">${count}</font>&nbsp;messages&nbsp;&nbsp;&nbsp; 
                <c:choose>
                    <c:when test="${pa.firstEnable}">
                        <a href="${pa.forwardFirstURL}">first</a>&nbsp; 
                    </c:when>
                    <c:otherwise>
                        <span style="color:#aaa;">first</span>&nbsp; 
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${pa.prevEnable}">
                        <a href="${pa.forwardPrevURL}">previous</a>&nbsp; 
                    </c:when>
                    <c:otherwise>
                        <span style="color:#aaa;">previous</span>&nbsp; 
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${pa.nextEnable}">
                        <a href="${pa.forwardNextURL}">next</a>&nbsp; 
                    </c:when>
                    <c:otherwise>
                        <span style="color:#aaa;">next</span>&nbsp; 
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${pa.lastEnable}">
                        <a href="${pa.forwardLastURL}">last</a>&nbsp; 
                    </c:when>
                    <c:otherwise>
                        <span style="color:#aaa;">last</span>&nbsp; 
                    </c:otherwise>
                </c:choose>
                                           go to <input id="Page" style="width:20px;" height="15" value="${p.pageNo}" name="Page" />page
                <input onclick="gotoPage()" type="button" value="GO" name="GoPage" class="button_50"/>
            </td>
        </tr>
</table>