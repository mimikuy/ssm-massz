package cn.massz.service.impl;

import cn.massz.dao.DetailsMapper;
import cn.massz.model.PostCommComm;
import cn.massz.model.PostComment;
import cn.massz.model.Posts;
import cn.massz.service.DetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DetailsServiceImpl implements DetailsService {

    @Autowired
    private DetailsMapper detailsMapper;

    public Posts postDetails(Posts posts) {
        return detailsMapper.postDetails(posts);
    }

    public int insertPcc(PostCommComm pcc) {
        return detailsMapper.insertPcc(pcc);
    }

    public Boolean delPc(Integer commentId) {
        return detailsMapper.delPc(commentId);
    }

    public int insertPc(PostComment postComment) {
        return detailsMapper.insertPc(postComment);
    }

    public Boolean insertcollection(Integer postId, Integer user_id) {
        return detailsMapper.insertcollection(postId,user_id);
    }

    public Boolean insertFollowUserId(Integer follow_user_id, Integer user_id) {
        return detailsMapper.insertFollowUserId(follow_user_id,user_id);
    }

    public Boolean boolSel(Integer postId, Integer user_id) {
        return detailsMapper.boolSel(postId,user_id);
    }

    public Boolean insertFans(Integer follow_user_id, Integer user_id) {
        return detailsMapper.insertFans(follow_user_id,user_id);
    }
}
