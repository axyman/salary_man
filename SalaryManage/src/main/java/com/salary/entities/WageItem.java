package com.salary.entities;

/**
 * @author : 沉默小多数
 * @date : 2020-08-26 14:08
 **/

/**
 * WageItem：工资项实体类
 */
public class WageItem {
    private Integer wageItemId;
    private Double lateFine;
    private Double earlyFine;
    private Double businessTripSal;
    private Double fulChecksSal;
    private Double foodSal;
    private Double trafficSal;
    private Double  usualSal;
    private Double weekSal;
    private Double holidaySal;

    public Integer getWageItemId() {
        return wageItemId;
    }

    public void setWageItemId(Integer wageItemId) {
        this.wageItemId = wageItemId;
    }

    public Double getLateFine() {
        return lateFine;
    }

    public void setLateFine(Double lateFine) {
        this.lateFine = lateFine;
    }

    public Double getEarlyFine() {
        return earlyFine;
    }

    public void setEarlyFine(Double earlyFine) {
        this.earlyFine = earlyFine;
    }

    public Double getBusinessTripSal() {
        return businessTripSal;
    }

    public void setBusinessTripSal(Double businessTripSal) {
        this.businessTripSal = businessTripSal;
    }

    public Double getFulChecksSal() {
        return fulChecksSal;
    }

    public void setFulChecksSal(Double fulChecksSal) {
        this.fulChecksSal = fulChecksSal;
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

    public Double getUsualSal() {
        return usualSal;
    }

    public void setUsualSal(Double usualSal) {
        this.usualSal = usualSal;
    }

    public Double getWeekSal() {
        return weekSal;
    }

    public void setWeekSal(Double weekSal) {
        this.weekSal = weekSal;
    }

    public Double getHolidaySal() {
        return holidaySal;
    }

    public void setHolidaySal(Double holidaySal) {
        this.holidaySal = holidaySal;
    }

    @Override
    public String toString() {
        return "WageItem{" +
                "wageItemId=" + wageItemId +
                ", lateFine=" + lateFine +
                ", earlyFine=" + earlyFine +
                ", businessTripSal=" + businessTripSal +
                ", fulChecksSal=" + fulChecksSal +
                ", foodSal=" + foodSal +
                ", trafficSal=" + trafficSal +
                ", usualSal=" + usualSal +
                ", weekSal=" + weekSal +
                ", holidaySal=" + holidaySal +
                '}';
    }
}
