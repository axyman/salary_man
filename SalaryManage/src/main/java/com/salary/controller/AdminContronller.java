package com.salary.controller;


import com.salary.entities.Admin;
import com.salary.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 16:22
 **/
@Controller
public class AdminContronller {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/tologout")
    public String tologout(HttpSession session){
        session.removeAttribute("account");
        return "redirect:/login.jsp";
    }
    /**
     * 登录
     */
    @RequestMapping("/login")
    public String findAllAdmin(Admin admin, Model model, HttpSession session){
        boolean flag=adminService.selectAll(admin);
        if (flag){
            //验证成功
            session.setAttribute("account",admin.getAccount());
            return "index";
        }else {
            //提示登录失败，跳转登录页面
            model.addAttribute("msg","账号或密码错误，请重新登录！");
            return "forward:/login.jsp";
        }
    }
}
