<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<link href="<%=path%>/resource/swiper/css/swiper.min.css" rel="stylesheet" type="text/css"/>
<script src="<%=path%>/resource/swiper/js/swiper.min.js" type="text/javascript"></script>
<style>
    #float_right{
        z-index: 999;
        width: 36px;
    }
    #float_right a{
        background-color: rgba(180,180,181,0.6);
        background-position: center center;
        display: block;
        height: 36px;
        width: 36px;
        margin: 0 0 2px 0 !important;
        padding-left: 0;
    }
    #float_right a:hover{
        background-color: #cc3333;
    }
    .lsgk{
        background: url(<%=path%>/resource/images/button/lcgk1.png) no-repeat;
    }
    .weixin{
        background: url(<%=path%>/resource/images/button/weixin.png) no-repeat;
    }
    .top{
        background: url(<%=path%>/resource/images/button/top.png) no-repeat;
    }
    .weixin_img{
        z-index: 9999999;
        width: 120px;
        float: right;
        margin-right: 48px;
    }
    .weixin_img img{
        background-color: rgba(180,180,181,0.6);
        background-position: center center;
        display: block;
        height: 120px;
        width: 120px;
        margin: 0 0 2px 0 !important;
        padding-left: 0;
    }
</style>
<div id="float_right" >
    <a href="#" class="lsgk"></a>
    <a href="#" class="weixin" onmouseover="document.getElementById('weixin_img').style.display = 'block';" onmouseout="document.getElementById('weixin_img').style.display = 'none';"></a>
    <a href="javascript:scroll(0,0)" class="top" style=""></a>
</div>
<div id="weixin_img" class="weixin_img" style="display: none;">
    <img src="<%=path%>/resource/images/gzh.png">
</div>
<script type="text/javascript">
    function scrollx(p) {
        var d = document, dd = d.documentElement, db = d.body, w = window, o = d.getElementById(p.id), ie6 = /msie 6/i.test(navigator.userAgent), style, timer;
        if (o) {
            cssPub = ";position:"+(p.f&&!ie6?'fixed':'absolute')+";"+(p.t!=undefined?'top:'+p.t+'px;':'bottom:0;');
            if (p.r != undefined && p.l == undefined) {
                o.style.cssText += cssPub + ('right:'+p.r+'px;');
            } else {
                o.style.cssText += cssPub + ('margin-left:'+p.l+'px;');
            }
            if(p.f&&ie6){
                cssTop = ';top:expression(documentElement.scrollTop +'+(p.t==undefined?dd.clientHeight-o.offsetHeight:p.t)+'+ "px" );';
                cssRight = ';right:expression(documentElement.scrollright + '+(p.r==undefined?dd.clientWidth-o.offsetWidth:p.r)+' + "px")';
                if (p.r != undefined && p.l == undefined) {
                    o.style.cssText += cssRight + cssTop;
                } else {
                    o.style.cssText += cssTop;
                }
                dd.style.cssText +=';background-image: url(about:blank);background-attachment:fixed;';
            }else{
                if(!p.f){
                    w.onresize = w.onscroll = function(){
                        clearInterval(timer);
                        timer = setInterval(function(){
                            //双选择为了修复chrome 下xhtml解析时dd.scrollTop为 0
                            var st = (dd.scrollTop||db.scrollTop),c;
                            c = st - o.offsetTop + (p.t!=undefined?p.t:(w.innerHeight||dd.clientHeight)-o.offsetHeight);
                            if(c!=0){
                                o.style.top = o.offsetTop + Math.ceil(Math.abs(c)/10)*(c<0?-1:1) + 'px';
                            }else{
                                clearInterval(timer);
                            }
                        },10)
                    }
                }
            }
        }
    }

    scrollx({id:'float_right', r:0, t:300, f:1});

    scrollx({id:'weixin_img', r:0, t:300, f:1});
</script>

