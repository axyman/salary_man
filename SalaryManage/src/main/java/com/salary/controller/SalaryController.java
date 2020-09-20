package com.salary.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.salary.entities.DataInfo;
import com.salary.entities.Salary;
import com.salary.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/salary")
public class SalaryController {

    @Autowired
    private SalaryService salaryService;

    /**
     * 条件查询
     * 参数：状态，员工Id ， 月份， 部门ID
     * @return
     */
    @ResponseBody
    @RequestMapping("/selectAll")
    public PageInfo  selectAll(Salary salary,@RequestParam(value = "pn", defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Salary> salaries = salaryService.selectAll(salary);
        PageInfo pageInfo = new PageInfo(salaries,5);
        return pageInfo;
    }

    @ResponseBody
    @RequestMapping("/updateSal")
    public String  updateSal(Integer salId) {
        salaryService.updateSal(salId);
        return "200";
    }

    @ResponseBody
    @RequestMapping("/updateSalOfBatch")
    public String updateSalOfBatch(String salIds){
        String[] split = salIds.split("-");
        List<String> list = Arrays.asList(split);
        salaryService.updateSalOfBatch(list);

        return "200";
    }

    @ResponseBody
    @RequestMapping("/deleteSal")
    public String deleteSal(Integer salId){
        salaryService.deleteSal(salId);
        return "200";
    }

    @ResponseBody
    @RequestMapping("/deleteOfBatch")
    public String  deleteOfBatch(String  salIds){
        String[] split = salIds.split("-");
        List<String> list = Arrays.asList(split);
        salaryService.deleteOfBatch(list);
        return "200";
    }

    @ResponseBody
    @RequestMapping("/insertData")
    public String insertData(String mon){
        salaryService.clearDataInfo(mon);
        salaryService.insertData(mon);
        return "200";
    }

    

    @ResponseBody
    @RequestMapping("/selectRatio")
    public List<DataInfo> selectRatio(String mon){
        return salaryService.selectRatio(mon);
    }

    @ResponseBody
    @RequestMapping("/selectDeptSal")
    public List<DataInfo> selectDeptSal(String mon){
        List<DataInfo> list = salaryService.selectDeptSal(mon);
        return list;
    }

    @ResponseBody
    @RequestMapping("/selectMonSal")
    public List<DataInfo> selectMonSal(String year){
        return salaryService.selectMonSal(year);
    }



}
