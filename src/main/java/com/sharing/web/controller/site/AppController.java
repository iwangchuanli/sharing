package com.sharing.web.controller.site;

import com.sharing.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;

@Controller
public class AppController extends BaseController {

    @RequestMapping("/app/test")
    public String helloHtml(HashMap<String, Object> map) {
        map.put("hello", "欢迎进入HTML页面");
        return "/app/test";
    }

}
