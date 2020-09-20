package com.salary.service.impl;

import com.salary.dao.DeptDao;
import com.salary.entities.Dept;
import com.salary.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptDao deptDao;

    @Override
    public List<Dept> selectAll() {
        return deptDao.selectAll();
    }

    @Override
    public Dept selectDeptBydeptName(String deptName) {
        return deptDao.selectDeptBydeptName(deptName);
    }

    @Override
    public void insertDept(Dept dept) {
        deptDao.insertDept(dept);
    }

    @Override
    public void updateDept(Dept dept) {
        deptDao.updateDept(dept);
    }

    @Override
    public void deleteDept(Integer deptId) {
        deptDao.deleteDept(deptId);
    }
}
