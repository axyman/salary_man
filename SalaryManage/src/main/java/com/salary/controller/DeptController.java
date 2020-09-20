package com.salary.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.salary.entities.Dept;
import com.salary.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @ResponseBody
    @RequestMapping("/selectAll")
    public List<Dept> selectAll(Model model) {
        List<Dept> depts = deptService.selectAll();
        model.addAttribute("depts",depts);
        return depts;
    }

    @RequestMapping("/selectAll1")
    public String selectAll1(Model model, @RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "size", defaultValue = "4") int size) {
         PageHelper.startPage(page,size);
        List<Dept> depts = deptService.selectAll();
        PageInfo pageInfo=new PageInfo(depts,size);
        model.addAttribute("pageInfo",pageInfo);
        return "dept";
    }

    @RequestMapping("/selectDeptBydeptName")
    public String selectDeptBydeptName(String deptName,Model model) {
        System.out.println(deptName);
        Dept dept = deptService.selectDeptBydeptName(deptName);
        model.addAttribute("dept",dept);
        return "dept";
    }
    @ResponseBody
    @RequestMapping("/selectDeptBydeptName2")
    public Dept selectDeptBydeptName2(String deptName,Model model) {
        Dept dept = deptService.selectDeptBydeptName(deptName);
        model.addAttribute("dept",dept);
        return dept;
    }

    @RequestMapping("/insertDept")
    public String insertDept(Dept dept) {
        deptService.insertDept(dept);
        return "redirect:selectAll1";
    }

    @RequestMapping("/updateDept")
    public String updateDept(Dept dept) {
        deptService.updateDept(dept);
        System.out.println(dept);
        return "redirect:selectAll1";
    }

    @RequestMapping("/deleteDept")
    public String deleteDept(Integer deptId) {
        deptService.deleteDept(deptId);
        return "redirect:selectAll1";
    }
}
