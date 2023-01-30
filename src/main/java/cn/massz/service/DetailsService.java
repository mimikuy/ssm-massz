package cn.massz.service;

import cn.massz.model.PostCommComm;
import cn.massz.model.PostComment;
import cn.massz.model.Posts;

public interface DetailsService {

    Posts postDetails(Posts posts);

    int insertPcc(PostCommComm pcc);

    Boolean delPc(Integer commentId);

    int insertPc(PostComment postComment);

    Boolean insertcollection(Integer postId, Integer user_id);

    Boolean insertFollowUserId(Integer follow_user_id, Integer user_id);

    Boolean boolSel(Integer postId, Integer user_id);

    Boolean insertFans(Integer follow_user_id, Integer user_id);
}
