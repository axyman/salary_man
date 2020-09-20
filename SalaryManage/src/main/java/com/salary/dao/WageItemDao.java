package com.salary.dao;

/**
 * @author : 沉默小多数
 * @date : 2020-08-27 09:30
 **/


import com.salary.entities.WageItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface WageItemDao {
    /**
     * 查询所有工资项
     */
    public List<WageItem> selectAllWageItem();
    public WageItem selectAllWageItemByWageItemId(Integer wageItemId);
    /**
     * 修改工资项信息
     */
    public void updateWageItem(WageItem wageItem);

}
