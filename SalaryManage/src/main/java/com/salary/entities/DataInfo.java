package com.salary.entities;

public class DataInfo {
    private Integer deptId;
    private String deptName;
    private String mon;
    private Double minSal;
    private Double avgSal;
    private Double maxSal;
    private Double sumSal;
    private Double allSal;
    private Double salRatio;

    public Double getAllSal() {
        return allSal;
    }

    public void setAllSal(Double allSal) {
        this.allSal = allSal;
    }

    public Double getSalRatio() {
        return salRatio;
    }

    public void setSalRatio(Double salRatio) {
        this.salRatio = salRatio;
    }

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

    public String getMon() {
        return mon;
    }

    public void setMon(String mon) {
        this.mon = mon;
    }

    public Double getMinSal() {
        return minSal;
    }

    public void setMinSal(Double minSal) {
        this.minSal = minSal;
    }

    public Double getAvgSal() {
        return avgSal;
    }

    public void setAvgSal(Double avgSal) {
        this.avgSal = avgSal;
    }

    public Double getMaxSal() {
        return maxSal;
    }

    public void setMaxSal(Double maxSal) {
        this.maxSal = maxSal;
    }

    public Double getSumSal() {
        return sumSal;
    }

    public void setSumSal(Double sumSal) {
        this.sumSal = sumSal;
    }
}
