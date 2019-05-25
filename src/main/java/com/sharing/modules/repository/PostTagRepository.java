package com.sharing.modules.repository;

import com.sharing.modules.entity.PostTag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

/**
 * @author : wangcl
 */
@Repository
public interface PostTagRepository extends JpaRepository<PostTag, Long>, JpaSpecificationExecutor<PostTag> {
    Page<PostTag> findAllByTagId(Pageable pageable, long tagId);
    PostTag findByPostIdAndTagId(long postId, long tagId);
    int deleteByPostId(long postId);
}
