package cn.massz.service;

import cn.massz.model.PostLike;

public interface PostLikeService {
    int insertPostLike(PostLike postLike);

    int deletePostLike(PostLike postLike);

    PostLike selectPostLike(PostLike postLike);
}
