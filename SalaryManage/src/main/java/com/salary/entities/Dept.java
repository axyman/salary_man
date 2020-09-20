package com.salary.entities;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 11:20
 **/

/**
 * dept：部门实体类
 */
public class Dept {
    private Integer deptId;
    private String deptName;
    private String deptDesc;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptDesc() {
        return deptDesc;
    }

    public void setDeptDesc(String deptDesc) {
        this.deptDesc = deptDesc;
    }
}
