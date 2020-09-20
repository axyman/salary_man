package com.salary.service.impl;

import com.salary.dao.PostDao;
import com.salary.entities.Post;
import com.salary.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private PostDao postDao;

    @Override
    public List<Post> selectAll() {
        return postDao.selectAll();
    }

    @Override
    public Post selectPostBypostName(String postName) {
        return postDao.selectPostBypostName(postName);
    }

    @Override
    public void insertPost(Post post) {
        postDao.insertPost(post);
    }

    @Override
    public void updatePost(Post post) {
        postDao.updatePost(post);
    }

    @Override
    public void deletePost(Integer postId) {
        postDao.deletePost(postId);
    }
}
