package com.sharing.modules.repository;

import com.sharing.modules.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer>, JpaSpecificationExecutor<Category> {

    @Query("select categoryId,categoryName from Category")
    List<Object[]> queryAllCategory();

    @Query("select id,categoryId,categoryName,parentCategory,created,updated from Category where categoryId=:categoryId")
    List<Object[]> queryCategoryByCategoryID(@Param("categoryId") int categoryId);



}
