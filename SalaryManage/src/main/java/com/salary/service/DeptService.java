package com.salary.service;

import com.salary.entities.Dept;

import java.util.List;

public interface DeptService {
    /**
     * 查询所有职称
     * @return
     */
    List<Dept> selectAll();

    /**
     * 通过deptName查询职称
     * @return
     */
    Dept selectDeptBydeptName(String deptName);

    /**
     * 添加职称
     * @param dept
     */
    void insertDept(Dept dept);

    /**
     * 更新职称
     * @param dept
     */
    void updateDept(Dept dept);

    /**
     * 通过deptId删除职称
     * @param deptId
     */
    void deleteDept(Integer deptId);
}
