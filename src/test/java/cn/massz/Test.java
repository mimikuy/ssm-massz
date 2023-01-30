package cn.massz;


import cn.massz.dao.*;
import cn.massz.model.*;
import cn.massz.service.PostService;
import javafx.geometry.Pos;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test {

    @Autowired
    private PostService service;

    @Autowired
    private PostMapper mapper;

    @Autowired
    private SearchMapper searchMapper;

    @Autowired
    private PostLikeMapper postLikeMapper;

    @Autowired
    private DetailsMapper detailsMapper;

    @Autowired
    private MyMapper myMapper;

    @Autowired
    private UserMapper userMapper;

    @org.junit.Test
    public void testQueryCount(){
        Posts posts=new Posts();
        posts.setUserId(8);

        List<Posts> allPosts = service.getAllPosts(posts);
        System.out.println(allPosts);
    }



    @org.junit.Test
    public void testQueryCount2(){

        Posts post=new Posts();
        post.setPostId(8);
        Posts posts = detailsMapper.postDetails(post);

        System.out.println(posts);
    }

    @org.junit.Test
    public void testQueryCount3(){

        PostCommComm pcc=new PostCommComm();
        pcc.setPcc_userId(3);
        pcc.setPcc_commentId(1);
        pcc.setPcc_commentContent("这是一条回复");

        int insertPcc = detailsMapper.insertPcc(pcc);


        System.out.println(insertPcc);
    }

    @org.junit.Test
    public void testQueryCount4(){

        Boolean delPc = detailsMapper.delPc(2);


        System.out.println(delPc);
    }

    @org.junit.Test
    public void testQueryCount5(){
        PostLike postLike=new PostLike();
        postLike.setUserId(1);
        postLike.setPostId(8);
        PostLike like = postLikeMapper.selectPostLike(postLike);
        System.out.println(like);
    }

    @org.junit.Test
    public void testQueryCount6(){

//        List<Users> usersList = myMapper.findFans(1);
        List<Bar> bar = myMapper.findBar(1);
        System.out.println(bar);
    }

    @org.junit.Test
    public void testQueryCount7(){


        History history = myMapper.findHistory(8, 1);
        System.out.println(history);
    }

    @org.junit.Test
    public void testQueryCount8(){

        List<Posts> history = myMapper.findHistoryById(24);
        System.out.println(history);
    }

    @org.junit.Test
    public void testQueryCount9(){

        List<Posts> history = myMapper.findAllCollection(1);
        System.out.println(history);
    }
    @org.junit.Test
    public void testQueryCount10(){

        Boolean history = detailsMapper.boolSel(13,1);
        System.out.println(history);
    }
    @org.junit.Test
    public void testQueryCount11(){

        Users userInformation = userMapper.findUserInformation(1);
        System.out.println(userInformation);
    }
    @org.junit.Test
    public void testQueryCount12(){

        Boolean history = detailsMapper.delPc(7);
        System.out.println(history);
    }

    @org.junit.Test
    public void testQueryCount13(){

        List<Posts> allPostsByBarName = searchMapper.getAllPostsByBarName("笑话");
        System.out.println(allPostsByBarName);
    }
}
