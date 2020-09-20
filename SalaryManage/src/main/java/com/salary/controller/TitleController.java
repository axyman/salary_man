package com.salary.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.salary.entities.Post;
import com.salary.entities.Title;
import com.salary.service.TitleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/title")
public class TitleController {
    @Autowired
    private TitleService titleService;

    @RequestMapping("/selectAll")
    public String selectAll(Model model,@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "size", defaultValue = "4") int size) {
        PageHelper.startPage(page,4);
        List<Title> titles = titleService.selectAll();
        PageInfo pageInfo=new PageInfo(titles,4);
        model.addAttribute("pageInfo",pageInfo);
        return "title";
    }

    @ResponseBody
    @RequestMapping("/selectAllForData")
    public List<Title> selectAllForData() {
        List<Title> titles = titleService.selectAll();
        return titles;
    }

    @RequestMapping("/selectTitleBytitleName")
    public String selectTitleBytitleName(String titleName,Model model) {
        Title title = titleService.selectTitleBytitleName(titleName);
        model.addAttribute("title",title);
        return "title";
    }
    @ResponseBody
    @RequestMapping("/selectTitleBytitleName2")
    public Title selectTitleBytitleName2(String titleName,Model model) {
        Title title = titleService.selectTitleBytitleName(titleName);
        model.addAttribute("title",title);
        return title;
    }

    @RequestMapping("/insertTitle")
    public String insertTitle(Title title) {
        titleService.insertTitle(title);
        return "redirect:selectAll";
    }

    @RequestMapping("/updateTitle")
    public String updateTitle(Title title) {
        titleService.updateTitle(title);
        return "redirect:selectAll";
    }

    @RequestMapping("/deleteTitle")
    public String deleteTitle(Integer titleId) {
        titleService.deleteTitle(titleId);
        return "redirect:selectAll";
    }
}
