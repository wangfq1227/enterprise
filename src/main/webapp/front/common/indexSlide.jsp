<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<link href="<%=path%>/resource/swiper/css/swiper.min.css" rel="stylesheet" type="text/css"/>
<script src="<%=path%>/resource/swiper/js/swiper.min.js" type="text/javascript"></script>
<style>
    #index-banner {
        position: relative;
        height: 481px;
    }
    .swiper-container {
        position: absolute;
        height: 481px;
        width: 100%;
    }
    .swiper-slide {
        background-position: center 0;
        background-repeat: no-repeat;
        box-sizing: content-box;
        float: left;
    }
    .swiper-button-prev {
        width: 50.5px;
        height: 50.5px;
        filter: alpha(opacity=50);
        opacity: 0.7;
        display: inline-block;
        margin-left: 120px;
    }
    .swiper-button-next {
        width: 50.5px;
        height: 50.5px;
        filter: alpha(opacity=50);
        opacity: 0.7;
        display: inline-block;
        margin-right: 120px;
    }
    .swiper-button-prev:hover,
    .swiper-button-next:hover{
        filter: alpha(opacity=100);
        opacity: 1;
    }
</style>
<div id="index-banner" class="">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <c:forEach var="item" items="<%=SystemManage.getInstance().getIndexImgs()%>">
                <div class="swiper-slide"  style="background-image: url(<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${item.pictureUrl});"></div>
            </c:forEach>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination" style="width: 85%;"></div>
        <div class="swiper-button-next" style="background-image: url(./resource/images/button/next_on.png);"></div>
        <div class="swiper-button-prev" style="background-image: url(./resource/images/button/prev_on.png);"></div>
    </div>
</div>
<script>
    $().ready(function () {
        var mySwiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            autoplay: 8e3,
            autoplayDisableOnInteraction: !1,
            loop: !0,
            paginationClickable: !0


        });

    });

</script>