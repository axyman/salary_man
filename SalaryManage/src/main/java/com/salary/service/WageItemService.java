package com.salary.service;


import com.salary.entities.WageItem;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : 沉默小多数
 * @date : 2020-08-27 09:38
 **/
@Service
public interface WageItemService {
    /**
     * 查询所有工资项
     * @return
     */
    public List<WageItem> selectAllWageItem();

    public WageItem selectAllWageItemByWageItemId(Integer wageItemId);
    /**
     * 修改工资项信息
     */
    public void updateWageItem(WageItem wageItem);

}
