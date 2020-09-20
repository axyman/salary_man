package com.salary.controller;


import com.salary.entities.WageItem;
import com.salary.service.WageItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author : 沉默小多数
 * @date : 2020-08-27 09:46
 **/
@Controller
public class WageItemContronller {
    @Autowired
    private WageItemService wageItemService;
    /**
     * 查询所有的工资项
     */
   @RequestMapping("/findAllWageItem")
   @ResponseBody
    public WageItem findAllWageItem(Integer wageItemId) {
       WageItem wageItem = wageItemService.selectAllWageItemByWageItemId(wageItemId);
       return wageItem;
   }

    /**
     * 修改工资项信息
     */
    @RequestMapping("/updateWageItem")
    public String updateWageItem(WageItem wageItem){
        wageItemService.updateWageItem(wageItem);
        return "wageItems";
    }
}
