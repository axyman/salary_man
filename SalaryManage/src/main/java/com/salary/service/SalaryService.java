package com.salary.service;

import com.salary.entities.DataInfo;
import com.salary.entities.Salary;

import java.util.List;

public interface SalaryService {

    /**
     * 按条件查询
     * @param salary
     * @return
     */
    public List<Salary> selectAll(Salary salary);

    public void updateSal(Integer salId);

    public void updateSalOfBatch(List<String> salIds);

    public void deleteSal(Integer salId);

    public void deleteOfBatch(List<String> salIds);



    public List<DataInfo> selectRatio(String mon);

    public List<DataInfo> selectDeptSal(String mon);

    public void clearDataInfo(String mon);

    public void insertData(String mon);

    public List<DataInfo> selectMonSal(String year);




}
