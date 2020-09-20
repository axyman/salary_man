package com.salary.entities;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 11:12
 **/

import java.util.Date;

/**
 * Checks：考勤实体类
 */
public class Checks {
    private Integer checksId;
    private Integer empId;
    private Integer deptId;
    private String mon;
    private Integer sickLeave;
    private Integer affairLeave;
    private Double usualHour;
    private Double weekHour;
    private Double holidayHour;
    private Integer late;
    private Integer early;

    private Emp emp;
    private Dept dept;

    @Override
    public String toString() {
        return "Checks{" +
                "checksId=" + checksId +
                ", empId=" + empId +
                ", deptId=" + deptId +
                ", mon='" + mon + '\'' +
                ", sickLeave=" + sickLeave +
                ", affairLeave=" + affairLeave +
                ", usualHour=" + usualHour +
                ", weekHour=" + weekHour +
                ", holidayHour=" + holidayHour +
                ", late=" + late +
                ", early=" + early +
                ", emp=" + emp +
                ", dept=" + dept +
                '}';
    }

    public String getMon() {
        return mon;
    }

    public void setMon(String mon) {
        this.mon = mon;
    }

    public Integer getChecksId() {
        return checksId;
    }

    public void setChecksId(Integer checksId) {
        this.checksId = checksId;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public Emp getEmp() {
        return emp;
    }

    public void setEmp(Emp emp) {
        this.emp = emp;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }



    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Integer getSickLeave() {
        return sickLeave;
    }

    public void setSickLeave(Integer sickLeave) {
        this.sickLeave = sickLeave;
    }

    public Integer getAffairLeave() {
        return affairLeave;
    }

    public void setAffairLeave(Integer affairLeave) {
        this.affairLeave = affairLeave;
    }

    public Double getUsualHour() {
        return usualHour;
    }

    public void setUsualHour(Double usualHour) {
        this.usualHour = usualHour;
    }

    public Double getWeekHour() {
        return weekHour;
    }

    public void setWeekHour(Double weekHour) {
        this.weekHour = weekHour;
    }

    public Double getHolidayHour() {
        return holidayHour;
    }

    public void setHolidayHour(Double holidayHour) {
        this.holidayHour = holidayHour;
    }

    public Integer getLate() {
        return late;
    }

    public void setLate(Integer late) {
        this.late = late;
    }

    public Integer getEarly() {
        return early;
    }

    public void setEarly(Integer early) {
        this.early = early;
    }
}
