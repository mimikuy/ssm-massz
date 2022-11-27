package cn.massz;


import cn.massz.dao.PostMapper;
import cn.massz.model.Posts;
import cn.massz.service.PostService;
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

    @org.junit.Test
    public void testQueryCount(){
        List<Posts> allPosts = service.getAllPosts();
        System.out.println(allPosts);
    }

    @org.junit.Test
    public void testQueryCount1(){
        List<Posts> allPosts = mapper.getAllPosts1();
        System.out.println(allPosts);
    }



}
