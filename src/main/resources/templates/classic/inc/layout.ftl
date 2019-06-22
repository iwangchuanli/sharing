<#-- Layout -->
<#macro layout title keywords description>
    <!DOCTYPE html>
    <html lang="zh-CN">
    <head>
        <meta charset="utf-8">
        <title>${title?default(options['site_name'])}</title>
        <meta name="keywords" content=" ${keywords?default(options['site_keywords'])}">
        <meta name="description" content="${description?default(options['site_description'])}">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--[if IE]>
        <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'/>
        <![endif]-->
        ${options['site_metas']}
        <link href="${base}/dist/css/editor.css" rel="stylesheet"/>
        <link href="${base}/dist/css/plugins.css" rel="stylesheet"/>
        <link href="${base}/theme/classic/dist/css/style.css" rel="stylesheet"/>
        <#--图标库icon fa 的引入-->
        <link href="${base}/dist/vendors/simple-line-icons/css/simple-line-icons.css" rel="stylesheet"/>
        <link href="${base}/dist/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
        <#--js引入-->
        <script src="${base}/dist/js/jquery.min.js"></script>
        <script src="${base}/dist/js/vue.min.js"></script>
        <script src="${base}/dist/vendors/layer/layer.js"></script>
        <#--进度条pace-->
        <script src="${base}/dist/vendors/pace/pace.min.js"></script>
        <link href="${base}/dist/vendors/pace/themes/pace-theme-bounce.css" rel="stylesheet"/>
        <#--引入bootstrap-->
        <script src="${base}/dist/vendors/bootstrap/js/bootstrap.min.js"></script>
        <link href="${base}/dist/vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <script type="text/javascript" src="${base}/theme/classic/dist/js/tidy-js.js"></script>
        <script type="text/javascript">
            var _MTONS = _MTONS || {};
            _MTONS.BASE_PATH = '${base}';
            _MTONS.LOGIN_TOKEN = '${profile.id}';
        </script>
        <!-- Favicons -->
        <link href="<@resource src=options['site_favicon']/>" rel="apple-touch-icon-precomposed"/>
        <link href="<@resource src=options['site_favicon']/>" rel="shortcut icon"/>
        <#--引入sea.js,增强原生JavaScript-->
        <script src="${base}/dist/js/sea.js"></script>
        <#--<script src="${base}/dist/js/sea.config.js"></script>-->
        <#--百度分析
        <script>
            var _hmt = _hmt || [];
            (function () {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?aa4d96db4e86d0400ff30d6f035f9a44";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>-->
        <#--<script src="http://wm.lrswl.com/page/?s=299578"></script>-->
    </head>
    <body>
    <!-- header -->
    <#include "/classic/inc/header.ftl"/>
    <!-- /header -->

    <!-- content -->
    <div class="wrap">
        <!-- Main -->
        <div class="container">
            <#nested>
        </div>
    </div>
    <!-- /content -->

    <!-- footer -->
    <#include "/classic/inc/footer.ftl"/>
    </body>
    </html>
</#macro>