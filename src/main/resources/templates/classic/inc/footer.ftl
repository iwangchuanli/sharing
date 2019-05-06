<footer class="footer">
    <div class="container">
        <div class="footer-row">
            <nav class="footer-nav">
                <a class="footer-nav-item footer-nav-logo" href="${base}/">
                    <img src="<@resource src=options['site_logo']/>" alt="mblog"/>
                </a>
                <span class="footer-nav-item">${options['site_copyright']}</span>
                <span class="footer-nav-item">${options['site_icp']}</span>
            </nav>
            <div class="gh-foot-min-back hidden-xs hidden-sm">
                <!-- 请保留此处标识-->
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
    /* 鼠标点击特效 */
    var a_idx = 0;
    jQuery(document).ready(function($) {
        $("body").click(function(e) {
            var a = new Array("（*@ο@*）", "（⊙o⊙）", "★~★", "(*^‧^*)", "（ˇ＾ˇ〉", "~>_<~+", "(≥◇≤)" ,"（*>.<*）", ">_<|||", "→_→", "└(^o^)┘", " (*^__^*)");
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