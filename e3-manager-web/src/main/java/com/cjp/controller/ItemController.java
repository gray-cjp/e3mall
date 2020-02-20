package com.cjp.controller;


import com.e3mall.service.ItemService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.TbItem;

@Controller
public class ItemController {
    @Autowired
    private ItemService itemService;

    @RequestMapping("/item/{id}")
    @ResponseBody
    private TbItem getItemById(@PathVariable Long id) {
        TbItem tbItem = itemService.getItemById(id);
        return tbItem;
    }
}
