package com.salary.entities;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 14:05
 **/

/**
 * Title：职称实体类
 */
public class Title {
    private Integer titleId;
    private String titleName;
    private Double titleSal;

    public Integer getTitleId() {
        return titleId;
    }

    public void setTitleId(Integer titleId) {
        this.titleId = titleId;
    }

    public String getTitleName() {
        return titleName;
    }

    public void setTitleName(String titleName) {
        this.titleName = titleName;
    }

    public Double getTitleSal() {
        return titleSal;
    }

    public void setTitleSal(Double titleSal) {
        this.titleSal = titleSal;
    }
}
