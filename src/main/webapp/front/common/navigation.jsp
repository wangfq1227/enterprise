<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<style>
    *{margin:0; padding:0}
    .nav{
        list-style: none outside none;
    }
    .nav li {
        width: 90px;
        height: 107px;
        float: left;
        line-height: 72px;
        font-size: 15px;
        color: #262626;
        margin-left: 5px;
        margin-right: 5px;
        text-align: center;
    }
    .nav li a {
        text-decoration: none;
        color: inherit;
        padding-top: 5px;
        font-family: Microsoft Yahei;
        transition: height 0.4s ;
    }
    .nav li a:hover{
        background-color: #D50A1D;
    }
    .header{
        width: 100%;
        height: 80px;
        overflow: hidden;
        padding: 0 20px;
        background:#fff;
        overflow-y:auto;
        min-height: 60px;
        line-height: 60px;
        overflow: hidden;
    }
    .header-about{
        position: fixed;
        width: 100%;
        height: 200px;
        overflow: hidden;
        /*padding: 0 20px;*/
        z-index: 20;
        background:#E8E8EA;
        overflow-y:auto;
        min-height: 60px;
        line-height: 60px;
        overflow: hidden;
    }
    #catalog_search{
        position: fixed;
        margin-left: 70%;
        width: 30%;
        height: 60px;
        overflow: hidden;
        padding: 0 20px;
        z-index: 20;
        background:#E8E8EA;
        overflow-y:auto;
        overflow: hidden;
    }
    .header-popup-img{
        height: 200px;
        float: left;
    }
    .header-popup-catalog{
        float: right;
        width: 16%;
    }
    .header-popup-catalog-title{
        font-size: 23px;
    }
    .header-popup-catalog-li p a i{
        display: inline-block;
        width: 2px;
        height: 12px;
        border-left: #d5000f solid 2px;
        font-size: 0;
        vertical-align: middle;
        margin-right: 10px;
        font-size: 18px;
    }
    .header-popup-catalog-li p{
        line-height: 20px;
    }
    .button-search{
        width: 60px;
        height: 120px;
        transform: translate(20%, 0%);
        background-repeat:no-repeat;
        background-position:center;
    }
    .nav ul li a {
        transition: color 200ms ease-out,background-color 200ms ease-out,border-color 200ms ease-out,opacity 200ms ease-out;
    }
</style>
<div class="header">
    <div style="float: left;margin-top: 15px">
        <a href="<%=path%>/index">
            <img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %><%=SystemManage.getInstance().getSystemSetting().getLogo() %>"/>
        </a>
    </div>
    <div style="width: 35%;height: 80px;float: right;overflow: hidden;">
        <ul class="nav">
            <li>
                <a href="<%=path%>/service/2" onmousemove="document.getElementById('catalog_about').style.display = 'block';"
                   onmouseout="document.getElementById('catalog_about').style.display = 'none';">关于我们</a>
            </li>
            <li>
                <a href="<%=path%>/article/party" onmousemove="document.getElementById('catalog_service').style.display = 'block';"
                   onmouseout="document.getElementById('catalog_service').style.display = 'none';">党建文化</a>
            </li>
            <li>
                <a href="<%=path%>/article/business" onmousemove="document.getElementById('catalog_business').style.display = 'block';"
                   onmouseout="document.getElementById('catalog_business').style.display = 'none';">集团业务</a>
            </li>
            <li>
                <a href="<%=path%>/article" onmousemove="document.getElementById('catalog_news').style.display = 'block';"
                   onmouseout="document.getElementById('catalog_news').style.display = 'none';">新闻中心</a>
            </li>
            <li>
                <a href="<%=path%>/article/announcement" onmousemove="document.getElementById('catalog_notice').style.display = 'block';"
                   onmouseout="document.getElementById('catalog_notice').style.display = 'none';">信息公开</a>
            </li>
            <li>
                <a href="<%=path%>/contact" onmousemove="document.getElementById('catalog_search').style.display = 'block';"
                   onmouseout="document.getElementById('catalog_search').style.display = 'none';" class="button-search"
                   style="background-image: url(<%=path%>/resource/images/button/search.png);margin-top: -18px;"></a>
            </li>
        </ul>
    </div>
