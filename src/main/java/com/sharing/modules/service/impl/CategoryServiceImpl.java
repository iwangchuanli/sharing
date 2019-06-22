package com.sharing.modules.service.impl;

import com.sharing.modules.repository.CategoryRepository;
import com.sharing.modules.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
