/*
+--------------------------------------------------------------------------
|   Sharing [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package com.sharing.web.controller.site.auth;

import com.sharing.web.controller.BaseController;
import com.sharing.web.controller.site.Views;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

/**
 * @author wangcl
 */
@Controller
public class LogoutController extends BaseController {

    /**
     * 退出登录
     *
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletResponse response) {
        SecurityUtils.getSubject().logout();
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
        return Views.REDIRECT_INDEX;
    }

}
