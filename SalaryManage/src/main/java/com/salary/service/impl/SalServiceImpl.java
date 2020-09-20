package com.salary.service.impl;

import com.salary.dao.SalaryDao;
import com.salary.entities.DataInfo;
import com.salary.entities.Salary;
import com.salary.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalServiceImpl implements SalaryService {

    @Autowired
    private SalaryDao salaryDao;

    @Override
    public List<Salary> selectAll(Salary salary) {
        return salaryDao.selectAll(salary);
    }

    @Override
    public void updateSal(Integer salId) {
        salaryDao.updateSal(salId);
    }

    @Override
    public void updateSalOfBatch(List<String> salIds) {
        salaryDao.updateSalOfBatch(salIds);
    }

    @Override
    public void deleteSal(Integer salId) {
        salaryDao.deleteSal(salId);
    }

    @Override
    public void deleteOfBatch(List<String> salIds) {
        salaryDao.deleteOfBatch(salIds);
    }


    @Override
    public List<DataInfo> selectRatio(String mon) {
        return salaryDao.selectRatio(mon);
    }

    @Override
    public List<DataInfo> selectDeptSal(String mon) {
        List<String> list = salaryDao.selectMMons();
        if(list.size()==0){
            return null;
        }
        for (String mon1 : list) {
            salaryDao.clearDataInfo(mon1);
            salaryDao.insertData(mon1);
        }
        return salaryDao.selectDeptSal(mon);
    }

    @Override
    public void clearDataInfo(String mon) {
        salaryDao.clearDataInfo(mon);
    }

    @Override
    public void insertData(String mon) {
        salaryDao.insertData(mon);
    }

    @Override
    public List<DataInfo> selectMonSal(String year) {
        return salaryDao.selectMonSal(year);
    }


}
