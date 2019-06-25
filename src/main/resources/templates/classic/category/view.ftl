<#include "/classic/inc/layout.ftl"/>

<@layout "分类:" + category>

    <div class="row streams">
        <div class="col-xs-12 col-md-9 side-left">
            <div class="posts ">
                <ul class="posts-list">
                    <li class="content">
                        <div class="content-box posts-aside">
                            <div class="posts-item">
                                <br><br>分类归档列表: ${name} </div>
                        </div>
                    </li>
                    <#if !resultsjson??>
                        <li class="content">
                            <div class="content-box posts-aside">
                                <div class="posts-item">该目录下还没有内容!</div>
                            </div>
                        </li>
                    </#if>
                    <div id="table"></div>
                    <div id="pageBar"></div>
                </ul>
            </div>
            <div class="text-center">
                <@utils.pager request.requestURI, results, 5/>
            </div>
        </div>
        <div class="col-xs-12 col-md-3 side-right">
            <#include "/classic/inc/right.ftl" />
        </div>
    </div>
</@layout>
<script src="${base}/dist/vendors/layer/extend/layui.js"></script>
<script src="${base}/theme/classic/dist/js/nicePage.js"></script>
<script>
    var json = ${resultsjson};

    //nameList与widthList的数组长度要一致
    var nameList = ['序号', '标题', '封面','阅读','标签'] //table的列名
    var widthList = [50, 150, 100, 50, 100] //table每列的宽度

    /**
     * 初始化设置nicepage组件    v1.0
     *-------------------------------------------------------------
     * 进行数据组装,与layui交互进行元素渲染
     *-------------------------------------------------------------
     * @param    {string}  table     table的div id
     * @param    {string}  bar     底部分页的div id
     * @param    {int}  limit     每页默认行数
     * @param    {string}  color     底部分页的颜色
     * @param    {array}  layout     底部分页的布局,具体可参考layui api
     *
     * @date     2018-10-19
     * @author   duzhen wechat：wenxuejn
     */
    $(function () {
        nicePage.setCfg({
            table: 'table',
            bar: 'pageBar',
            limit: 20,
            color: '#1E9FFF',
            layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
        });
    }); //初始化完成

</script>
