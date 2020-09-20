package com.salary.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.salary.entities.Emp;
import com.salary.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp")
public class EmpController {

    @Autowired
    private EmpService empService;


    /**
     * 查询所有员工
     *     跳转页面，传递参数，需要修改
     *     需要添加一个分页
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/selectAll")
    public PageInfo selectAll(Integer empId,String empName,Integer deptId,@RequestParam(value = "pn", defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Emp> emps= empService.selectAll(empId,empName,deptId);
        PageInfo pageInfo = new PageInfo(emps,5);
        return pageInfo;
    }


    /**
     * 条件查询
     * @param empId
     * @return
     */
    @ResponseBody
    @RequestMapping("/selectOne")
    public Emp selectSelective(Integer empId){

        Emp emp =  empService.selectOne(empId);

        return emp;
    }

    /**
     * 更新员工
     * @param emp
     * @return
     */
    @ResponseBody
    @RequestMapping("/updateEmp")
    public String  updateEmp(Emp emp){
        empService.updateEmp(emp);
        return "200";
    }

    /**
     * 插入员工
     * @param emp
     * @return
     */
    @ResponseBody
    @RequestMapping("/insertEmp")
    public String insertEmp(Emp emp){
        empService.insertEmp(emp);
        return "200";
    }

    /**
     * 删除员工
     * @param empId
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteEmp")
    public String deleteEmp(Integer empId){
        empService.deleteEmp(empId);
        return "200";
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteEmpOfBatch")
    public String deleteEmpOfBatch(String  ids){
        String[] split = ids.split("-");
        List<String> empIds = Arrays.asList(split);
        empService.deleteEmpOfBatch(empIds);
        return "200";
    }


    @ResponseBody
    @RequestMapping("/countEmp")
    public List<Map<String,Object>> countEmp() {
        return empService.countEmp();
    }


}
