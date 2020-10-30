<%@ page import="com.enterprise.entity.ArticleCategory" %>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="/front/common/common.jsp"%>
<style>
    span{
        margin-right: 10px;
    }
</style>
<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner/party.png)">

</div>
<div style="background-color: white;opacity: 0.9;filter:Alpha(opacity=50);;width: 1080px;margin: 0 auto;">
    <div class="warp_main">
        <div class="abt_cent_cont">
            <p>
                <a href="<%=path%>/index">首页</a><span>/</span>
                党建文化<span>/</span>
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
                <span>党建文化</span>
                <ul>
                    <c:forEach var="item" items="<%=SystemManage.getInstance().getArticleCategory()%>">
                        <c:if test="${fn:startsWith(item.code,'Party')}">
                            <li <c:if test="${!empty code && code eq item.code}">class="active"</c:if> ><a href="<%=path%>/article/party/${item.code}"><i></i>${item.catename}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="warp_right">
            <div style="overflow: hidden;">
                <div class="article_content">
                    <h1>${e.title}</h1>
                    <p class="article_message">
                        ${e.createtime} | 分类：${e.catename} | 浏览量：${e.hit}
                    </p>
                    <br>
                    <span style="font-size: 14px">
                        ${e.content}
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/front/common/sharebuttonbox.jsp" %>
<%@include file="/front/common/foot.jsp"%>
