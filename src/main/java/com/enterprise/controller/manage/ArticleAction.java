package com.enterprise.controller.manage;

import com.enterprise.service.Services;
import com.enterprise.entity.Article;
import com.enterprise.service.ArticleService;
import com.enterprise.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 文章管理Action
 * Created by Cesiumai on 2016/6/14.
 */
@Controller
@RequestMapping("/manage/article/")
public class ArticleAction extends BaseController<Article>{
    private static final String page_toList = "/manage/article/articleList";
    private static final String page_toEdit = "/manage/article/articleEdit";
    private static final String page_toAdd = "/manage/article/articleEdit";
    @Autowired
    private ArticleService articleService;
    @Override
    public Services<Article> getService() {
        return articleService;
    }
    private ArticleAction(){
        super.page_toList = page_toList;
        super.page_toEdit = page_toEdit;
        super.page_toAdd = page_toAdd;
    }

    @RequestMapping(value="delete")
    public String delete(HttpServletRequest request, String id, RedirectAttributes flushAttrs) throws Exception{
        Article article = new Article();
        article.setId(Integer.valueOf(id));
        getService().delete(article);
        addMessage(flushAttrs,"操作成功！");
        return "redirect:selectList";
    }
}
