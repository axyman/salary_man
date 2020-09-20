package com.salary.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.salary.entities.WorkYears;
import com.salary.service.WorkYearsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/workYears")
public class WorkYearsController {
    @Autowired
    private WorkYearsService workYearsService;

    @RequestMapping("/selectAll")
    public String selectAll(Model model,@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "size", defaultValue = "4") int size) {
        PageHelper.startPage(page,4);
        List<WorkYears> workYearss = workYearsService.selectAll();
        PageInfo pageInfo=new PageInfo(workYearss,4);
        model.addAttribute("pageInfo",pageInfo);
        return "workTimes";
    }

    @RequestMapping("/selectWorkYearsByworkYears")
    public String selectWorkYearsByworkYearsName(Integer workYears,Model model) {
        WorkYears works = workYearsService.selectWorkYearsByworkYears(workYears);
        model.addAttribute("works",works);
        return "workTimes";
    }

    @ResponseBody
    @RequestMapping("/selectWorkYearsByworkYears2")
    public WorkYears selectWorkYearsByworkYearsName2(Integer workYears,Model model) {
        WorkYears works = workYearsService.selectWorkYearsByworkYears(workYears);
        model.addAttribute("works",works);
        return works;
    }


    @RequestMapping("/insertWorkYears")
    public String insertWorkYears(WorkYears workYears) {
        workYearsService.insertWorkYears(workYears);
        return "redirect:selectAll";
    }

    @RequestMapping("/updateWorkYears")
    public String updateWorkYears(WorkYears workYears) {
        workYearsService.updateWorkYears(workYears);
        return "redirect:selectAll";
    }

    @RequestMapping("/deleteWorkYears")
    public String deleteWorkYears(Integer workId) {
        workYearsService.deleteWorkYears(workId);
        return "redirect:selectAll";
    }
}
