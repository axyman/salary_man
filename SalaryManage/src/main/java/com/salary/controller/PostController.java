package com.salary.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.salary.entities.Dept;
import com.salary.entities.Post;
import com.salary.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostService postService;


    @RequestMapping("/selectAll")
    public String selectAll(Model model,@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "size", defaultValue = "4") int size) {
        PageHelper.startPage(page,4);
        List<Post> posts = postService.selectAll();
        PageInfo pageInfo=new PageInfo(posts,4);
        model.addAttribute("pageInfo",pageInfo);
        return "post";
    }

    @ResponseBody
    @RequestMapping("/selectAllForData")
    public List<Post> selectAllForData() {
        List<Post> posts = postService.selectAll();
        return posts;
    }


    @RequestMapping("/selectPostBypostName")
    public String selectPostBypostName(String postName, Model model) {
        Post post = postService.selectPostBypostName(postName);
        model.addAttribute("post",post);
        return "post";
    }

    @ResponseBody
    @RequestMapping("/selectPostBypostName2")
    public Post selectPostBypostName2(String postName, Model model) {
        Post post = postService.selectPostBypostName(postName);
        model.addAttribute("post",post);
        return post;
    }


    @RequestMapping("/insertPost")
    public String insertPost(Post post) {
        postService.insertPost(post);
        return "redirect:selectAll";
    }

    @RequestMapping("/updatePost")
    public String updatePost(Post post) {
        postService.updatePost(post);
        return "redirect:selectAll";
    }

    @RequestMapping("/deletePost")
    public String deletePost(Integer postId) {
        postService.deletePost(postId);
        return "redirect:selectAll";
    }
}
