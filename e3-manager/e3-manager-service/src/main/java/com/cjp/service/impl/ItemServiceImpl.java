package com.cjp.service.impl;

import com.e3mall.service.ItemService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import mapper.TbItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.TbItem;

import java.util.List;
import java.util.Map;

@Service
public class ItemServiceImpl implements ItemService {
    @Autowired
    private TbItemMapper itemMapper;

    @Override
    public TbItem getItemById(Long id) {
        TbItem item = itemMapper.selectByPrimaryKey(id);
        return item;
    }

    @Override
    public pojo.PageInfo getItemList(String page, String limit, TbItem tbItem) {
        int pageNo = Integer.parseInt( page== null ? "1" : page);
        int pageSiz = Integer.parseInt(limit == null ? "10" : limit);
        PageHelper.startPage(pageNo,pageSiz);
        List<Map<String,Object>> list = itemMapper.selectTbItemList(tbItem);
        PageInfo<Map<String, Object>> info = new PageInfo<>(list,pageSiz);
        int row = itemMapper.selectCount();
        pojo.PageInfo pageInfo = new pojo.PageInfo();
        pageInfo.setCount(row);
        pageInfo.setData(info);
        return pageInfo;

    }

}
