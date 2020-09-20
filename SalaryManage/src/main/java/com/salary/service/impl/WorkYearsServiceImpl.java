package com.salary.service.impl;

import com.salary.dao.WorkYearsDao;
import com.salary.entities.WorkYears;
import com.salary.service.WorkYearsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkYearsServiceImpl implements WorkYearsService {
    @Autowired
    private WorkYearsDao workYearsDao;

    @Override
    public List<WorkYears> selectAll() {
        return workYearsDao.selectAll();
    }

    @Override
    public WorkYears selectWorkYearsByworkYears(Integer workYears) {
        return workYearsDao.selectWorkYearsByworkYears(workYears);
    }

    @Override
    public void insertWorkYears(WorkYears workYears) {
        workYearsDao.insertWorkYears(workYears);
    }

    @Override
    public void updateWorkYears(WorkYears workYears) {
        workYearsDao.updateWorkYears(workYears);
    }

    @Override
    public void deleteWorkYears(Integer workId) {
        workYearsDao.deleteWorkYears(workId);
    }
}
