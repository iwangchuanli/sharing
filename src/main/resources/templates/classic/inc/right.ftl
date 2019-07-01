<div class="panel panel-default widget">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-heartbeat"></i> 时 间</h3>
    </div>
    <div id="clock">
        <p class="date">{{date}}</p>
        <p class="time">{{time}}</p>
    </div>
</div>
<div class="panel panel-default widget">
    <div class="pb-carouselWarp carousel" id="right_carousel">
        <ul class="pb-carousel">
            <li class="pb-this"><img src="${base}/theme/classic/dist/images/carousel/5.jpg" alt="5"/></li>
            <li><img src="${base}/theme/classic/dist/images/carousel/4.jpg" alt="4"/></li>
            <li><img src="${base}/theme/classic/dist/images/carousel/3.jpg" alt="3"/></li>
            <li><img src="${base}/theme/classic/dist/images/carousel/2.jpg" alt="2"/></li>
            <li><img src="${base}/theme/classic/dist/images/carousel/1.jpg" alt="1"/></li>
        </ul>
        <ul class="pb-carousel-ind">
            <li class="pb-this"></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
        <button class="pb-arrow pb-arrow-prev"></button>
        <button class="pb-arrow pb-arrow-next" id="aa"></button>
    </div>
</div>
<div class="panel panel-default widget">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-rocket"></i> 应用</h3>
    </div>
    <div class="panel-body">
        <ul>
            <li><i class="fa fa-star-o"></i>&nbsp;<a href="${base}/app/test.html">app_test</a></li>
            <li><i class="fa fa-star-o"></i>&nbsp;<a href="http://favorites.wangcl.xyz/">云收藏</a></li>
            <li><i class="fa fa-star-o"></i>&nbsp;<a>私人网盘</a></li>
            <li><i class="fa fa-star-o"></i>&nbsp;<a>other</a></li>
        </ul>
    </div>
</div>
<div class="panel panel-default widget">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-line-chart"></i> 热门文章</h3>
    </div>
    <div class="panel-body">
        <@sidebar method="hottest_posts">
            <ul class="list">
                <#list results as row>
                <#--<li>${row_index + 1}. <a href="${base}/post/${row.id}.html">${row.title}</a></li>-->
                    <li><i class="fa fa-flag-o"></i>&nbsp; <a class="hosttest_post_a"
                                                              href="${base}/post/${row.category}-${row.id}.html"
                                                              title="${row.title}">${row.title}</a></li>
                </#list>
            </ul>
        </@sidebar>
    </div>
</div>

<div class="panel panel-default widget">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-newspaper-o"></i> 最新发布</h3>
    </div>
    <div class="panel-body">
        <@sidebar method="latest_posts">
            <ul class="list">
                <#list results as row>
                    <li><i class="fa fa-paper-plane-o"></i>&nbsp; <a class="new_public_a"
                                                                     href="${base}/post/${row.category}-${row.id}.html"
                                                                     title="${row.title}">${row.title}</a></li>
                </#list>
            </ul>
        </@sidebar>
    </div>
</div>
<#--<a class="category_right" href="${base}/category/${row.name}/"
                       title="${row.name}">${row.name}</a>-->
<div class="panel panel-default widget">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-file-archive-o"></i> 分类归档</h3>
    </div>
    <div class="panel-body">
        (点击展开)
        <@sidebar method="category_right">
            <ul class="right_category_parent_ul">
                <#list results as row>
                    <#if row.parent == 0>
                        <li class="right_category_parent">
                            &nbsp;${row.name}
                            <ul>
                                <#list results as child_row>
                                    <#if child_row.parent == row.id>
                                    <li class="right_category_child">
                                        &nbsp;<a href="${base}/category/${child_row.name}" title="${child_row.name}">${child_row.name}</a>
                                    </li>
                                    </#if>
                                </#list>
                            </ul>
                        </li>
                    </#if>
                </#list>
            </ul>
        </@sidebar>
    </div>
</div>
<div class="panel panel-default widget">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-tags"></i> 标签云</h3>
    </div>
    <div class="panel-body">
        <@sidebar method="tags_view">
            <#list results as row>
                <#if row.name ?? >
                    <i class="fa fa-tag"></i>&nbsp; <a class="tags_cloud" href="${base}/tag/${row.name}/"
                                                       title="${row.name}">${row.name}</a>
                </#if>
            </#list>
        </@sidebar>
    </div>
</div>
<@controls name="comment">
    <div class="panel panel-default widget">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-comments-o"></i> 最新评论</h3>
        </div>
        <div class="panel-body">
            <@sidebar method="latest_comments">
                <ul class="list">
                    <#list results as row>
                        <li><i class="fa fa-commenting-o"></i>&nbsp; <a class="new_comment_a"
                                                                        href="${base}/post/comment-${row.postId}.html"
                                                                        title="${row.content}">${row.content}</a></li>
                    </#list>
                </ul>
            </@sidebar>
        </div>
    </div>
</@controls>