package cn.massz.controller;

import cn.massz.controller.util.R;
import cn.massz.model.*;
import cn.massz.service.DetailsService;
import cn.massz.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/det")
public class DetailsController {

    @Autowired
    private DetailsService detailsService;

    @Autowired
    private MyService myService;

    @PostMapping("/toPostDetails")
    @ResponseBody
    public ModelAndView toDetails(Posts posts, HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        ModelAndView modelAndView=new ModelAndView();
        Posts post = detailsService.postDetails(posts);
        History history = myService.findHistory(posts.getPostId(), users.getUser_id());
        Boolean boolSel = detailsService.boolSel(posts.getPostId(), users.getUser_id());
        if (history == null){
            myService.insertHistory(posts.getPostId(), users.getUser_id());
        }else {
            myService.updateHistory(posts.getPostId(), users.getUser_id());
        }

        if (post != null){
            modelAndView.addObject("post",post);
            modelAndView.addObject("booleanSel",boolSel);
            modelAndView.setViewName("details");
        }
        return modelAndView;
    }

    @PostMapping("/insertPcc")
    @ResponseBody
    public R insertPComCom(PostCommComm postCommComm){
        R r =new R();
        int insertPcc = detailsService.insertPcc(postCommComm);
        if (insertPcc>0){
            r.setData(insertPcc);
            r.setCode(200);
        }
        return r;
    }

    @PostMapping("/insertPc")
    @ResponseBody
    public R insertPCom(PostComment postComment,HttpSession session){
        Users user= (Users) session.getAttribute("userSession");
        postComment.setUserId(user.getUser_id());
        R r =new R();
        int insertPcc = detailsService.insertPc(postComment);
        if (insertPcc>0){
            r.setData(insertPcc);
            r.setCode(200);
        }
        return r;
    }

    @PostMapping("/deletePc")
    @ResponseBody
    public R deletePComm(Integer commentId){
        R r =new R();
        Boolean delPc = detailsService.delPc(commentId);
        if (delPc == true){
            r.setCode(200);
        }
        return r;
    }

    @GetMapping("/collectionPost")
    @ResponseBody
    public R insertCollection(Integer postId,HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        R r =new R();
        Boolean insertc = detailsService.insertcollection(postId,users.getUser_id());
        if (insertc == true){

            r.setCode(200);
        }
        return r;
    }

    @GetMapping("/insertFollowId")
    @ResponseBody
    public R insertFollowId(Integer follow_user_id,HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        R r =new R();
        Boolean insertF = detailsService.insertFollowUserId(follow_user_id,users.getUser_id());
        Boolean insertF2=detailsService.insertFans(follow_user_id,users.getUser_id());
        if (insertF == true){

            r.setCode(200);
        }
        return r;
    }

}
