package com.sharing.modules.service;

import com.sharing.modules.data.PostTagVO;
import com.sharing.modules.data.TagVO;
import com.sharing.modules.entity.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @author : wangcl
 */
public interface TagService {
    Page<TagVO> pagingQueryTags(Pageable pageable);
    Page<PostTagVO> pagingQueryPosts(Pageable pageable, String tagName);
    void batchUpdate(String names, long latestPostId);
    void deteleMappingByPostId(long postId);
    List<Tag> getTagsView();
}
