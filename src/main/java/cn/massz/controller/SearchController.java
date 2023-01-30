package cn.massz.controller;

import cn.massz.controller.util.R;
import cn.massz.dao.SearchMapper;
import cn.massz.model.Bar;
import cn.massz.model.Posts;
import cn.massz.model.Users;
import cn.massz.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {


    @Autowired
    private SearchService searchService;
    @RequestMapping ("/toSearch")
    public String toSearch(){
       return "search";
    }

    @RequestMapping ("/toResult")
    public String toResult(){
        return "result";
    }

    /*搜索吧*/
    @PostMapping("/searchBar")
    @ResponseBody
    public R searchByName(Bar bar, HttpSession session){
        Users users= (Users) session.getAttribute("userSession");
        R r=new R();
        List<Bar> barList = searchService.searchByName(bar);
        Boolean selfolbar = searchService.selfolbar(bar.getBarName(), users.getUser_id());
        if (barList!=null){
            r.setCode(200);
            session.setAttribute("barList",barList);
            session.setAttribute("selfolbar",selfolbar);
        }
        return r;
    }


    /*进入贴吧*/
    @PostMapping ("/getAllPosts")
    @ResponseBody
    public ModelAndView getAllPosts(String barName){
        System.out.println(barName);
        ModelAndView modelAndView=new ModelAndView();
        List<Posts> allPostsByBarName = searchService.getAllPostsByBarName(barName);
        if (allPostsByBarName!=null){
            modelAndView.addObject("allPostsByBarName",allPostsByBarName);
            modelAndView.setViewName("postBar");
        }
        return modelAndView;
    }

    /*关注吧*/
    @PostMapping ("/getFollowBar")
    @ResponseBody
    public R getFollowBar(Integer barId,HttpSession session){
        Users users= (Users) session.getAttribute("userSession");
        R r=new R();
        int i = searchService.insertFollowBar(barId, users.getUser_id());
        if (i>0){
            r.setCode(200);
        }
        return r;
    }

}
