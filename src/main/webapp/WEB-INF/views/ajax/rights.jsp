<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck.js"></script>
<link rel="stylesheet" type="text/css" href="js/zTreeStyle.css"/>
<script>
	var nodes = [
		{id:1, pId:0, name: "root"},
	    {id:2, pId:1, name: "功能總覽"},
	    {id:21, pId:2, name: "會員管理"},
	    {id:22, pId:2, name: "活動管理"},
	    {id:23, pId:2, name: "角色管理"},
	    {id:24, pId:2, name: "權限管理"},
	    {id:3, pId:1, name: "圖表即時分析"},
	    {id:31, pId:3, name: "縣市統計"},
	    {id:32, pId:3, name: "區域活動"},
	    {id:32, pId:3, name: "性別分析"},
	    {id:33, pId:3, name: "星座比較"},
	    {id:34, pId:3, name: "日誌"}
	    
	];
	
	$(document).ready(function(){
		$.fn.zTree.init($("#tree"), setting, nodes);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.expandAll(true);
	})
	
	var setting = {
			check: {  
			    enable: true  
			          
			},data:{
		    	simpleData: {
		            enable: true
		        }	
		    },callback: {
				onCheck: zTreeOnCheck
			},view:{
				showIcon:false
			}
    }
	
	
	function zTreeOnCheck(event, treeId, treeNode) {
		var zNodeCheck = $.fn.zTree.getZTreeObj("tree").getCheckedNodes();
		for ( var i=0 ; i < zNodeCheck.length ; i++ ){
			var treeNodes = zNodeCheck[i];
			console.log(treeNodes);		
		}
	};
</script>
</head>
<body>
<h2 class="sub-header">權限設定</h2>
<ul id="tree" class="ztree"></ul>
</body>
</html>