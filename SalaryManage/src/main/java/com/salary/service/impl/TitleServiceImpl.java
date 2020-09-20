package com.salary.service.impl;

import com.salary.dao.TitleDao;
import com.salary.entities.Title;
import com.salary.service.TitleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TitleServiceImpl implements TitleService {
    @Autowired
    private TitleDao titleDao;

    @Override
    public List<Title> selectAll() {
        return titleDao.selectAll();
    }

    @Override
    public Title selectTitleBytitleName(String titleName) {
        return titleDao.selectTitleBytitleName(titleName);
    }

    @Override
    public void insertTitle(Title title) {
        titleDao.insertTitle(title);
    }

    @Override
    public void updateTitle(Title title) {
        titleDao.updateTitle(title);
    }

    @Override
    public void deleteTitle(Integer titleId) {
        titleDao.deleteTitle(titleId);
    }
}
