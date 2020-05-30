<%@ page import="com.enterprise.entity.Service" %>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/front/common/common.jsp" %>
<style>
    .left-box span {
        font-size: 24px;
        color: #333;
    }
    .left-box ul{
        margin-top: 20px;
    }
    .left-box ul li {
        line-height: 42px;
        border-top: 1px solid #ccc;
    }
    .left-box li i {
        display: inline-block;
        width: 2px;
        height: 10px;
        background: #ccc;
        font-size: 0;
        margin: 0 10px;
    }
    .left-box li a {
        font-size: 14px;
        color: #333;
        font-weight: 600;
    }
    .left-box li a:hover{
        color: #d5000f;
    }
    .abt_cent_cont p {
        font-size: 14px;
        color: #333;
        margin-bottom: 20px;
        font-weight: bold;
    }
    span{
        margin-left: 10px;
        margin-right: 10px;
    }
    .breadcrumb h3 {
        font-size: 36px;
        color: #c19f63;
        margin-bottom: 50px;
        font-weight: normal;
    }
</style>
<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner/company.png)">
</div>
<div style="background-color: white;opacity: 0.9;filter:Alpha(opacity=50);">
    <div class="warp_main">
        <div class="abt_cent_cont">
            <p>
                <a href="<%=path%>/index">首页</a><span>/</span>
                关于我们<span>/</span>
                <%
                    String id = (String)request.getAttribute("id");
                    for (Service ac : SystemManage.getInstance().getService()) {
                        if ((String.valueOf(ac.getId())).equals(id)) {
                %>
                <%=ac.getTitle()%>
                <%
                            break;
                        }
                    }
                %>
            </p>
        </div>
        <div class="warp_left">
            <div class="left-box">
                <span>关于我们</span>
                <ul>
                    <c:forEach var="item" items="<%=SystemManage.getInstance().getService()%>">
                        <li <c:if test="${!empty id && id eq item.id}">class="active"</c:if> ><a href="<%=path%>/service/${item.id}"><i></i>${item.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="warp_right">
            <div class="breadcrumb">
                    <%
                        String id1 = (String)request.getAttribute("id");
                        for (Service ac : SystemManage.getInstance().getService()) {
                            if ((String.valueOf(ac.getId())).equals(id1) && Integer.valueOf(id1) >0 && Integer.valueOf(id1) <=2) {
                    %>
                    <h3><%=ac.getTitle()%></h3>
                    <%
                                break;
                            }
                        }
                    %>
            </div>
            <div style="overflow: hidden;">
                <div class="article_content">
                    <%
                        for (Service ac : SystemManage.getInstance().getService()) {
                            System.out.println(id);
                            if ((String.valueOf(ac.getId())).equals(id) && Integer.valueOf(id) >0 && Integer.valueOf(id) <=2) {
                    %>
                    <%=ac.getContentHtml()%>
                    <%
                        break;
                    }
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/front/common/sharebuttonbox.jsp" %>
<%@include file="/front/common/foot.jsp"%>