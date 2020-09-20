package com.salary.dao;

import com.salary.entities.WorkYears;

import java.util.List;

public interface WorkYearsDao {
    //工龄管理

    /**
     * 查询所有工龄
     * @return
     */
    List<WorkYears> selectAll();

    /**
     * 通过workYears查询工龄
     * @return
     */
    WorkYears selectWorkYearsByworkYears(Integer workYears);

    /**
     * 添加工龄
     * @param workYears
     */
    void insertWorkYears(WorkYears workYears);

    /**
     * 更新工龄
     * @param workYears
     */
    void updateWorkYears(WorkYears workYears);

    /**
     * 通过workYearsId删除工龄
     * @param workId
     */
    void deleteWorkYears(Integer workId);
}
