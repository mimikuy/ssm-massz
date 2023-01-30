package cn.massz.controller;

import cn.massz.controller.util.R;
import cn.massz.dao.MyMapper;
import cn.massz.model.Bar;
import cn.massz.model.History;
import cn.massz.model.Posts;
import cn.massz.model.Users;
import cn.massz.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/myPage")
public class MyController {

    @Autowired
    private MyService myService;


    @RequestMapping("/toFollow")
    public String toFollow(){
        return "follow";
    }
    @RequestMapping("/toFans")
    public String toFans(){
        return "fans";
    }
    @RequestMapping("/toFollowBar")
    public String toFollowBar(){
        return "followBar";
    }
    @RequestMapping("/toHistory")
    public String toHistory(){
        return "history";
    }
    @RequestMapping("/toCollection")
    public String toCollection(){
        return "collection";
    }

    @GetMapping("/findFollow")
    @ResponseBody
    public R findFollow(Integer user_id, HttpSession session){
        R r =new R();
        List<Users> usersList = myService.findFollow(user_id);
        if (usersList != null){
            r.setCode(200);
            session.setAttribute("usersLists",usersList);
        }
        return r;
    }

    @GetMapping("/findFans")
    @ResponseBody
    public R findFans(Integer user_id, HttpSession session){
        R r =new R();
        List<Users> usersList = myService.findFans(user_id);
        if (usersList != null){
            r.setCode(200);
            session.setAttribute("usersList1",usersList);
        }
        return r;
    }

    @GetMapping("/findFollowBar")
    @ResponseBody
    public R findFollowBar(Integer user_id, HttpSession session){
        R r =new R();
        List<Bar> barList = myService.findBar(user_id);
        if (barList != null){
            r.setCode(200);
            session.setAttribute("barList",barList);
        }
        return r;
    }

    @GetMapping("/findHistory")
    @ResponseBody
    public R findHistory(HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        R r =new R();
        List<Posts> historyList = myService.findHistoryById(users.getUser_id());
        if (historyList != null){
            r.setCode(200);
            session.setAttribute("historyList",historyList);
        }
        return r;
    }

    @GetMapping("/findCollection")
    @ResponseBody
    public R findCollection(HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        R r =new R();
        List<Posts> allCollection = myService.findAllCollection(users.getUser_id());
        if (allCollection != null){
            r.setCode(200);
            session.setAttribute("allCollection",allCollection);
        }
        return r;
    }
}
