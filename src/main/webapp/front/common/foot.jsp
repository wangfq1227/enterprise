<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<style>
    .line-01{
        line-height: 1px;
        border-left: 50px solid #ddd;
        border-right: 150px solid #ddd;
        text-align: center;
    }
    .banners{
        width: 100%;
        margin:0 auto;
        background-color: #E8E8EA;
        border-top: 1px solid #d5000f;
        position: relative;
        height: 185px;
        font-weight: bold;
    }
    .banner-vertical{
        float: left;
        width: 19%;
        /*padding-right: 2%;*/
        font-size: 12px;
        line-height: 1.2;
    }
    .banner-nav-list{
        position: relative;
        margin-top: 10px;
        transform: translate(30%, 0%);
    }
    .banner-nav-title{
        font-size: 15px;
        line-height: 2;
        margin-top: 30px;
    }
    .banner-nav-item{
        margin-top: 18px;
        margin-left:-18px;
    }
    .banner-nav-item ul li{
        list-style: disc;
        list-style-position: inside;
        margin-bottom: 3px;
        text-align: center;
        font-size: 12px;
        margin-top: 10px;
        transform: translate(-30%, -50%);
    }
</style>
<div class="line-01"></div>
<div class="footer">
    <div class="banners" >
        <div class="banner-vertical">
            <div class="banner-nav-list">
                <div class="banner-nav-title">
                    <a href="<%=path%>/service/2">关于我们</a>
                </div>
                <div class="banner-nav-item">
                    <ul>
                        <li><a href="<%=path%>/service/2">集团简介</a></li>
                        <li><a href="<%=path%>/service/1">组织架构</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="banner-vertical">
            <div class="banner-nav-list">
                <div class="banner-nav-title">
                    <a href="<%=path%>/article/party">党建文化</a>
                </div>
                <div class="banner-nav-item">
                    <ul>
                        <li><a href="<%=path%>/article/party/PartyOne">党政动态</a></li>
                        <li><a href="<%=path%>/article/party/PartyTwo">廉洁建设</a></li>
                        <li><a href="<%=path%>/article/party/PartyThree">红色教育</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="banner-vertical">
            <div class="banner-nav-list">
                <div class="banner-nav-title">
                    <a href="<%=path%>/article/business">集团业务</a>
                </div>
                <div class="banner-nav-item">
                    <ul>
                        <li><a href="<%=path%>/article/business/BusinessOne">产业投资</a></li>
                        <li><a href="<%=path%>/article/business/BusinessTwo">民生教育</a></li>
                        <li><a href="<%=path%>/article/business/BusinessThree">开发建设</a></li>
                        <li><a href="<%=path%>/article/business/BusinessFour">资本运作</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="banner-vertical">
            <div class="banner-nav-list">
                <div class="banner-nav-title">
                    <a href="<%=path%>/article">新闻中心</a>
                </div>
                <div class="banner-nav-item">
                    <ul>
                        <li><a href="<%=path%>/article/NewsOne">集团要闻</a></li>
                        <li><a href="<%=path%>/article/NewsTwo">媒体聚焦</a></li>
                        <li><a href="<%=path%>/article/NewsThree">人才招聘</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="banner-vertical">
            <div class="banner-nav-list">
                <div class="banner-nav-title">
                    <a href="<%=path%>/article/announcement">信息公开</a>
                </div>
                <div class="banner-nav-item">
                    <ul>
                        <li><a href="<%=path%>/article/announcement/AnnouncementOne">集团公告</a></li>
                        <li><a href="<%=path%>/article/announcement/AnnouncementTwo">招标公告</a></li>
                        <li><a href="<%=path%>/article/announcement/AnnouncementThree">中标公告</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="foot">
        <div class="foot_top">
            <p>临沂市兰山区财金投资集团有限公司&nbsp;&nbsp;<i>•</i>&nbsp;&nbsp;<a href="<%=path%>/contact">联系我们</a></p>
        </div>
        <div class="foot_bottom">
            <p> Copyright © 2020-2021
                <%=SystemManage.getInstance().getSystemSetting().getTitle()%> <%=SystemManage.getInstance().getSystemSetting().getIcp()%>
                版权所有
            </p>
        </div>
    </div>
</div>


</body>
</html>