package com.cjp.service.impl;

import com.e3mall.pojio.EasyUITreeNode;
import com.e3mall.service.ItemCatService;
import mapper.TbItemCatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import pojo.TbItemCat;
import pojo.TbItemCatExample;

import java.util.ArrayList;
import java.util.List;
@Service
public class ItemCatServiceImpl implements ItemCatService {
    @Autowired
    private TbItemCatMapper itemCatMapper;

    @Override
    public List<EasyUITreeNode> getCatList(long parentId) {
        TbItemCatExample tbItemCatExample = new TbItemCatExample();
        TbItemCatExample.Criteria criteria = tbItemCatExample.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        List<TbItemCat> tbItemCats = itemCatMapper.selectByExample(tbItemCatExample);
        List<EasyUITreeNode> list = new ArrayList<>();
        for (int i = 0; i < tbItemCats.size(); i++) {
            EasyUITreeNode easyUITreeNode = new EasyUITreeNode();
            easyUITreeNode.setId(tbItemCats.get(i).getId());
            easyUITreeNode.setState(tbItemCats.get(i).getIsParent()?"closed":"open");
            list.add(easyUITreeNode);
        }
        return list;
    }
}
