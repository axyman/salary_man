package com.salary.dao;

import com.salary.entities.Post;

import java.util.List;

public interface PostDao {
    //岗位管理

    /**
     * 查询所有岗位
     * @return
     */
    List<Post> selectAll();

    /**
     * 通过postName查询岗位
     * @return
     */
    Post selectPostBypostName(String postName);

    /**
     * 添加岗位
     * @param post
     */
    void insertPost(Post post);

    /**
     * 更新岗位
     * @param post
     */
    void updatePost(Post post);

    /**
     * 通过postId删除岗位
     * @param postId
     */
    void deletePost(Integer postId);

}
