<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="/front/common/common.jsp"%>
<style>
    span{
        margin-right: 10px;
    }
</style>
<body>
<%@include file="/front/common/navigation.jsp"%>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner/connection.png)"></div>

<div style="background-color: white;opacity: 0.9;filter:Alpha(opacity=50);width: 1080px;margin: 0 auto;">
    <div class="warp_main">
        <div class="warp_right">
            <div class="breadcrumb" style="margin-left: 0px;">
                <h3>联系我们</h3>
            </div>
            <div style="overflow: hidden;">
                <div class="article_content">

                        <c:forEach var="item" items="<%=SystemManage.getInstance().getContact()%>">
                            ${item.contentHtml}
                        </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/front/common/sharebuttonbox.jsp" %>
<%@include file="/front/common/foot.jsp" %>
