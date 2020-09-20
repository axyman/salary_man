package com.salary.service.impl;

import com.salary.dao.AdminDao;

import com.salary.entities.Admin;
import com.salary.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 16:17
 **/
@Service
public class AdminServiceImp implements AdminService {
    @Autowired
    private AdminDao adminDao;
    @Override
    public boolean selectAll(Admin admin) {
        Admin admin1=adminDao.selectAll(admin);
        if (admin1 != null){
            //说明有，登录成功
            return true;
        }else {
            //登录失败
            return false;
        }

    }
}
