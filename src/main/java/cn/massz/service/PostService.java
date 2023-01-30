package cn.massz.service;

import cn.massz.model.Posts;

import java.util.List;

public interface PostService {
    int insertPost(Posts post);

    List<Posts> getPostList(Posts post);

    List<Posts> getAllPosts(Posts post);

//    int plSum (Integer postId);

    int deletePost(Posts post);

    int changePostSercet(Posts post);
}
