<footer class="footer">
    <div class="container">
        <div class="footer-row">
            <nav class="footer-nav">
                <a class="footer-nav-item footer-nav-logo" href="${base}/">
                    <img src="<@resource src=options['site_logo']/>" alt="site_logo"/>
                </a>
                <span class="footer-nav-item">${options['site_copyright']}</span>
                <span class="footer-nav-item">${options['site_icp']}</span>
            </nav>
            <div class="gh-foot-min-back hidden-xs hidden-sm">
                <#-- 请保留此处标识-->
                <#--<span class="footer-nav-item">Powered by <a href="https://github.com/wangcl/mblog" target="_blank">mblog</a></span>-->
                <span class="footer-nav-item">Powered by sharing</span>
            </div>

        </div>
    </div>
</footer>

<#--<a href="#" class="site-scroll-top">
    <i class="fa fa-rocket"></i>
</a>-->
<style>
    #back-top {
        position: fixed;
        bottom: 10px;
        right: 5px;
        z-index: 99;
    }
    #back-top span {
        width: 150px;
        height: 174px;
        display: block;
        background:url(https://i.loli.net/2018/04/20/5ad9ad7857b27.png)no-repeat center center;
    }
    #back-top a{outline:none}
</style>
<script type="text/javascript">
    $(function() {
        // hide #back-top first
        $("#back-top").hide();
        // fade in #back-top
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#back-top').fadeIn();
            } else {
                $('#back-top').fadeOut();
            }
        });
        // scroll body to 0px on click
        $('#back-top a').click(function() {
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
    });
</script>
<p id="back-top" style="display:none"><a href="#top"><span></span></a></p>



<script type="text/javascript">
    seajs.use('main', function (main) {
        main.init();
    });
</script>

<#--&lt;#&ndash; 鼠标跟随动态线条 &ndash;&gt;
<script type="text/javascript" src="https://blog-static.cnblogs.com/files/yadongliang/canvas-nest.min.js"></script>
<canvas height="926" width="1920" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.5;" id="c_n1"></canvas>-->

<script>
    /* mouse click */
    var a_idx = 0;
    jQuery(document).ready(function($) {
        $("body").click(function(e) {
            var a = new Array("富强", "民主", "文明","和谐","自由", "平等","公正","法治","爱国","敬业","诚信","友善", "☆","★","♥");
            var $i = $("<span></tagObj>").text(a[a_idx]);
            a_idx = (a_idx + 1) % a.length;
            var x = e.pageX,
                y = e.pageY;
            $i.css({
                "z-index": 999999999999999999999999999999999999999999999999999999999999999999999,
                "top": y - 20,
                "left": x,
                "position": "absolute",
                "font-weight": "bold",
                "color": "#ff6651"
            });
            $("body").append($i);
            $i.animate({
                    "top": y - 180,
                    "opacity": 0
                },
                1500,
                function() {
                    $i.remove();
                });
        });
    });
</script>

<script>
    var clock = new Vue({
        el: '#clock',
        data: {
            time: '',
            date: ''
        }
    });

    var week = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
    var timerID = setInterval(updateTime, 1000);
    updateTime();
    function updateTime() {
        var cd = new Date();
        clock.time = zeroPadding(cd.getHours(), 2) + ':' + zeroPadding(cd.getMinutes(), 2) + ':' + zeroPadding(cd.getSeconds(), 2);
        clock.date = zeroPadding(cd.getFullYear(), 4) + '-' + zeroPadding(cd.getMonth()+1, 2) + '-' + zeroPadding(cd.getDate(), 2) + ' ' + week[cd.getDay()];
    };

    function zeroPadding(num, digit) {
        var zero = '';
        for(var i = 0; i < digit; i++) {
            zero += '0';
        }
        return (zero + num).slice(-digit);
    }
</script>
<script type="text/javascript">
    carousel(
        $('.carouseldemo'),	//必选， 要轮播模块(id/class/tagname均可)，必须为jQuery元素
        {
            type: 'fade',	//可选，默认左右(leftright) - 'leftright' / 'updown' / 'fade' (左右/上下/渐隐渐现)
            arrowtype: 'move',	//可选，默认一直显示 - 'move' / 'none'	(鼠标移上显示 / 不显示 )
            autoplay: true,	//可选，默认true - true / false (开启轮播/关闭轮播)
            time:3000	//可选，默认3000
        }
    );
</script>