package com.salary.service;



import com.salary.entities.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface EmpService {

    /**
     * 根据条件查询员工
     * @return
     */
    public List<Emp> selectAll(Integer empId, String empName, Integer deptId);
    public Emp selectOne(Integer empId);

    /**
     * 更新员工
     *  之后：需要再将所有的数据查询出来
     * @param emp
     * @return
     */
    public void updateEmp(Emp emp);

    /**
     * 通过员工ID删除员工,完成之后，查询所有员工数据
     * @param empId 员工id
     */
    public void deleteEmp(Integer empId);

    /**
     * 批量删除
     * @param empIds 员工id的集合
     */
    public void deleteEmpOfBatch(@Param("empIds") List<String> empIds);

    /**
     * 添加员工
     * @param emp 员工对象
     */
    public void insertEmp(Emp emp);

    /**
     * 统计各部门人数
     * @return
     */
    List<Map<String,Object>> countEmp();
}
