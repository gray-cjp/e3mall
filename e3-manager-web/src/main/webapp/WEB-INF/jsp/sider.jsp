<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">商品管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/addItem">新增商品</a></dd>
                    <dd><a href="/getItem">查询商品</a></dd>
                    <dd><a href="javascript:;">规格参数</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">网站内容管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">内容分类管理</a></dd>
                    <dd><a href="javascript:;">内容管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:;">索引库管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">solr索引库维护</a></dd></dl>
            </li>
        </ul>
    </div>
</div>
