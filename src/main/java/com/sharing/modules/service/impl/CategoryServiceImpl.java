package com.sharing.modules.service.impl;

import com.sharing.base.utils.BeanMapUtils;
import com.sharing.modules.data.PostCategoryVo;
import com.sharing.modules.data.PostVO;
import com.sharing.modules.entity.Category;
import com.sharing.modules.entity.Post;
import com.sharing.modules.repository.CategoryRepository;
import com.sharing.modules.repository.PostRepository;
import com.sharing.modules.service.CategoryService;
import com.sharing.modules.service.PostService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private PostRepository postRepository;
    @Autowired
    private PostService postService;

    @Override
    public List getCategoryInfo() {
        List<Object> category = new ArrayList();
        for (Object[] obj : categoryRepository.queryAllCategory()) {
            Map item = new HashMap();
            item.put("id", obj[0]);
            item.put("name", obj[1]);
            item.put("parent", obj[2]);
            category.add(item);
        }
        return category;
    }

    @Override
    public Category getCategoryByID(int categoryId) {
        Category category = new Category();
        for (Object[] obj : categoryRepository.queryCategoryByCategoryID(categoryId)) {
            if (obj.length == 6) {
                category.setId((Integer) obj[0]);
                category.setCategoryId((Integer) obj[1]);
                category.setCategoryName((String) obj[2]);
                category.setParentCategory((Integer) obj[3]);
                category.setCreated((Date) obj[4]);
                category.setUpdated((Date) obj[5]);
            }
        }
        return category;
    }

    @Override
    public String jsonQueryPosts(String categoryName) {
        List<String> itemList = new ArrayList<>();
        for (Object[] obj : postRepository.queryPostByCategory(categoryName)) {
            String item = "{\"id\": \"" + obj[0] + "\",\"title\": \""
                    + "<a href=\'/post/" + categoryName + "-" + obj[0] + ".html\' title=\'" + obj[1] + "\'>" + obj[1] + "<\\a>" +
                    "\",\"thumbnail\": \"<img src=\'" + obj[2] + "\' alt='postImg'>" +
                    "\",\"views\": \"" + obj[5] + "\",\"tags\": \"" + obj[6] + "\"}";
            itemList.add(item);
        }
        String returnJson = "[" + StringUtils.join(itemList.toArray(), ",") + "]";
        return returnJson;
    }
}
