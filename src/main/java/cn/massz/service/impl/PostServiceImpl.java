package cn.massz.service.impl;

import cn.massz.dao.PostMapper;
import cn.massz.model.Posts;
import cn.massz.service.PostService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostMapper mapper;


    public int insertPost(Posts post) {
        return mapper.insertPost(post);
    }

    public List<Posts> getPostList(Posts post) {
        return mapper.getPostList(post);
    }

    public List<Posts> getAllPosts() {
        return mapper.getAllPosts();
    }


    public int deletePost(Posts post) {
        return mapper.deletePost(post);
    }

    public int changePostSercet(Posts post) {
        return mapper.changePostSercet(post);
    }
}
