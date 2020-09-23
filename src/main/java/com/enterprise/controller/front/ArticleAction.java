package com.enterprise.controller.front;

import com.enterprise.service.ArticleCategoryService;
import com.enterprise.service.Services;
import com.enterprise.core.SystemManage;
import com.enterprise.entity.Article;
import com.enterprise.entity.ArticleCategory;
import com.enterprise.entity.page.PageModel;
import com.enterprise.service.ArticleService;
import com.enterprise.controller.BaseController;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 文章Action
 * Created by Cesiumai on 2016/6/14.
 */
@Controller("frontArticleController")
@RequestMapping("/")
public class ArticleAction extends BaseController<Article>{
    private static final String page_toList = "/front/article/articleList";
    private static final String page_toEdit = "/front/article/articleInfo";
    private static final String code_start = "News";//新闻中心的关键字

    private  static final String announcement_page_toList = "/front/announcement/announcementList";//信息公开的list页
    private  static final String announcement_page_toEdit = "/front/announcement/announcementInfo";//信息公开的info页
    private  static final String announcement_code_start = "Announcement";//信息公开的关键字

    private  static final String party_page_toList = "/front/party/partyList";//党建文化的list页
    private  static final String party_page_toEdit = "/front/party/partyInfo";//党建文化的info页
    private  static final String party_code_start = "Party";//党建文化的关键字

    private  static final String business_page_toList = "/front/business/businessList";//集团业务的list页
    private  static final String business_page_toEdit = "/front/business/businessInfo";//集团业务的info页
    private  static final String business_code_start = "Business";//集团业务的关键字

    private  static final String education_page_toList = "/front/education/educationList";//红色教育的list页
    private  static final String education_page_toEdit = "/front/education/educationInfo";//红色教育的info页

    private  static final String search_page_toList = "/front/search/searchList";//搜索的list页
    private  static final String search_page_toEdit = "/front/search/searchInfo";//搜索的info页

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ArticleCategoryService articleCategoryService;

    @Override
    public Services<Article> getService() {
        return articleService;
    }

    public ArticleAction(){
        super.page_toList = page_toList;
        super.page_toEdit = page_toEdit;
    }

