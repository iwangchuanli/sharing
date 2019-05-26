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

<a href="#" class="site-scroll-top">
    <i class="icon-arrow-up"></i>
</a>

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
