package com.salary.dao;

import com.salary.entities.DataInfo;
import com.salary.entities.Salary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SalaryDao {

    /**
     * 按照条件查询
     * @param salary
     * @return
     */
    public List<Salary> selectAll(Salary salary);


    /**
     * 根据salId更新员工工资发放状态
     * @param salId
     */
    public void updateSal(Integer salId);


    /**
     * 批量发放员工的工资
     * @param salIds
     */
    public void updateSalOfBatch(@Param("salIds") List<String> salIds);

    /**
     * 根据员工工号和日期删除员工的工资发放的信息
     * @param  salId
     */
    public void deleteSal(Integer salId);



    /**
     * 批量删除
     * @param salIds
     */
    public void deleteOfBatch(@Param("salIds") List<String> salIds);


    /**
     * 通过月份查询各部门的最低，平均，最高工资
     * @return
     */
    public List<DataInfo> selectDeptSal(String mon);





    /**
     * 通过月份将查询的信息插入到数据库中
     * @param mon
     */
    public void insertData(String mon);

    /**
     * 清空data_info表中的数据
     */
    public void clearDataInfo(String mon);


    /**
     * 查询近三年的各部门工资情况
     * @return
     */
    public List<String> selectMMons();

    public List<DataInfo> selectRatio(String mon);

    public List<DataInfo> selectMonSal(String year);





}