    /**
     * 跳转到文章列表
     * @param request
     * @param article
     * @return
     * @throws Exception
     */
    @RequestMapping("article")
    public String article(HttpServletRequest request, @ModelAttribute("e") Article article) throws Exception {

        this.initPageSelect();
        setParamWhenInitQuery(article);
        int offset = 0;
        if(request.getParameter("pager.offset")!=null){
            offset = Integer.parseInt(request.getParameter("pager.offset"));
        }
        if(offset < 0){
            offset=0;
        }
        article.setOffset(offset);

        PageModel page = getService().selectPageList(article);
        if(page == null){
            page = new PageModel();
        }else{
            List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
            List<String> titleList = new ArrayList<>();
            for(ArticleCategory category:articleCategoryList){
                if(category.getCode().startsWith(code_start)){
                    titleList.add(category.getCatename());
                }
            }
            List<Article> list = page.getList();
            List<Article> list1 = new ArrayList<>();
            for(Article article1:list){
                for(String title:titleList){
                    if(article1.getCatename().equals(title)){
                        list1.add(article1);
                        break;
                    }
                }
            }
            page.setTotal(list1.size());
            page.setList(list1);
        }
        page.setPageSize(10);    //设置单页数据为10
        page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                / page.getPageSize());
        selectListAfter(page);
        page.setPagerUrl("article");
        request.setAttribute("pager", page);
        return page_toList;
    }


    /**
     * 文章详情
     * @param code
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("article/{code}")
    public String selectOne(HttpServletRequest request,@ModelAttribute("code")@PathVariable("code") String code,@ModelAttribute("e") Article article, ModelMap model) throws Exception {
        if(isInteger(code)) {   //如果是数字   则为id   按id进行文章查询
            Article e = articleService.selectById(Integer.parseInt(code));
            e.setHit(String.valueOf(Integer.parseInt(e.getHit())+1));
            articleService.update(e);       //更新浏览量     --优化建议：可使用缓存或者redis暂存  然后再刷入数据库
            ArticleCategory category = articleCategoryService.selectById(Integer.parseInt(e.getCategoryId()));
            e.setCatename(category.getCatename());
            Article next = articleService.selectNext(Integer.parseInt(code));
            if(next==null){
                next = new Article();
            }
            Article previous = articleService.selectPrevious(Integer.parseInt(code));
            if(previous==null){
                previous = new Article();
            }
            model.addAttribute("e", e);
            model.addAttribute("next", next);
            model.addAttribute("previous", previous);
            return page_toEdit;
        }else{//不是数字，则为分类编码
            String cateNameTemp = "";
            for(ArticleCategory item: SystemManage.getInstance().getArticleCategory()){ //遍历分类缓存
                if(code.equals(item.getCode())){        //当编码相等时
                    article.setCategoryId(String.valueOf(item.getId()));    //把相等编码里的分类id值赋予文章中catagroyId中
                    cateNameTemp = item.getCatename();
                    break;  //跳出循环
                }
            }
            if(StringUtils.isBlank(article.getCategoryId())){
                List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
                for(ArticleCategory category:articleCategoryList){
                    if(category.getCode().equals(code)){
                        article.setCategoryId(String.valueOf(category.getId()));
                        cateNameTemp = category.getCode();
                        break;
                    }
                }
            }
            setParamWhenInitQuery(article);
            int offset = 0;
            if(request.getParameter("pager.offset")!=null){
                offset = Integer.parseInt(request.getParameter("pager.offset"));
            }
            if(offset < 0){
                offset=0;
            }
            article.setOffset(offset);
            PageModel page = getService().selectPageList(article);
            if(page == null){
                page = new PageModel();
            }else{
                List<Article> list = page.getList();
                List<Article> list1 = new ArrayList<>();
                for(Article article1:list){
                    if(article1.getCatename().equals(cateNameTemp)){
                        list1.add(article1);
                    }
                }
                page.setTotal(list1.size());
                page.setList(list1);
            }
            page.setPageSize(10);    //设置单页数据为10
            page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                    / page.getPageSize());
            selectListAfter(page);
            page.setPagerUrl(code);
            request.setAttribute("pager", page);
            request.setAttribute("code", code);
            request.setAttribute("cateName", cateNameTemp);
            return page_toList;
        }

    }

    /**
     *判断是不是数字
     * @param code
     * @return
     */
    public static boolean isInteger(String code){
        try {
            Integer.parseInt(code);
            return true;
        }catch (NumberFormatException e){
            return false;
        }
    }

    @RequestMapping("article/announcement")
    public String articleAnnouncement(HttpServletRequest request, @ModelAttribute("e") Article article) throws Exception {

        this.initPageSelect();
        setParamWhenInitQuery(article);
        int offset = 0;
        if(request.getParameter("pager.offset")!=null){
            offset = Integer.parseInt(request.getParameter("pager.offset"));
        }
        if(offset < 0){
            offset=0;
        }
        article.setOffset(offset);

        PageModel page = getService().selectPageList(article);
        if(page == null){
            page = new PageModel();
        }else{
            List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
            List<String> titleList = new ArrayList<>();
            for(ArticleCategory category:articleCategoryList){
                if(category.getCode().startsWith(announcement_code_start)){
                    titleList.add(category.getCatename());
                }
            }
            List<Article> list = page.getList();
            List<Article> list1 = new ArrayList<>();
            for(Article article1:list){
                for(String title:titleList){
                    if(article1.getCatename().equals(title)){
                        list1.add(article1);
                        break;
                    }
                }
            }
            page.setTotal(list1.size());
            page.setList(list1);
        }
        page.setPageSize(10);    //设置单页数据为10
        page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                / page.getPageSize());
        selectListAfter(page);
        page.setPagerUrl("article");
        request.setAttribute("pager", page);
        return announcement_page_toList;
    }

    /**
     * 人才招聘列表及详情
     * @param code
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("article/announcement/{code}")
    public String selectOneAnnouncement(HttpServletRequest request,@ModelAttribute("code")@PathVariable("code") String code,@ModelAttribute("e") Article article, ModelMap model) throws Exception {
        if(isInteger(code)) {   //如果是数字   则为id   按id进行文章查询
            Article e = articleService.selectById(Integer.parseInt(code));
            e.setHit(String.valueOf(Integer.parseInt(e.getHit())+1));
            articleService.update(e);       //更新浏览量     --优化建议：可使用缓存或者redis暂存  然后再刷入数据库
            ArticleCategory category = articleCategoryService.selectById(Integer.parseInt(e.getCategoryId()));
            e.setCatename(category.getCatename());
            Article next = articleService.selectNext(Integer.parseInt(code));
            if(next==null){
                next = new Article();
            }
            Article previous = articleService.selectPrevious(Integer.parseInt(code));
            if(previous==null){
                previous = new Article();
            }
            model.addAttribute("e", e);
            model.addAttribute("next", next);
            model.addAttribute("previous", previous);
            return announcement_page_toEdit;
        }else{//不是数字，则为分类编码
            String cateNameTemp = "";
            for(ArticleCategory item: SystemManage.getInstance().getArticleCategory()){ //遍历分类缓存
                if(code.equals(item.getCode())){        //当编码相等时
                    article.setCategoryId(String.valueOf(item.getId()));    //把相等编码里的分类id值赋予文章中catagroyId中
                    cateNameTemp = item.getCatename();
                    break;  //跳出循环
                }
            }
            if(StringUtils.isBlank(article.getCategoryId())){
                List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
                for(ArticleCategory category:articleCategoryList){
                    if(category.getCode().equals(code)){
                        article.setCategoryId(String.valueOf(category.getId()));
                        cateNameTemp = category.getCode();
                        break;
                    }
                }
            }
            setParamWhenInitQuery(article);
            int offset = 0;
            if(request.getParameter("pager.offset")!=null){
                offset = Integer.parseInt(request.getParameter("pager.offset"));
            }
            if(offset < 0){
                offset=0;
            }
            article.setOffset(offset);
            PageModel page = getService().selectPageList(article);
            if(page == null){
                page = new PageModel();
            }
            page.setPageSize(10);    //设置单页数据为10
            page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                    / page.getPageSize());
            selectListAfter(page);
            page.setPagerUrl(code);
            request.setAttribute("pager", page);
            request.setAttribute("code", code);
            request.setAttribute("cateName", cateNameTemp);
            return announcement_page_toList;
        }
    }

    /**
     * 党建文化总列表
     */
    @RequestMapping("article/party")
    public String articleParty(HttpServletRequest request, @ModelAttribute("e") Article article) throws Exception {

        this.initPageSelect();
        setParamWhenInitQuery(article);
        int offset = 0;
        if(request.getParameter("pager.offset")!=null){
            offset = Integer.parseInt(request.getParameter("pager.offset"));
        }
        if(offset < 0){
            offset=0;
        }
        article.setOffset(offset);

        PageModel page = getService().selectPageList(article);
        if(page == null){
            page = new PageModel();
        }else{
            List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
            List<String> titleList = new ArrayList<>();
            for(ArticleCategory category:articleCategoryList){
                if(category.getCode().startsWith(party_code_start)){
                    titleList.add(category.getCatename());
                }
            }
            List<Article> list = page.getList();
            List<Article> list1 = new ArrayList<>();
            for(Article article1:list){
                for(String title:titleList){
                    if(article1.getCatename().equals(title)){
                        list1.add(article1);
                        break;
                    }
                }
            }
            page.setTotal(list1.size());
            page.setList(list1);
        }
        page.setPageSize(10);    //设置单页数据为10
        page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                / page.getPageSize());
        selectListAfter(page);
        page.setPagerUrl("article");
        request.setAttribute("pager", page);
        return party_page_toList;
    }

    /**
     * 党建文化列表及详情
     */
    @RequestMapping("article/party/{code}")
    public String selectOneParty(HttpServletRequest request,@ModelAttribute("code")@PathVariable("code") String code,@ModelAttribute("e") Article article, ModelMap model) throws Exception {
        if(isInteger(code)) {   //如果是数字   则为id   按id进行文章查询
            Article e = articleService.selectById(Integer.parseInt(code));
            e.setHit(String.valueOf(Integer.parseInt(e.getHit())+1));
            articleService.update(e);       //更新浏览量     --优化建议：可使用缓存或者redis暂存  然后再刷入数据库
            ArticleCategory category = articleCategoryService.selectById(Integer.parseInt(e.getCategoryId()));
            e.setCatename(category.getCatename());
            Article next = articleService.selectNext(Integer.parseInt(code));
            if(next==null){
                next = new Article();
            }
            Article previous = articleService.selectPrevious(Integer.parseInt(code));
            if(previous==null){
                previous = new Article();
            }
            model.addAttribute("e", e);
            model.addAttribute("next", next);
            model.addAttribute("previous", previous);
            return party_page_toEdit;
        }else{//不是数字，则为分类编码
            String cateNameTemp = "";
            for(ArticleCategory item: SystemManage.getInstance().getArticleCategory()){ //遍历分类缓存
                if(code.equals(item.getCode())){        //当编码相等时
                    article.setCategoryId(String.valueOf(item.getId()));    //把相等编码里的分类id值赋予文章中catagroyId中
                    cateNameTemp = item.getCatename();
                    break;  //跳出循环
                }
            }
            if(StringUtils.isBlank(article.getCategoryId())){
                List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
                for(ArticleCategory category:articleCategoryList){
                    if(category.getCode().equals(code)){
                        article.setCategoryId(String.valueOf(category.getId()));
                        cateNameTemp = category.getCode();
                        break;
                    }
                }
            }
            setParamWhenInitQuery(article);
            int offset = 0;
            if(request.getParameter("pager.offset")!=null){
                offset = Integer.parseInt(request.getParameter("pager.offset"));
            }
            if(offset < 0){
                offset=0;
            }
            article.setOffset(offset);
            PageModel page = getService().selectPageList(article);
            if(page == null){
                page = new PageModel();
            }else{
                List<Article> list = page.getList();
                List<Article> list1 = new ArrayList<>();
                for(Article article1:list){
                    if(article1.getCatename().equals(cateNameTemp)){
                        list1.add(article1);
                    }
                }
                page.setTotal(list1.size());
                page.setList(list1);
            }
            page.setPageSize(10);    //设置单页数据为10
            page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                    / page.getPageSize());
            selectListAfter(page);
            page.setPagerUrl(code);
            request.setAttribute("pager", page);
            request.setAttribute("code", code);
            request.setAttribute("cateName", cateNameTemp);
            return party_page_toList;
        }
    }

    @RequestMapping("article/business")
    public String articleBusiness(HttpServletRequest request, @ModelAttribute("e") Article article) throws Exception {

        this.initPageSelect();
        setParamWhenInitQuery(article);
        int offset = 0;
        if(request.getParameter("pager.offset")!=null){
            offset = Integer.parseInt(request.getParameter("pager.offset"));
        }
        if(offset < 0){
            offset=0;
        }
        article.setOffset(offset);

        PageModel page = getService().selectPageList(article);
        if(page == null){
            page = new PageModel();
        }else{
            List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
            List<String> titleList = new ArrayList<>();
            for(ArticleCategory category:articleCategoryList){
                if(category.getCode().startsWith(business_code_start)){
                    titleList.add(category.getCatename());
                }
            }
            List<Article> list = page.getList();
            List<Article> list1 = new ArrayList<>();
            for(Article article1:list){
                for(String title:titleList){
                    if(article1.getCatename().equals(title)){
                        list1.add(article1);
                        break;
                    }
                }
            }
            page.setTotal(list1.size());
            page.setList(list1);
        }
        page.setPageSize(10);    //设置单页数据为10
        page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                / page.getPageSize());
        selectListAfter(page);
        page.setPagerUrl("article");
        request.setAttribute("pager", page);
        return business_page_toList;
    }

    /**
     * 集团业务列表及详情
     * @param code
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("article/business/{code}")
    public String selectOneBusiness(HttpServletRequest request,@ModelAttribute("code")@PathVariable("code") String code,@ModelAttribute("e") Article article, ModelMap model) throws Exception {
        if(isInteger(code)) {   //如果是数字   则为id   按id进行文章查询
            Article e = articleService.selectById(Integer.parseInt(code));
            e.setHit(String.valueOf(Integer.parseInt(e.getHit())+1));
            articleService.update(e);       //更新浏览量     --优化建议：可使用缓存或者redis暂存  然后再刷入数据库
            ArticleCategory category = articleCategoryService.selectById(Integer.parseInt(e.getCategoryId()));
            e.setCatename(category.getCatename());
            Article next = articleService.selectNext(Integer.parseInt(code));
            if(next==null){
                next = new Article();
            }
            Article previous = articleService.selectPrevious(Integer.parseInt(code));
            if(previous==null){
                previous = new Article();
            }
            model.addAttribute("e", e);
            model.addAttribute("next", next);
            model.addAttribute("previous", previous);
            return business_page_toEdit;
        }else{//不是数字，则为分类编码
            String cateNameTemp = "";
            for(ArticleCategory item: SystemManage.getInstance().getArticleCategory()){ //遍历分类缓存
                if(code.equals(item.getCode())){        //当编码相等时
                    article.setCategoryId(String.valueOf(item.getId()));    //把相等编码里的分类id值赋予文章中catagroyId中
                    cateNameTemp = item.getCatename();
                    break;  //跳出循环
                }
            }
            if(StringUtils.isBlank(article.getCategoryId())){
                List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
                for(ArticleCategory category:articleCategoryList){
                    if(category.getCode().equals(code)){
                        article.setCategoryId(String.valueOf(category.getId()));
                        cateNameTemp = category.getCode();
                        break;
                    }
                }
            }
            setParamWhenInitQuery(article);
            int offset = 0;
            if(request.getParameter("pager.offset")!=null){
                offset = Integer.parseInt(request.getParameter("pager.offset"));
            }
            if(offset < 0){
                offset=0;
            }
            article.setOffset(offset);
            PageModel page = getService().selectPageList(article);
            if(page == null){
                page = new PageModel();
            }else{
                List<Article> list = page.getList();
                List<Article> list1 = new ArrayList<>();
                for(Article article1:list){
                    if(article1.getCatename().equals(cateNameTemp)){
                        list1.add(article1);
                    }
                }
                page.setTotal(list1.size());
                page.setList(list1);
            }
            page.setPageSize(10);    //设置单页数据为10
            page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                    / page.getPageSize());
            selectListAfter(page);
            page.setPagerUrl(code);
            request.setAttribute("pager", page);
            request.setAttribute("code", code);
            request.setAttribute("cateName", cateNameTemp);
            return business_page_toList;
        }
    }


    @RequestMapping("article/education")
    public String articleEducation(HttpServletRequest request, @ModelAttribute("e") Article article) throws Exception {

        this.initPageSelect();
        setParamWhenInitQuery(article);
        int offset = 0;
        if(request.getParameter("pager.offset")!=null){
            offset = Integer.parseInt(request.getParameter("pager.offset"));
        }
        if(offset < 0){
            offset=0;
        }
        article.setOffset(offset);

        PageModel page = getService().selectPageList(article);
        if(page == null){
            page = new PageModel();
        }else{
            List<Article> list = page.getList();
            List<Article> list1 = new ArrayList<>();
            for(Article article1:list){
                if(article1.getCatename().equals("产业投资") || article1.getCatename().equals("开发建设")
                        || article1.getCatename().equals("民生教育") || article1.getCatename().equals("资本运作")){
                    list1.add(article1);
                }
            }
            page.setTotal(list1.size());
            page.setList(list1);
        }
        page.setPageSize(10);    //设置单页数据为10
        page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                / page.getPageSize());
        selectListAfter(page);
        page.setPagerUrl("article");
        request.setAttribute("pager", page);
        return education_page_toList;
    }

    /**
     * 集团业务列表及详情
     * @param code
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("article/education/{code}")
    public String selectOneEducation(HttpServletRequest request,@ModelAttribute("code")@PathVariable("code") String code,@ModelAttribute("e") Article article, ModelMap model) throws Exception {
        if(isInteger(code)) {   //如果是数字   则为id   按id进行文章查询
            Article e = articleService.selectById(Integer.parseInt(code));
            e.setHit(String.valueOf(Integer.parseInt(e.getHit())+1));
            articleService.update(e);       //更新浏览量     --优化建议：可使用缓存或者redis暂存  然后再刷入数据库
            ArticleCategory category = articleCategoryService.selectById(Integer.parseInt(e.getCategoryId()));
            e.setCatename(category.getCatename());
            Article next = articleService.selectNext(Integer.parseInt(code));
            if(next==null){
                next = new Article();
            }
            Article previous = articleService.selectPrevious(Integer.parseInt(code));
            if(previous==null){
                previous = new Article();
            }
            model.addAttribute("e", e);
            model.addAttribute("next", next);
            model.addAttribute("previous", previous);
            return education_page_toEdit;
        }else{//不是数字，则为分类编码
            String cateNameTemp = "";
            for(ArticleCategory item: SystemManage.getInstance().getArticleCategory()){ //遍历分类缓存
                if(code.equals(item.getCode())){        //当编码相等时
                    article.setCategoryId(String.valueOf(item.getId()));    //把相等编码里的分类id值赋予文章中catagroyId中
                    cateNameTemp = item.getCatename();
                    break;  //跳出循环
                }
            }
            if(StringUtils.isBlank(article.getCategoryId())){
                List<ArticleCategory> articleCategoryList = articleCategoryService.selectList(null);
                for(ArticleCategory category:articleCategoryList){
                    if(category.getCode().equals(code)){
                        article.setCategoryId(String.valueOf(category.getId()));
                        cateNameTemp = category.getCode();
                        break;
                    }
                }
            }
            setParamWhenInitQuery(article);
            int offset = 0;
            if(request.getParameter("pager.offset")!=null){
                offset = Integer.parseInt(request.getParameter("pager.offset"));
            }
            if(offset < 0){
                offset=0;
            }
            article.setOffset(offset);
            PageModel page = getService().selectPageList(article);
            if(page == null){
                page = new PageModel();
            }else{
                List<Article> list = page.getList();
                List<Article> list1 = new ArrayList<>();
                for(Article article1:list){
                    if(article1.getCatename().equals(cateNameTemp)){
                        list1.add(article1);
                    }
                }
                page.setTotal(list1.size());
                page.setList(list1);
            }
            page.setPageSize(10);    //设置单页数据为10
            page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                    / page.getPageSize());
            selectListAfter(page);
            page.setPagerUrl(code);
            request.setAttribute("pager", page);
            request.setAttribute("code", code);
            request.setAttribute("cateName", cateNameTemp);
            return education_page_toList;
        }
    }


    @RequestMapping("article/search")
    public String articleSearch(HttpServletRequest request, @ModelAttribute("e") Article article) throws Exception {
        String keyword=request.getParameter("keyword");
        this.initPageSelect();
        setParamWhenInitQuery(article);
        int offset = 0;
        if(request.getParameter("pager.offset")!=null){
            offset = Integer.parseInt(request.getParameter("pager.offset"));
        }
        if(offset < 0){
            offset=0;
        }
        article.setOffset(offset);

        PageModel page = getService().selectPageList(article);
        if(page == null){
            page = new PageModel();
        }else{
            List<Article> list = page.getList();
            List<Article> list1 = new ArrayList<>();
            for(Article article1:list){
                if(article1.getTitle().contains(keyword)){
                    list1.add(article1);
                }
            }
            page.setTotal(list1.size());
            page.setList(list1);
        }
        page.setPageSize(10);    //设置单页数据为10
        page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
                / page.getPageSize());
        selectListAfter(page);
        page.setPagerUrl("article");
        request.setAttribute("pager", page);
        return search_page_toList;
    }

    /**
     * 集团业务列表及详情
     * @param code
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("article/search/{code}")
    public String selectOneSearch(HttpServletRequest request,@ModelAttribute("code")@PathVariable("code") String code,@ModelAttribute("e") Article article, ModelMap model) throws Exception {
        if(isInteger(code)) {   //如果是数字   则为id   按id进行文章查询
            Article e = articleService.selectById(Integer.parseInt(code));
            e.setHit(String.valueOf(Integer.parseInt(e.getHit())+1));
            articleService.update(e);       //更新浏览量     --优化建议：可使用缓存或者redis暂存  然后再刷入数据库
            ArticleCategory category = articleCategoryService.selectById(Integer.parseInt(e.getCategoryId()));
            e.setCatename(category.getCatename());
            Article next = articleService.selectNext(Integer.parseInt(code));
            if(next==null){
                next = new Article();
            }
            Article previous = articleService.selectPrevious(Integer.parseInt(code));
            if(previous==null){
                previous = new Article();
            }
            model.addAttribute("e", e);
            model.addAttribute("next", next);
            model.addAttribute("previous", previous);
            return search_page_toEdit;
        }
        return null;
    }
}
