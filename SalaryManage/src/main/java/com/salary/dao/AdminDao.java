package com.salary.dao;


import com.salary.entities.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 16:06
 **/
@Mapper
public interface AdminDao {
    /**
     * 查询所有管理员
     * @return
     */
    public Admin selectAll(Admin admin);
}
