package cn.massz.dao;

import cn.massz.model.Posts;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostMapper {
    int insertPost(Posts post);

    List<Posts> getPostList(Posts post);

    List<Posts> getAllPosts();

    List<Posts> getAllPosts1();

    @Delete("delete from post where post_id =#{postId} and user_id=#{userId}")
    int deletePost(Posts post);

    @Update("update post set secret = #{secret} where post_id =#{postId} and user_id=#{userId}")
    int changePostSercet(Posts post);
}
