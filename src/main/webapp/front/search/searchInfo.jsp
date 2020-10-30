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
        position: relative;
        float: left;
        margin-top: 50px;
        margin-left: 10%;
    }
</style>

<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner/search.png)">

</div>
<script type="text/javascript">
    function search1(){
        var keyword=$("#sear1").val();
        location.href = "<%=path%>/article/search?keyword="+keyword;
    };
</script>
<div style="background-color: white;opacity: 0.9;filter:Alpha(opacity=50);width: 1080px;margin: 0 auto;">
    <div class="warp_main">
        <div class="sear" style="margin-top: 30px;">
            <input type="text" id="sear1" name="search" class="form-control" placeholder="搜索……" style="width: 300px;"/>
            <input type="submit" name="submit" value="搜索" class="btn" onclick="search1()" style="width: 60px;margin-left: 10px;"
                   onmouseover="this.style.backgroundColor='#d5000f';" onmouseout="this.style.backgroundColor=''">
        </div>
        <div class="search-content">
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
</div>
<%@include file="/front/common/sharebuttonbox.jsp" %>
<%@include file="/front/common/foot.jsp" %>