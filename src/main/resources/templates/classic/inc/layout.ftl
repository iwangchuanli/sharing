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
        <#-- Favicons -->
        <link href="<@resource src=options['site_favicon']/>" rel="apple-touch-icon-precomposed"/>
        <link href="<@resource src=options['site_favicon']/>" rel="shortcut icon"/>
        <script src="${base}/theme/classic/dist/js/tidy-js.js"></script>


        <link href="${base}/dist/css/editor.css" rel="stylesheet"/>
        <link href="${base}/dist/css/plugins.css" rel="stylesheet"/>
        <link href="${base}/theme/classic/dist/css/style.css" rel="stylesheet"/>
        <#--图标库icon fa 的引入-->
        <link href="${base}/dist/vendors/simple-line-icons/css/simple-line-icons.css" rel="stylesheet"/>
        <link href="${base}/dist/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>

        <link href="${base}/dist/vendors/pace/themes/pace-theme-bounce.css" rel="stylesheet"/>
        <#--js引入-->
        <#--<script src="${base}/dist/js/jquery.min.js"></script>
        <script src="${base}/dist/js/vue.min.js"></script>
        <script src="${base}/dist/vendors/layer/layer.js"></scri    pt>-->

        <#--引入bootstrap-->
        <#--<script src="${base}/dist/vendors/bootstrap/js/bootstrap.min.js"></script>-->
        <link href="${base}/dist/vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>



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