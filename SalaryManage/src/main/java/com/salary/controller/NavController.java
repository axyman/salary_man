package com.salary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavController {
    @RequestMapping("/empsCount")
    public String empsCount(){
        return "empsCount";
    }
    @RequestMapping("/index")
    public String index(){
        return "index";
    }
    @RequestMapping("/deptSalRatio")
    public String deptSalRatio(){
        return "deptSalRatio";
    }
    @RequestMapping("/deptSal")
    public String deptSal(){
        return "deptSal";
    }
    @RequestMapping("/findSal")
    public String findSal(){
        return "findSal";
    }
    @RequestMapping("/salary")
    public String salary(){
        return "salary";
    }
    @RequestMapping("/calWage")
    public String calWage(){
        return "calWage";
    }
    @RequestMapping("/wageItems")
    public String wageItems(){
        return "wageItems";
    }
    @RequestMapping("/emp")
    public String emp(){
        return "emp";
    }

}
