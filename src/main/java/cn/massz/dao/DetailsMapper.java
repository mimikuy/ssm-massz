package cn.massz.dao;

import cn.massz.model.PostCommComm;
import cn.massz.model.PostComment;
import cn.massz.model.Posts;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DetailsMapper {

    Posts postDetails(Posts posts);

    int insertPcc(PostCommComm pcc);

    Boolean delPc(Integer commentId);


    int insertPc(PostComment postComment);

    Boolean insertcollection(@Param("postId") Integer postId,@Param("user_id") Integer user_id);

    Boolean insertFollowUserId(@Param("follow_user_id")Integer follow_user_id,@Param("user_id") Integer user_id);
    Boolean boolSel(@Param("postId")Integer postId,@Param("user_id") Integer user_id);

    Boolean insertFans(@Param("follow_user_id")Integer follow_user_id,@Param("user_id") Integer user_id);
}
