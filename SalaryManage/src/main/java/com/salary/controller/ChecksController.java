package com.salary.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.salary.entities.Checks;
import com.salary.entities.Dept;
import com.salary.service.ChecksService;
import com.salary.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/checks")
public class ChecksController {
    @Autowired
    private ChecksService checksService;
    @Autowired
    private DeptService deptService;

    @ResponseBody
    @RequestMapping("/deptselectAll")
    public List<Dept> selectDeptName(Model model){
        List<Dept> depts = deptService.selectAll();
        model.addAttribute("depts",depts);
        return depts;
    }

    @RequestMapping("/selectAll")
    public String selectAll(Integer empId,Integer deptId , String mon, Model model, @RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "size", defaultValue = "4") int size) {
        PageHelper.startPage(page,size);
        List<Checks> checkss = checksService.selectAll(empId, mon, deptId);
        PageInfo pageInfo=new PageInfo(checkss,size);
        model.addAttribute("pageInfo",pageInfo);
        return "checks";
    }

    @ResponseBody
    @RequestMapping("/selectChecksByChecksId")
    public Checks selectChecksByChecksId(Integer checksId) {
        return checksService.selectChecksByChecksId(checksId);
    }

    @RequestMapping("/insertChecks")
    public String insertChecks(Checks checks) {
        checksService.insertChecks(checks);
        return "redirect:selectAll";
    }

    @RequestMapping("/updateChecks")
    public String updateChecks(Checks checks) {
        checksService.updateChecks(checks);
        return "redirect:selectAll";
    }

    @RequestMapping("/deleteChecks")
    public String deleteChecks(Integer checksId) {
        checksService.deleteChecks(checksId);
        return "redirect:selectAll";
    }

    @RequestMapping("/deleteChecksOfBatch")
    public String deleteChecksOfBatch(String checksIds) {

        checksIds= checksIds.substring(0, checksIds.length() - 1);
        String[] strings = checksIds.split(",");
        Integer[] integers=new Integer[strings.length];
        for (int i = 0; i < strings.length; i++) {
            integers[i] =Integer.parseInt(strings[i]);
        }
        List<Integer> list=  Arrays.asList(integers);
        checksService.deleteChecksOfBatch(list);
        return "redirect:selectAll";
    }

}
