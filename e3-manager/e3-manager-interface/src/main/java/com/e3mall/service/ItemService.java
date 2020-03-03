package com.e3mall.service;

import pojo.PageInfo;
import pojo.TbItem;

public interface ItemService {
    TbItem getItemById(Long id);
    PageInfo getItemList(String page, String limit, TbItem tbItem);
}
