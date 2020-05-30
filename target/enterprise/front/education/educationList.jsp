<%@ page import="com.enterprise.entity.ArticleCategory" %>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="/front/common/common.jsp" %>
<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner/education.png)">

</div>
<div class="warp_main">
    <div class="abt_cent_cont">
        <p>
            <a href="<%=path%>/index">首页</a><span>/</span>
            红色教育<span>/</span>
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
            <span>红色教育</span>
            <ul>
                <c:forEach var="item" items="<%=SystemManage.getInstance().getArticleCategory()%>">
                    <c:if test="${fn:startsWith(item.code,'Education')}">
                        <li <c:if test="${!empty code && code eq item.code}">class="active"</c:if> ><a href="<%=path%>/article/education/${item.code}"><i></i>${item.catename}</a></li>
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
                        <h2><a href="<%=path%>/article/education/${item.id}">${item.title}</a></h2>
                        <a href="article/education/${item.id}"><span>${item.description}…</span></a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="margin-top: 20px;">
            <%@include file="/front/common/page.jsp" %>
        </div>
    </div>
</div>

<%@include file="/front/common/sharebuttonbox.jsp" %>
<%@include file="/front/common/foot.jsp" %>
