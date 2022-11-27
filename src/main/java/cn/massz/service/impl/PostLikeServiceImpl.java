package cn.massz.service.impl;

import cn.massz.dao.PostLikeMapper;
import cn.massz.model.PostLike;
import cn.massz.service.PostLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostLikeServiceImpl implements PostLikeService {
    @Autowired
    private PostLikeMapper mapper;

    public int insertPostLike(PostLike postLike) {
        return mapper.insertPostLike(postLike);
    }

    public int deletePostLike(PostLike postLike) {
        return mapper.deletePostLike(postLike);
    }
}
