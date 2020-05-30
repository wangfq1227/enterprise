<%@ page import="com.enterprise.entity.ArticleCategory" %>
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
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner/news.png)">

</div>
<div style="background-color: white;opacity: 0.9;filter:Alpha(opacity=50);">
    <div class="warp_main">
        <div class="abt_cent_cont">
            <p>
                <a href="<%=path%>/index">首页</a><span>/</span>
                新闻中心<span>/</span>
                <%
                    String code = (String)request.getAttribute("code");
                    if (code != null && code.length() != 0 ) {
                        for (ArticleCategory ac : SystemManage.getInstance().getArticleCategory()) {
                            if ((ac.getCode()).equals(code)) {
                %>
                <%=ac.getCatename()%>
                <%
                                break;
                            }
                        }
                    }
                %>
            </p>
        </div>
        <div class="warp_left">
            <div class="left-box">
                <span>新闻中心</span>
                <ul>
                    <c:forEach var="item" items="<%=SystemManage.getInstance().getArticleCategory()%>">
                        <c:if test="${fn:startsWith(item.code,'News')}">
                            <li <c:if test="${!empty code && code eq item.code}">class="active"</c:if> ><a href="<%=path%>/article/${item.code}"><i></i>${item.catename}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="warp_right">
            <div class="breadcrumb">
                <%
                    String cateName = (String)request.getAttribute("cateName");
                    if (cateName != null && cateName.length() != 0 ) {
                %>
                <h3 ><%=cateName%></h3>
                <%
                    }
                %>
            </div>
            <div style="overflow: hidden;margin-left: 50px;">
                <c:forEach var="item" items="${pager.list}">
                    <div>
                        <div class="news-i-d-l">
                            <span>${fn:substring(item.createtime, 0, 4)}</span>
                            <span>${fn:substring(item.createtime, 5, 10)}</span>
                        </div>
                        <div class="article_item">
                            <h2><a href="<%=path%>/article/${item.id}">${item.title}</a></h2>
                            <a href="<%=path%>/article/${item.id}"><span>${item.description}…</span></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div style="margin-top: 20px;">
                <%@include file="/front/common/page.jsp" %>
            </div>
        </div>
    </div>
</div>

<%@include file="/front/common/sharebuttonbox.jsp" %>
<%@include file="/front/common/foot.jsp" %>
