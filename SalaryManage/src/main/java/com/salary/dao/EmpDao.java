package com.salary.dao;

import com.salary.entities.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface EmpDao {

    /**
     * 如果三个参数为null，即为查询所有，否则按条件查询
     * @param empId  员工id
     * @param empName  员工姓名
     * @param deptId 部门Id
     * @return
     */
    public List<Emp> selectAll(@Param("empId") Integer empId, @Param("empName") String empName, @Param("deptId") Integer deptId);


    /**
     * 添加员工
     * @param emp 员工对象
     */
    public void insertEmp(Emp emp);

    /**
     * 通过员工ID删除员工
     * @param empId 员工id
     */
    public void deleteEmp(Integer empId);

    /**
     * 批量删除
     * @param empIds 员工id的集合
     */
    public void deleteEmpOfBatch(@Param("empIds") List<String> empIds);

    /**
     * 修改员工
     * @param emp
     */
    public void updateEmp(Emp emp);

    public Emp selectOne(Integer empId);

    /**
     * 统计各部门人数
     * @return
     */
    List<Map<String,Object>> countEmp();

}
