package com.salary.entities;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 13:56
 **/

/**
 * salary：工资实体类
 */
public class Salary {
    private Integer salId;
    private String mon;
    private Integer empId;
    private String empName;
    private Integer deptId;
    private Double realSal;
    private Double shouldSal;
    private Double baseMoney;
    private Double businessTripSal;
    private Double postSal;
    private Double foodSal;
    private Double trafficSal;
    private Double overtimeSal;
    private Double titleSal;
    private Double workSal;
    private Integer state;
    private Dept dept;

    public Integer getSalId() {
        return salId;
    }

    public void setSalId(Integer salId) {
        this.salId = salId;
    }

    public String getMon() {
        return mon;
    }

    public void setMon(String mon) {
        this.mon = mon;
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

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Double getRealSal() {
        return realSal;
    }

    public void setRealSal(Double realSal) {
        this.realSal = realSal;
    }

    public Double getShouldSal() {
        return shouldSal;
    }

    public void setShouldSal(Double shouldSal) {
        this.shouldSal = shouldSal;
    }

    public Double getBaseMoney() {
        return baseMoney;
    }

    public void setBaseMoney(Double baseMoney) {
        this.baseMoney = baseMoney;
    }

    public Double getBusinessTripSal() {
        return businessTripSal;
    }

    public void setBusinessTripSal(Double businessTripSal) {
        this.businessTripSal = businessTripSal;
    }

    public Double getPostSal() {
        return postSal;
    }

    public void setPostSal(Double postSal) {
        this.postSal = postSal;
    }

    public Double getFoodSal() {
        return foodSal;
    }

    public void setFoodSal(Double foodSal) {
        this.foodSal = foodSal;
    }

    public Double getTrafficSal() {
        return trafficSal;
    }

    public void setTrafficSal(Double trafficSal) {
        this.trafficSal = trafficSal;
    }

    public Double getOvertimeSal() {
        return overtimeSal;
    }

    public void setOvertimeSal(Double overtimeSal) {
        this.overtimeSal = overtimeSal;
    }

    public Double getTitleSal() {
        return titleSal;
    }

    public void setTitleSal(Double titleSal) {
        this.titleSal = titleSal;
    }

    public Double getWorkSal() {
        return workSal;
    }

    public void setWorkSal(Double workSal) {
        this.workSal = workSal;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "salId=" + salId +
                ", mon='" + mon + '\'' +
                ", empId=" + empId +
                ", empName='" + empName + '\'' +
                ", deptId=" + deptId +
                ", realSal=" + realSal +
                ", shouldSal=" + shouldSal +
                ", baseMoney=" + baseMoney +
                ", businessTripSal=" + businessTripSal +
                ", postSal=" + postSal +
                ", foodSal=" + foodSal +
                ", trafficSal=" + trafficSal +
                ", overtimeSal=" + overtimeSal +
                ", titleSal=" + titleSal +
                ", workSal=" + workSal +
                ", state=" + state +
                ", dept=" + dept +
                '}';
    }
}
