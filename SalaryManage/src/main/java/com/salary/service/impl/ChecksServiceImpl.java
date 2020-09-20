package com.salary.service.impl;

import com.salary.dao.ChecksDao;
import com.salary.entities.Checks;
import com.salary.service.ChecksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ChecksServiceImpl implements ChecksService {

    @Autowired
    private ChecksDao checksDao;

    @Override
    public List<Checks> selectAll(Integer empId, String mon, Integer deptId) {
        return checksDao.selectAll(empId,mon,deptId);
    }

    @Override
    public void insertChecks(Checks checks) {
        checksDao.insertChecks(checks);
    }

    @Override
    public void updateChecks(Checks checks) {
        checksDao.updateChecks(checks);
    }

    @Override
    public void deleteChecks(Integer checksId) {
        checksDao.deleteChecks(checksId);
    }

    @Override
    public void deleteChecksOfBatch(List<Integer> checksIds) {
        checksDao.deleteChecksOfBatch(checksIds);
    }

    @Override
    public Checks selectChecksByChecksId(Integer checksId) {
        return checksDao.selectChecksByChecksId(checksId);
    }
}