</div>
<div style="position: fixed;z-index: 20;">
    <div id="catalog_about" class="header-about" style="display: none;" onmousemove="document.getElementById('catalog_about').style.display = 'block';"
         onmouseout="document.getElementById('catalog_about').style.display = 'none';">
        <div class="header-popup-img">
            <img src="<%=path%>/resource/images/banner/company_top.png">
        </div>
        <div class="header-popup-catalog">
            <div class="header-popup-catalog-title">
                <a href="<%=path%>/service/2">关于我们</a>
            </div>
            <div class="header-popup-catalog-li">
                <p>
                    <a href="<%=path%>/service/2">
                        <i></i>
                        <span>集团简介</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/service/1">
                        <i></i>
                        <span>组织架构</span>
                    </a>
                </p>
            </div>
        </div>
    </div>
    <div id="catalog_service" class="header-about" style="display: none" onmousemove="document.getElementById('catalog_service').style.display = 'block';"
         onmouseout="document.getElementById('catalog_service').style.display = 'none';">
        <div class="header-popup-img">
            <img src="<%=path%>/resource/images/banner/party_top.png">
        </div>
        <div class="header-popup-catalog">
            <div class="header-popup-catalog-title">
                <a href="<%=path%>/article/party">党建文化</a>
            </div>
            <div class="header-popup-catalog-li" style="width: 50%;float: left;">
                <p>
                    <a href="<%=path%>/article/party/PartyOne">
                        <i></i>
                        <span>党建动态</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/article/party/PartyTwo">
                        <i></i>
                        <span>廉洁建设</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/article/party/PartyThree">
                        <i></i>
                        <span>红色教育</span>
                    </a>
                </p>
            </div>
        </div>
    </div>
    <div id="catalog_business" class="header-about" style="display: none" onmousemove="document.getElementById('catalog_business').style.display = 'block';"
         onmouseout="document.getElementById('catalog_business').style.display = 'none';">
        <div class="header-popup-img">
            <img src="<%=path%>/resource/images/banner/business_top.png">
        </div>
        <div class="header-popup-catalog">
            <div class="header-popup-catalog-title">
                <a href="/article/business">集团业务</a>
            </div>
            <div class="header-popup-catalog-li" style="width: 50%;float: left;">
                <p>
                    <a href="<%=path%>/article/business/BusinessOne">
                        <i></i>
                        <span>产业投资</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/article/business/BusinessTwo">
                        <i></i>
                        <span>民生教育</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/article/business/BusinessThree">
                        <i></i>
                        <span>开发建设</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/article/business/BusinessFour">
                        <i></i>
                        <span>资本运作</span>
                    </a>
                </p>
            </div>
        </div>
    </div>
    <div id="catalog_news" class="header-about" style="display: none;" onmousemove="document.getElementById('catalog_news').style.display = 'block';"
         onmouseout="document.getElementById('catalog_news').style.display = 'none';">
        <div class="header-popup-img">
            <img src="<%=path%>/resource/images/banner/news_top.png">
        </div>
        <div class="header-popup-catalog">
            <div class="header-popup-catalog-title">
                <a href="<%=path%>/article">新闻中心</a>
            </div>
            <div class="header-popup-catalog-li">
                <p>
                    <a href="<%=path%>/article/NewsOne">
                        <i></i>
                        <span>集团要闻</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/article/NewsTwo">
                        <i></i>
                        <span>媒体聚焦</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/article/NewsTwo">
                        <i></i>
                        <span>人才招聘</span>
                    </a>
                </p>
            </div>
        </div>
    </div>
    <div id="catalog_notice" class="header-about" style="display: none;" onmousemove="document.getElementById('catalog_notice').style.display = 'block';"
         onmouseout="document.getElementById('catalog_notice').style.display = 'none';">
        <div class="header-popup-img">
            <img src="<%=path%>/resource/images/banner/announcement_top.png">
        </div>
        <div class="header-popup-catalog">
            <div class="header-popup-catalog-title">
                <a href="<%=path%>/article/announcement">信息公开</a>
            </div>
            <div class="header-popup-catalog-li">
                <p>
                    <a href="<%=path%>/article/announcement/AnnouncementOne">
                        <i></i>
                        <span>集团公告</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/article/announcement/AnnouncementTwo">
                        <i></i>
                        <span>招标公告</span>
                    </a>
                </p>
                <p>
                    <a href="<%=path%>/article/announcement/AnnouncementThree">
                        <i></i>
                        <span>中标公告</span>
                    </a>
                </p>
            </div>
        </div>
    </div>
    <div id="catalog_search" style="display: none;" onmousemove="document.getElementById('catalog_search').style.display = 'block';"
         onmouseout="document.getElementById('catalog_search').style.display = 'none';">
        <input type="search" id="sear" name="search" class="form-control" placeholder="搜索……" style="margin-top: 14px;width: 80%;float: left;"/>
        <input type="submit" name="submit" value="搜索" class="btn" onclick="search()" style="margin-top: 14px;float: right;width: 20%;"
               onmouseover="this.style.backgroundColor='#d5000f';" onmouseout="this.style.backgroundColor='';">
    </div>
</div>
<script type="text/javascript">
    function search(){
        var keyword=$("#sear").val();
        location.href = "<%=path%>/article/search?keyword="+keyword;
    };
</script>