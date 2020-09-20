package com.salary.dao;

import com.salary.entities.Dept;

import java.util.List;

public interface DeptDao {
    //部门管理

    /**
     * 查询所有部门
     * @return
     */
    List<Dept> selectAll();

    /**
     * 通过deptName查询部门
     * @return
     */
    Dept selectDeptBydeptName(String deptName);

    /**
     * 添加部门
     *
     * @param dept
     */
    void insertDept(Dept dept);

    /**
     * 更新部门
     * @param dept
     */
    void updateDept(Dept dept);

    /**
     * 通过deptId删除部门
     * @param deptId
     */
    void deleteDept(Integer deptId);
}
