package com.enterprise.controller.front;

import com.enterprise.entity.Article;
import com.enterprise.entity.ArticleCategory;
import com.enterprise.service.ArticleCategoryService;
import com.enterprise.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 主页
 * Created by Cesiumai on 2016/6/15.
 */
@Controller
@RequestMapping("/")
public class IndexAction {
    private static final String news_code_start = "News";//新闻中心的关键字

    private static final String announcement_code_start = "Announcement";//信息公开的关键字

    private static final String party_code_start = "Party";//党建文化关键字

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ArticleCategoryService articleCategoryService;

    @RequestMapping({"/", "/index"})
    public String index(HttpServletRequest request) {
        List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
        List<String> newsTitle = new ArrayList<>();
        List<String> announcementTitle = new ArrayList<>();
        List<String> partyTitle = new ArrayList<>();
        for(ArticleCategory category:articleCategoryList){
            if(category.getCode().startsWith(news_code_start)){
                newsTitle.add(String.valueOf(category.getId()));
            }
            if(category.getCode().startsWith(announcement_code_start)){
                announcementTitle.add(String.valueOf(category.getId()));
            }
            if(category.getCode().startsWith(party_code_start)){
                partyTitle.add(String.valueOf(category.getId()));
            }
        }
        List<Article> articleList = articleService.selectList(null);

        List<Article> newsList = new ArrayList<>();
        List<Article> announcementList = new ArrayList<>();
        List<Article> partyList = new ArrayList<>();
        for(Article article:articleList){
            //新闻
            for(String news:newsTitle){
                if(article.getCategoryId().equals(news)){
                    newsList.add(article);
                    break;
                }
            }
            //公告
            for(String announcement:announcementTitle){
                if(article.getCategoryId().equals(announcement)){
                    announcementList.add(article);
                    break;
                }
            }
            //党建文化
            for(String party:partyTitle){
                if(article.getCategoryId().equals(party)){
                    partyList.add(article);
                    break;
                }
            }
        }

        List<Article> newss = new ArrayList<>();
        if(newsList.size()<=5){
            newss.addAll(newsList);
        }else{
            newss.addAll(newsList.subList(0,5));
        }

        List<Article> announcements = new ArrayList<>();
        if(announcementList.size()<=5){
            announcements.addAll(announcementList);
        }else{
            announcements.addAll(announcementList.subList(0,5));
        }

        List<Article> partys = new ArrayList<>();
        if(partyList.size()<=3){
            partys.addAll(partyList);
        }else{
            partys.addAll(partyList.subList(0,3));
        }

        request.setAttribute("newss",newss);
        request.setAttribute("announcements",announcements);
        request.setAttribute("partys",partys);
        return "/front/index";
    }


}

