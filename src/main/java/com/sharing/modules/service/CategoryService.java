package com.sharing.modules.service;


import com.sharing.modules.entity.Category;
import com.sharing.modules.entity.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CategoryService {
    /*
     * 获取分类id和分类名
     * */
    List getCategoryInfo();

    /*
     * 通过id获得分类名
     * */
    Category getCategoryByID(int categoryId);

    /*
     * 通过分类名获取所有的文章
     * */
    String jsonQueryPosts(String categoryName);

}
