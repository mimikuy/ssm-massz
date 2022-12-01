package cn.massz.controller;

import cn.massz.controller.util.R;
import cn.massz.dao.SearchMapper;
import cn.massz.model.Bar;
import cn.massz.model.Posts;
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


    @PostMapping("/searchBar")
    @ResponseBody
    public R searchByName(Bar bar, HttpSession session){
       /* ModelAndView modelAndView =new ModelAndView();
        List<Bar> barList = searchMapper.searchByName(bar);
        if (barList!=null){
            modelAndView.addObject("barList",barList);
            modelAndView.setViewName("result");
        }
        return modelAndView;*/
        R r=new R();
        List<Bar> barList = searchService.searchByName(bar);
        if (barList!=null){
            r.setCode(200);
            session.setAttribute("barList",barList);
        }
        return r;
    }


    @RequestMapping ("/toPostBar")
    public ModelAndView toByBarName(String barName){
        ModelAndView modelAndView=new ModelAndView();
        Bar bar=searchService.toByBarName(barName);
        if (bar!=null){
        modelAndView.addObject("bar",bar);
        modelAndView.setViewName("postBar");
        }
        return modelAndView;
    }

/*    @RequestMapping ("/getAllPosts")
    @ResponseBody
    public R getAllPosts(String barName,HttpSession session){
        R r=new R();
        List<Posts> allPostsByBarName = searchService.getAllPostsByBarName(barName);
        if (allPostsByBarName!=null){
            r.setCode(200);
            session.setAttribute("barList",allPostsByBarName);
        }
        return r;
    } */
    @RequestMapping ("/getAllPosts")
    @ResponseBody
    public ModelAndView getAllPosts(String barName){
        ModelAndView modelAndView=new ModelAndView();
        List<Posts> allPostsByBarName = searchService.getAllPostsByBarName(barName);
        if (allPostsByBarName!=null){
            modelAndView.addObject("allPostsByBarName",allPostsByBarName);
            modelAndView.setViewName("postBar");
        }
        return modelAndView;
    }

}
