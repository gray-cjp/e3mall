package com.cjp.controller;


import com.e3mall.service.ItemService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.PageInfo;
import pojo.TbItem;

import java.util.Map;

@Controller
public class ItemController {
    private static Logger log  = Logger.getLogger(ItemController.class);
    @Autowired
    private ItemService itemService;

    @RequestMapping("/item/{id}")
    @ResponseBody
    private TbItem getItemById(@PathVariable Long id) {
        TbItem tbItem = itemService.getItemById(id);
        return tbItem;
    }
    @RequestMapping("/getItem")
    public String getItem(String num,String status,Model model){
        log.info("num:"+num+"   status:"+status);
        model.addAttribute("num",num);
        model.addAttribute("status",status);
        return "tbItem";
    }

    @RequestMapping("/item-list")
    @ResponseBody
    private PageInfo getItemList(TbItem tbItem,String page,String limit) {
        log.info("page:"+page+"  limit:"+limit+"TbItem:"+tbItem);
        return itemService.getItemList(page,limit,tbItem);
    }
    @RequestMapping("/addItem")
    public String addItem(){
        return "addItem";
    }
}
