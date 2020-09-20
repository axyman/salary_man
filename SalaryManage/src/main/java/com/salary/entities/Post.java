package com.salary.entities;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 13:53
 **/

/**
 * post：岗位实体类
 *
 */
public class Post {
    private Integer postId;
    private String postName;
    private String postDesc;
    private Double postSal;

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public String getPostDesc() {
        return postDesc;
    }

    public void setPostDesc(String postDesc) {
        this.postDesc = postDesc;
    }

    public Double getPostSal() {
        return postSal;
    }

    public void setPostSal(Double postSal) {
        this.postSal = postSal;
    }
}
