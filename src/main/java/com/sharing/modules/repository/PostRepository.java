
package com.sharing.modules.repository;

import com.sharing.modules.entity.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author wangcl
 */
public interface PostRepository extends JpaRepository<Post, Long>, JpaSpecificationExecutor<Post> {
    /**
     * 查询指定用户
     *
     * @param pageable
     * @param authorId
     * @return
     */
    Page<Post> findAllByAuthorId(Pageable pageable, long authorId);

    @Query("select coalesce(max(weight), 0) from Post")
    int maxWeight();

    @Modifying
    @Query("update Post set views = views + :increment where id = :id")
    void updateViews(@Param("id") long id, @Param("increment") int increment);

    @Modifying
    @Query("update Post set favors = favors + :increment where id = :id")
    void updateFavors(@Param("id") long id, @Param("increment") int increment);

    @Modifying
    @Query("update Post set comments = comments + :increment where id = :id")
    void updateComments(@Param("id") long id, @Param("increment") int increment);

    @Query(value = "select id,created,thumbnail,title,views from Post")
    List<Object[]> queryAllPost();

    @Query(nativeQuery = true, value = "SELECT id from sharing_post order by id desc limit 1 ")
    long getLastPost();

    @Query("select id,title from Post where title like CONCAT('%',:tag,'%')")
    List<Object[]> queryPostByTag(@Param("tag") String tag);

}
