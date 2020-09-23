<%@ page import="com.enterprise.entity.Service" %>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/front/common/common.jsp" %>
<style>
    span{
        margin-right: 10px;
    }
</style>
<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner/company.png)">
</div>
<div style="background-color: white;opacity: 0.9;filter:Alpha(opacity=50);width: 900px;margin: 0 auto;">
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