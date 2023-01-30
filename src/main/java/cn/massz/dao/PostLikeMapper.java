package cn.massz.dao;


import cn.massz.model.PostLike;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface PostLikeMapper {
    @Insert("insert post_like values(#{userId},#{postId})")
    int insertPostLike(PostLike postLike);

    @Delete("delete from post_like where user_id=#{userId} and post_id = #{postId}")
    int deletePostLike(PostLike postLike);

    @Select("select user_id userId,post_id postId from post_like where user_id = #{userId} and post_id = #{postId}")
    PostLike selectPostLike(PostLike postLike);

}
