package com.salary.service.impl;

import com.salary.dao.EmpDao;
import com.salary.entities.Emp;
import com.salary.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpDao empDao;
    @Override
    public List<Emp> selectAll(Integer empId,String empName,Integer deptId) {
        return empDao.selectAll(empId,empName,deptId);
    }

    @Override
    public Emp selectOne(Integer empId) {
        return empDao.selectOne(empId);
    }

    @Override
    public void updateEmp(Emp emp) {
        empDao.updateEmp(emp);
    }

    @Override
    public void deleteEmp(Integer empId) {
        empDao.deleteEmp(empId);
    }

    @Override
    public void deleteEmpOfBatch(List<String> empIds) {
        empDao.deleteEmpOfBatch(empIds);
    }

    @Override
    public void insertEmp(Emp emp) {
        empDao.insertEmp(emp);
    }

    @Override
    public List<Map<String,Object>>countEmp() {
        return empDao.countEmp();
    }



}
