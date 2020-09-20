package com.salary.entities;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 11:23
 **/

/**
 * Employee：员工实体类
 */
public class Emp {
    private Integer empId;
    private String empName;
    private Integer empSex;
    private String empEdu;
    private String  empTel;
    private Integer titleId;
    private Integer postId;
    private Integer deptId;
    private String empSosTel;
    private String empSosName;
    private Double baseMoney;
    private Title title;//职称
    private Post post;//岗位
    private Dept dept;//部门

    public String getEmpEdu() {
        return empEdu;
    }

    public void setEmpEdu(String empEdu) {
        this.empEdu = empEdu;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public Integer getEmpSex() {
        return empSex;
    }

    public void setEmpSex(Integer empSex) {
        this.empSex = empSex;
    }



    public Title getTitle() {
        return title;
    }

    public void setTitle(Title title) {
        this.title = title;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public String getEmpTel() {
        return empTel;
    }

    public void setEmpTel(String empTel) {
        this.empTel = empTel;
    }

    public Integer getTitleId() {
        return titleId;
    }

    public void setTitleId(Integer titleId) {
        this.titleId = titleId;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getEmpSosTel() {
        return empSosTel;
    }

    public void setEmpSosTel(String empSosTel) {
        this.empSosTel = empSosTel;
    }

    public String getEmpSosName() {
        return empSosName;
    }

    public void setEmpSosName(String empSosName) {
        this.empSosName = empSosName;
    }

    public Double getBaseMoney() {
        return baseMoney;
    }

    public void setBaseMoney(Double baseMoney) {
        this.baseMoney = baseMoney;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", empSex=" + empSex +
                ", empEdu='" + empEdu + '\'' +
                ", empTel='" + empTel + '\'' +
                ", titleId=" + titleId +
                ", postId=" + postId +
                ", deptId=" + deptId +
                ", empSosTel='" + empSosTel + '\'' +
                ", empSosName='" + empSosName + '\'' +
                ", baseMoney=" + baseMoney +
                '}';
    }
}
