package com.salary.service.impl;

import com.salary.dao.WageItemDao;

import com.salary.entities.WageItem;
import com.salary.service.WageItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : 沉默小多数
 * @date : 2020-08-27 09:39
 **/
@Service
public class WageItemServiceImp  implements WageItemService {
    @Autowired
    private WageItemDao wageItemDao;

    /**
     * 查询所有工资项
     * @return
     */
    @Override
    public List<WageItem> selectAllWageItem() {
        return wageItemDao.selectAllWageItem();
    }


    @Override
    public WageItem selectAllWageItemByWageItemId(Integer wageItemId) {
        return wageItemDao.selectAllWageItemByWageItemId(wageItemId);
    }

    /**
     * 修改工资项
     */
    @Override
    public void updateWageItem(WageItem wageItem) {
        wageItemDao.updateWageItem(wageItem);
       // return false;
    }
}
