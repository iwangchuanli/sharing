/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package com.sharing.web.controller.site;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sharing.base.lang.Consts;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharing.web.controller.BaseController;

import java.io.IOException;
import java.io.Writer;

/**
 * @author wangcl
 *
 */
@Controller
public class IndexController extends BaseController{
	
	@RequestMapping(value= {"/", "/index"})
	public String root(ModelMap model, HttpServletRequest request) {
		String order = ServletRequestUtils.getStringParameter(request, "order", Consts.order.NEWEST);
		int pageNo = ServletRequestUtils.getIntParameter(request, "pageNo", 1);
		model.put("order", order);
		model.put("pageNo", pageNo);
		return view(Views.INDEX);
	}

	/**
	 * robots txt
	 *
	 * @return
	 */
	@RequestMapping("/robots.txt")
	public void robotsTxt(HttpServletResponse response) throws IOException {
		Writer writer = response.getWriter();
		String lineSeparator = System.getProperty("line.separator", "\n");
		writer.append("User-agent: *").append(lineSeparator);
		writer.append("allow:").append("/post/").append(lineSeparator);
		writer.append("allow:").append("/channel/").append(lineSeparator);
		writer.append("allow:").append("/search?").append(lineSeparator);
		writer.append("Disallow:").append("/admin").append(lineSeparator);
		writer.append("Disallow:").append("/users/").append(lineSeparator);
		writer.append("Disallow:").append("/tag/").append(lineSeparator);
		writer.append("Disallow:").append("/oauth/").append(lineSeparator);
	}

}
