/*
+--------------------------------------------------------------------------
|   Sharing [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 sharing. All Rights Reserved
|   http://www.sharing.wangcl.xyz
|
+---------------------------------------------------------------------------
*/
package com.sharing.modules.repository;

import com.sharing.modules.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Collection;

/**
 * @author wangcl
 */
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {
    User findByUsername(String username);

    User findByEmail(String email);

    @Modifying
    @Query("update User set posts = posts + :increment where id = :id")
    int updatePosts(@Param("id") long id, @Param("increment") int increment);

    @Modifying
    @Query("update User set comments = comments + :increment where id in (:ids)")
    int updateComments(@Param("ids") Collection<Long> ids, @Param("increment") int increment);

}
