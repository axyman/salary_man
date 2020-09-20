package com.salary.service;


import com.salary.entities.Admin;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 16:16
 **/
@Service
public interface AdminService {
    /**
     * 查询所有管理员
     * @return
     */
    public boolean selectAll(Admin admin);
}
