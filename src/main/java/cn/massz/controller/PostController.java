package cn.massz.controller;

import cn.massz.controller.util.FileUtils;
import cn.massz.controller.util.R;
import cn.massz.model.Bar;
import cn.massz.model.PostImg;
import cn.massz.model.Posts;

import cn.massz.model.Users;
import cn.massz.service.BarService;
import cn.massz.service.PostImgService;
import cn.massz.service.PostService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostService postService;
    @Autowired
    private PostImgService postImgService;
    @Autowired
    private BarService barService;


    @RequestMapping("/toPostList")
    public String toPostList() {
        return "postList";
    }

    @RequestMapping("/toPublish")
    public String toPublish(HttpSession session)
    {
        List<Bar> barList = barService.getBarAll();
//        System.out.println(barList);
        session.setAttribute("barList",barList);
        return "posts";
    }

    @PostMapping("/publish")
    @ResponseBody
    public R publish(@RequestParam("filename") List<MultipartFile> fileList, Posts post, HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        R r=new R();
        post.setPostTitle(post.getPostTitle());
        post.setContent(post.getContent());
        post.setUserId(users.getUser_id());
        post.setBarId(post.getBarId());
        int result = postService.insertPost(post);
        if (result>0){
            r.setCode(200);
        }

        // 保存图片
        PostImg postImg=new PostImg();
        List<String> fileNameList = FileUtils.fileUploadBatch(fileList);
        // 添加帖子图片表
        for (String picName:fileNameList) {
            postImg.getPostId();
            postImg.setPicName(picName);
            postImg.setPostId(post.getPostId());
            postImgService.insertPostImg(postImg);
        }
        return r;
    }

    // 获取我的帖子列表
    @GetMapping("getPostList")
    @ResponseBody
    public R getPostList(Integer pageNum,Integer pageSize, HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        Posts post = new Posts();
        post.setUserId(users.getUser_id());

        PageHelper.startPage(pageNum,pageSize); // pageNum当前页码，pageSize每页条数
        List<Posts> list = postService.getPostList(post);
        PageInfo pageInfo = new PageInfo(list);
        R r = new R();
        if (list!=null){
            r.setCode(200);
            r.setData(pageInfo);
        }
        return r;
    }

   // 获取我的帖子列表
    @GetMapping("getAllPost")
    @ResponseBody
    public R getAllPost(Integer pageNum,Integer pageSize){

        PageHelper.startPage(pageNum,pageSize); // pageNum当前页码，pageSize每页条数
        List<Posts> list = postService.getAllPosts();
        PageInfo pageInfo = new PageInfo(list);
        System.out.println(pageInfo);
        R r = new R();
        if (list!=null){
            r.setCode(200);
            r.setData(pageInfo);
        }
        return r;

    }

    // 删除帖子
    @GetMapping("deletePost")
    @ResponseBody
    public R deletePost(Integer postId,HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        Posts post = new Posts();
        post.setUserId(users.getUser_id());
        post.setPostId(postId);


        int result = postService.deletePost(post);
        R r = new R();
        if(result == 0){
            r.setCode(400);
            r.setMsg("删除失败");
        }else {
            r.setCode(200);
        }
        return r;
    }

    // 更改帖子公开或私密
    @GetMapping("changePostSercet")
    @ResponseBody
    public R changePostSercet(Integer postId,Integer secret, HttpSession session){
        Users users = (Users)session.getAttribute("userSession");
        Posts post = new Posts();
        post.setUserId(users.getUser_id());
        post.setPostId(postId);
        post.setSecret(secret);

        int result = postService.changePostSercet(post);
        R r = new R();
        if(result == 0){
            r.setCode(400);
            r.setMsg("设置失败");
        }else {
            r.setCode(200);
        }
        return r;
    }
}
