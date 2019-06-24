package com.sharing.modules.service.impl;

import com.sharing.modules.entity.Category;
import com.sharing.modules.repository.CategoryRepository;
import com.sharing.modules.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public List getCategoryInfo() {
        List<Object> category = new ArrayList();
        for (Object[] obj : categoryRepository.queryAllCategory()) {
            Map item = new HashMap();
            item.put("id", obj[0]);
            item.put("name", obj[1]);
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
}
