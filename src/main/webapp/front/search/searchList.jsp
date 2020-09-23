<%@ page import="com.enterprise.entity.ArticleCategory" %>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="/front/common/common.jsp" %>
<style>
    .sear{
        height: 30px;
        margin-left: 25%;
    }
    .sear input{
        float: left;
    }
    .search-content{
        float: left;
        margin-left: 25%;
        margin-top: 50px;
    }
    span{
        margin-right: 10px;
    }
</style>

<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner/search.png)">

</div>
<script type="text/javascript">
    function search2(){
        var keyword=$("#sear2").val();
        location.href = "<%=path%>/article/search?keyword="+keyword;
    };
</script>
<div style="background-color: white;opacity: 0.9;filter:Alpha(opacity=50);width: 900px;margin: 0 auto;">
    <div class="warp_main">
        <div class="sear" style="margin-top: 30px;">
            <input type="text" id="sear2" name="search" class="form-control" placeholder="搜索……" style="width: 300px;"/>
            <input type="submit" name="submit" value="搜索" class="btn" onclick="search2()" style="width: 60px;margin-left: 10px;"
                   onmouseover="this.style.backgroundColor='#d5000f';" onmouseout="this.style.backgroundColor=''">
        </div>
        <div class="search-content">
            <div style="overflow: hidden;">
                <c:forEach var="item" items="${pager.list}">
                    <div>
                        <div class="news-i-d-l">
                            <span>${fn:substring(item.createtime, 0, 4)}</span>
                            <span>${fn:substring(item.createtime, 5, 10)}</span>
                        </div>
                        <div class="article_item">
                            <h2><a href="<%=path%>/article/search/${item.id}">${item.title}</a></h2>
                            <a href="article/search/${item.id}"><span>${item.description}…</span></a>
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
