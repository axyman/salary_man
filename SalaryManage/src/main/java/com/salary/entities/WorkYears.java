package com.salary.entities;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 14:11
 **/

/**
 * WorkYears：工龄实体类
 */
public class WorkYears {
    private Integer workId;
    private  Integer workYears;
    private Double workSal;

    public Integer getWorkId() {
        return workId;
    }

    public void setWorkId(Integer workId) {
        this.workId = workId;
    }

    public Integer getWorkYears() {
        return workYears;
    }

    public void setWorkYears(Integer workYears) {
        this.workYears = workYears;
    }

    public Double getWorkSal() {
        return workSal;
    }

    public void setWorkSal(Double workSal) {
        this.workSal = workSal;
    }
}
