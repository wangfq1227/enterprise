<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="/front/common/common.jsp" %>
<style>
    body{
        font-family: "Helvetica Neue", Helvetica, Arial, "STHeiti","Microsoft YaHei", sans-serif;
        overflow-x: hidden;
    }
    .nav-content{
        background-color: #E8E8EA;
    }
    .block51 {
        position: relative;
        left: 50%;
        top: 0px;
        width: 980px;
        /* height: 400px; */
        margin-left: -480px;
        opacity: 1;
        transition: all 0.6s;
    }
    .clearfix {
        zoom: 1;
    }
    .block51 .cards.cards-left {
        float: left;
    }
    .block51 .cards.cards-right {
        float: right;
    }
    .cards {
        width: 460px;
        height: 420px;
        display: block;
        background-color: #fff;
        font-size: 12px;
        padding-bottom: 50px;
        margin-top: 30px;
        margin-bottom: 55px;
    }
    .cards-top {
        position: relative;
    }
    .cards .cards-txt {
        padding: 30px;
        font-size: 14px;
        position: relative;
        line-height: 1.7;
    }
    .ui-more-btn {
        cursor: pointer;
    }
    .en p, .en div, .en span, .en em {
        font-weight: 300;
    }
    .cards-top-tit {
        font-size: 32px;
        text-align: center;
        position: absolute;
        top: 50%;
        width: 100%;
        color: #fff;
        line-height: 40px;
        margin-top: -20px;
    }
    .ui-more-btn i {
        display: inline-block;
        width: 25px;
        height: 25px;
        background: url("<%=path%>/resource/images/index/more.png") no-repeat;
        vertical-align: middle;
        margin-right: 4px;
    }
    .section-content {
        position: relative;
        width: 1200px;
        /*min-height: 580px;*/
        margin: 0 auto;
    }
    .section-txt {
        margin-bottom: 5px;
        /*margin-left: 7px;*/
        max-width: 650px;
    }
    .section-txt-tit {
        font-size: 34px;
        line-height: 1;
        margin-bottom: 15px;
    }
    .section-txt-p section-txt p{
        width: 630px;
        font-size: 14px;
    }
    .section-cont-box-warp {
        width: 100%;
        overflow: auto;
    }
    .section a {
        color: #333;
    }
    a, a:focus {
        outline: none;
    }
    .section-box-img.box-type-five {
        width: 600px;
        height: 180px;
        display: inline-block;
    }
    .section-box-img .section-box-bg .img{
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: 1;
        -webkit-transform: scale(1, 1);
        transform: scale(1, 1);
        transition: all .6s;
    }
    .section-box-img .section-box-bg img {
        width: 100%;
        height: 100%;
    }
    .section-box-txt {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: 2;
    }
    .txt-padding {
        padding: 20px 35px;
    }
    .section-box-img {
        position: relative;
        width: 660px;
        height: 320px;
        top: 0;
        left: 0;
        float: left;
        color: #333333;
        overflow: hidden;
        z-index: 1;
        -webkit-transition: all .2s linear;
        transition: all .2s linear;
    }
    .en .section-cont-box .main-tit {
        font-size: 24px;
        line-height: 1.4;
    }
    .section-cont-box-warp a img {
        width: 100%;
        transform: scale(1);
        transition: all 1s ease 0s;
    }
    .section-cont-box-warp a:hover img {
        transform: scale(1.2);
        transition: all 1s ease 0s;
    }
    .news-left{
        float: left;
        width: 48%;
        height: 270px;
        margin-top: 40px;
        background-color: white;
        /*margin-left: 20px;*/
    }
    .news-right{
        float: right;
        width: 48%;
        height: 270px;
        margin-top: 40px;
        background-color: white;
        /*margin-right: 20px;*/
    }
    .news-list-tag{
        width: 150px;
        float: left;
        text-align: center;
        color: #D5000f;
        font-size: 20px;
        padding-top: 22px;
        height: 100%;
        border-right: #AEB6BD solid 0px;
    }
    .news-list{
        margin-left: 150px;
        padding-left: 20px;
        padding-top: 15px;
        overflow: hidden;
        position: relative;
        border-left: #AEB6BD solid 1px;
        /*padding-bottom: 10px;*/
    }
    .news-list p {
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
        padding: 2px 0 10px 10px;
        width: auto;
        margin-right: 50px;
    }
    .news-list p.new .news-date {
        color: #D5000f;
    }
    .news-list .news-date {
        padding-right: 10px;
        width: 94px;
        display: inline-block;
    }

    .nav-news{
        height: 300px;
        width: 1200px;
        width: 1200px;
        margin: 0 auto;
        margin-top: 100px;
    }

    .nav-business{
        width: 1200px;
        margin: 0 auto;
        margin-top: 100px;
    }

    .container1{
        width: 1200px;
        margin: 0 auto;
        margin-top: 100px;
    }
    .section4 .title {
        font-size: 34px;
        color: #00132b;
        -webkit-text-stroke-width: 0.2px;
        display: block;
        opacity: 1;
    }
    .section4 ul {
        width: 1250px;
        margin-left: -45px;
        margin-top: 20px;
        display: block;
        opacity: 1;
    }
    .section4 li {
        margin-left: 45px;
        float: left;
        width: 369px;
    }
    .section4 .img {
        width: 369px;
        height: 369px;
    }

    .container1 ul li div img {
        width: 100%;
        transform: scale(1);
        transition: all 1s ease 0s;
    }
    .container1 ul li div img:hover {
        transform: scale(1.2);
        transition: all 1s ease 0s;
    }
    .desc{
        margin-top: 15px;
    }
