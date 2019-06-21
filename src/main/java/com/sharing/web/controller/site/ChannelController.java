/*
+--------------------------------------------------------------------------
|   Sharing [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package com.sharing.web.controller.site;

import com.sharing.base.lang.Consts;
import com.sharing.base.utils.MarkdownUtils;
import com.sharing.modules.data.PostVO;
import com.sharing.modules.entity.Channel;
import com.sharing.modules.repository.PostRepository;
import com.sharing.modules.service.ChannelService;
import com.sharing.modules.service.PostSearchService;
import com.sharing.modules.service.PostService;
import com.sharing.web.controller.BaseController;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Channel 主页
 *
 * @author wangcl
 */
@Controller
public class ChannelController extends BaseController {
    @Autowired
    private ChannelService channelService;
    @Autowired
    private PostService postService;
    @Autowired
    private PostSearchService postSearchService;
    @Autowired
    private PostRepository postRepository;

    @RequestMapping("/channel/{id}")
    public String channel(@PathVariable Integer id, ModelMap model,
                          HttpServletRequest request) {
        // init params
        String order = ServletRequestUtils.getStringParameter(request, "order", Consts.order.NEWEST);
        int pageNo = ServletRequestUtils.getIntParameter(request, "pageNo", 1);

        Channel channel = channelService.getById(id);
        // callback params
        model.put("channel", channel);
        model.put("order", order);
        model.put("pageNo", pageNo);
        return view(Views.POST_INDEX);
    }

    @RequestMapping("/post/{id:\\d*}")
    public String view(@PathVariable Long id, ModelMap model) {
        PostVO view = postService.get(id);

        Assert.notNull(view, "该文章已被删除");

        if ("markdown".endsWith(view.getEditor())) {
            PostVO post = new PostVO();
            BeanUtils.copyProperties(view, post);
            post.setContent(MarkdownUtils.renderMarkdown(view.getContent()));
            view = post;
        }
        postService.identityViews(id);
        long last_post_id = postRepository.getLastPost();
        long prev_id = id - 1;
        PostVO prevP = new PostVO();
        prevP.setTitle("没有上一篇了");
        prevP.setId(id);
        while (prev_id > 0) {
            if (postService.get(prev_id) != null) {
                prevP = postService.get(prev_id);
                break;
            }
            prev_id--;
        }

        long next_id = id + 1;
        PostVO nextP = new PostVO();
        nextP.setTitle("没有下一篇了");
        nextP.setId(id);
        while (next_id <= last_post_id) {
            if (postService.get(next_id) != null) {
                nextP = postService.get(next_id);
                break;
            }
            next_id++;
        }
        List list = new ArrayList();
        list.add(prevP);
        list.add(nextP);

        List<Object[]> relevant = postSearchService.relevant(view.getTags());
        model.put("view", view);
        model.put("adjacent", list);
        model.put("revelant", relevant);
        return view(Views.POST_VIEW);
    }

}
