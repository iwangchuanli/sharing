package com.sharing.web.controller.site;

import com.sharing.modules.service.CategoryService;
import com.sharing.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController extends BaseController {

    @Autowired
    private CategoryService categoryService;
    @RequestMapping("/category")
    public String index(ModelMap model){

        return view(Views.CATEGORY_INDEX);
    }

    @RequestMapping("/category/{name}")
    public String category(@PathVariable String name, ModelMap model) {
        Pageable pageable = wrapPageable(Sort.by(Sort.Direction.DESC, "weight"));
        model.put("resultsjson",categoryService.jsonQueryPosts(name));
        model.put("name", name);
        return view(Views.CATEGORY_VIEW);
    }

}