</style>
<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="nav-banner" style="height: 690px;">
    <div class="banner-bg" style="position: relative;z-index: 7;">
        <img src="<%=path%>/resource/images/index/banner_back.jpg" style="width: 1536px; margin-left: -133px;">
    </div>
    <div class="banner-cont-enti" style="position: relative;z-index: 8;">
        <div class="banner-cont-enti-item building1" style="left: 941px; top: 0px;margin-top: -665px;margin-left: 55%">
            <img src="<%=path%>/resource/images/index/banner.png">
        </div>
    </div>
</div>
<div class="nav-content" style="margin-top: -200px;position:relative;z-index: 9;">
    <div class="nav-news">
        <div class="news-left">
            <a href="#">
                <div class="news-list-tag">
                    <p>新闻</p>
                </div>
            </a>
            <div class="news-list">
                <c:forEach var="item" items="${newss}">
                    <p class="new">
                        <a href="<%=path%>/article/${item.id}">
                            <span class="news-date">${fn:substring(item.createtime, 0, 4)}年${fn:substring(item.createtime, 5, 6)}月${fn:substring(item.createtime, 7, 10)}日</span>
                            <span class="news-title" title="${item.title}">${item.title}</span>
                        </a>
                    </p>
                </c:forEach>
            </div>
            <p class="ui-more-btn" style="float: right;">
                <a href="<%=path%>/article">
                    <i></i>
                    <span>点击了解更多</span>
                </a>
            </p>
        </div>
        <div class="news-right">
            <a href="#">
                <div class="news-list-tag">
                    <p>公告</p>
                </div>
            </a>
            <div class="news-list">
                <c:forEach var="item" items="${announcements}">
                    <p class="new">
                        <a href="<%=path%>/article/announcement/${item.id}">
                            <span class="news-date">${fn:substring(item.createtime, 0, 4)}年${fn:substring(item.createtime, 5, 6)}月${fn:substring(item.createtime, 7, 10)}日</span>
                            <span class="news-title" title="${item.title}">${item.title}</span>
                        </a>
                    </p>
                </c:forEach>
            </div>
            <p class="ui-more-btn" style="float: right;">
                <a href="<%=path%>/article/announcement">
                    <i></i>
                    <span>点击了解更多</span>
                </a>
            </p>
        </div>
    </div>
    <div class="container1 section4 section">
        <div class="title" style="display: block; opacity: 1;">党建文化</div>
        <ul class="clearfix" style="display: block; opacity: 1;">
            <c:forEach var="item" items="${partys}">
                <li>
                    <div class="img"><img src="${item.image}" href="<%=path%>/article/party/${item.id}"></div>
                    <div class="desc">
                        <a href="<%=path%>/article/party/${item.id}">
                            <p title="${item.title}">${item.title}</p>
                        </a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="nav-business">
        <div class="section-content">
            <div class="section-txt">
                <div class="section-txt-tit">集团业务</div>
                <p class="section-txt-p"></p><p>根据创新平台优势，助推城市发展，致力于金融业、公用事业、高新技术产业、先进装备制造业、现代服务业等领域的战略投资；做好区委区政府安排的教育、住房、文体、基础设施等民生项目，打造为民办实事、办好事的“民心工程”和“德政工程”；利用市场规则，采取金融投资、上市融资、股权投资、资产重组、收购兼并、风险投资、保理担保等方式，助推集团做大做强。</p>
                <p></p>
                <p class="ui-more-btn pc-content-el">
                    <a class="bfd" href="<%=path%>/article/business" data-event-id="A_column_click" bfd-type="8" data-id="509"><%--<i></i><span>更多</span>--%></a>
                </p>
            </div>
            <div class="section-cont-box-warp">
                <div class="section-cont-box clearfix">
                    <a class="bfd" href="<%=path%>/article/business/BusinessOne" data-event-id="B_column_click" bfd-type="9" data-id="529">
                        <div class="section-box-img box-type-five">
                            <div class="section-box-bg">
                                <img src="<%=path%>/resource/images/index/business1.png">
                            </div>
                            <div class="section-box-txt txt-padding">
                                <p class="main-tit">产业投资</p>
                            </div>
                        </div>
                    </a>
                    <a class="bfd" href="<%=path%>/article/business/BusinessTwo" data-event-id="B_column_click" bfd-type="9" data-id="529">
                        <div class="section-box-img box-type-five">
                            <div class="section-box-bg">
                                <img src="<%=path%>/resource/images/index/business2.png">
                            </div>
                            <div class="section-box-txt txt-padding">
                                <p class="main-tit">民生教育</p>
                            </div>
                        </div>
                    </a>
                    <a class="bfd" href="<%=path%>/article/business/BusinessThree" data-event-id="B_column_click" bfd-type="9" data-id="529">
                        <div class="section-box-img box-type-five">
                            <div class="section-box-bg">
                                <img src="<%=path%>/resource/images/index/business3.jpg">
                            </div>
                            <div class="section-box-txt txt-padding">
                                <p class="main-tit">开发建设</p>
                            </div>
                        </div>
                    </a>
                    <a class="bfd" href="<%=path%>/article/business/BusinessFour" data-event-id="B_column_click" bfd-type="9" data-id="529">
                        <div class="section-box-img box-type-five">
                            <div class="section-box-bg">
                                <img src="<%=path%>/resource/images/index/business4.jpg">
                            </div>
                            <div class="section-box-txt txt-padding">
                                <p class="main-tit">资本运作</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="nav-connection" style="margin-top: 100px;">
        <div class="block51 clearfix">
            <div class="cards cards-left">
                <div class="cards-top">
                    <div class="cards-top-img"><img src="<%=path%>/resource/images/index/jobs.png"></div>
                    <p class="cards-top-tit">加入我们</p>
                </div>
                <div class="cards-txt">
                    <p></p><p>财金集团的员工竭力支持本集团的长期业务发展及可持续增长，因此我们视员工为重要资产。作为一家多元化企业，我们透过倡导公平、平等及尊重的雇用行为，营造良好的工作环境。</p>
                    <p></p>
                </div>
                <p class="cards-btm ui-more-btn">
                    <a class="bfd" href="<%=path%>/article/NewsThree" data-event-id="A_column_click" bfd-type="10" data-id="512"><i></i><span>更多</span></a>
                </p>
            </div>

            <div class="cards cards-right">
                <div class="cards-top">
                    <div class="cards-top-img"><img src="<%=path%>/resource/images/index/tel.png"></div>
                    <p class="cards-top-tit">联系我们</p>
                </div>
                <div class="cards-txt">
                    <p>电话 ： 0539-8310308</p>
                    <p>&nbsp;</p>
                    <div>地址 ： 山东省临沂市兰山区沂蒙路338号</div>
                    <div>&nbsp;</div>
                    <div class="qrcode"><img src=""></div>
                </div>
                <p class="cards-btm ui-more-btn">
                    <a class="bfd" href="<%=path%>/contact" data-event-id="A_column_click" bfd-type="10" data-id="513"><i></i><span>更多</span></a>
                </p>
            </div>
        </div>
    </div>
</div>
<%@include file="/front/common/sharebuttonbox.jsp" %>
<%@include file="/front/common/foot.jsp" %>
