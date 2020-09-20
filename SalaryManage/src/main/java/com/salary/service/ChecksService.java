package com.salary.service;

import com.salary.entities.Checks;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ChecksService {
    /**
     * 根据条件查询，如果为空则查询所有
     * @param empId
     * @param mon
     * @param deptId
     * @return
     */
    List<Checks> selectAll(@Param("empId") Integer empId,@Param("mon") String mon,@Param("deptId") Integer deptId);

    /**
     * 添加考勤信息
     * @param checks
     */
    void insertChecks(Checks checks);

    /**
     * 修改考勤信息
     * @param checks
     */
    void updateChecks(Checks checks);

    /**
     * 通过考勤id删除考勤信息
     * @param checksId
     */
    void deleteChecks(Integer checksId);

    /**
     * 通过考勤id集合批量删除考勤信息
     * @param checksIds
     */
    void deleteChecksOfBatch(List<Integer> checksIds);


    Checks selectChecksByChecksId(Integer checksId);

}
