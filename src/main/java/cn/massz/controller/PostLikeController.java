package cn.massz.controller;

import cn.massz.controller.util.R;
import cn.massz.model.PostLike;
import cn.massz.model.Users;
import cn.massz.service.PostLikeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/post-like")
public class PostLikeController {
    @Autowired
    private PostLikeService postLikeService;

    // 点赞
    @GetMapping("addPostLike")
    @ResponseBody
    public R addPostLike(Integer postId, HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        PostLike postLike = new PostLike();
        postLike.setUserId(users.getUser_id());
        postLike.setPostId(postId);

        int result = postLikeService.insertPostLike(postLike);
        R apiResult = new R();
        if(result == 0){
            apiResult.setCode(400);
            apiResult.setMsg("点赞失败");
        }else {
            apiResult.setCode(200);
        }
        return apiResult;
    }

    // 取消
    @GetMapping("deletePostLike")
    @ResponseBody
    public R deletePostLike(Integer postId,HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        PostLike postLike = new PostLike();
        postLike.setUserId(users.getUser_id());
        postLike.setPostId(postId);

        int result = postLikeService.deletePostLike(postLike);
        R apiResult = new R();
        if(result == 0){
            apiResult.setCode(400);
            apiResult.setMsg("点赞失败");
        }
        else {
            apiResult.setCode(200);
        }
        return apiResult;
    }

    @GetMapping("/selectPostLike")
    @ResponseBody
    public R selectPostLike(Integer postId,HttpSession session){
        PostLike postLike = new PostLike();
        Users users = (Users)session.getAttribute("userSession");
        postLike.setUserId(users.getUser_id());
        postLike.setPostId(postId);
        System.out.println(postLike);
        PostLike selectPostLike = postLikeService.selectPostLike(postLike);
        System.out.println(selectPostLike+"=============");
        R apiResult = new R();
        if(selectPostLike == null){
            apiResult.setCode(400);
            apiResult.setMsg("点赞失败");
        }
        else {
            apiResult.setCode(200);
        }
        return apiResult;
    }
}
