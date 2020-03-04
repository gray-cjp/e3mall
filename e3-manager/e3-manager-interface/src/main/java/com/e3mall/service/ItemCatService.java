package com.e3mall.service;

import com.e3mall.pojio.EasyUITreeNode;

import java.util.List;

public interface ItemCatService {
    List<EasyUITreeNode> getCatList(long parentId);
}
