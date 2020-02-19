package com.cjp.service.impl;

import com.e3mall.service.ItemService;
import mapper.TbItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.TbItem;

@Service
public class ItemServiceImpl implements ItemService {
    @Autowired
    private TbItemMapper itemMapper;

    @Override
    public TbItem getItemById(Long id) {
        TbItem item = itemMapper.selectByPrimaryKey(id);
        return item;
    }
}
