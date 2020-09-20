package com.salary.service;

import com.salary.entities.Title;
import java.util.List;

public interface TitleService {
    /**
     * 查询所有职称
     * @return
     */
    List<Title> selectAll();

    /**
     * 通过titleName查询职称
     * @return
     */
    Title selectTitleBytitleName(String titleName);

    /**
     * 添加职称
     * @param title
     */
    void insertTitle(Title title);

    /**
     * 更新职称
     * @param title
     */
    void updateTitle(Title title);

    /**
     * 通过titleId删除职称
     * @param titleId
     */
    void deleteTitle(Integer titleId);
}
