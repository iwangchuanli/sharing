package com.sharing.modules.service;


import com.sharing.modules.entity.Category;

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
}
