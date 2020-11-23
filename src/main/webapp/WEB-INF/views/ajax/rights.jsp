<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
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
	 	{id:1, pId:0, name: "root", checked:true},
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
		$.fn.zTree.init($("#tree"), setting, ${rights1});
// 		cosole.log(${rights1});
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
		var roleString ="" ;
		for ( var i=0 ; i < zNodeCheck.length ; i++ ){
			var treeNodes = zNodeCheck[i];
				
			roleString=roleString+treeNodes.id + "," ;
		}  $("#treeHidden").val(roleString);
//		console.log(  $("#treeHidden").val());
		
	};
</script>
</head>
<body>

<h2 >權限設定</h2>
	        
<form id="selectform" method="get" action="#">
	<div >角色類別:	
		<input type="hidden" id="rolecheck${ro.roleId}"  value="${ro.roleId}" />
		<select class="role"  name="selectrole" id="selectrole">
		 <option value="" label="請選擇" ></option>
	<c:forEach var="ro" items="${roleList}" > 
		 <option class="area1" value="${ro.roleId}" name="rolecheck${ro.roleId}" >${ro.roleName}</option>	
	</c:forEach>
		</select>
		<div  style="display:none"></div>		
	</div>
		<input type="hidden" id="treeHidden"  value="" />	
		<ul id="tree" class="ztree"></ul>
	<div>			 
			<button type="button" class="btnsm" name="rightsOk" id="rightsOk">儲存</button>
		</div>
</form>

<script>


		//確定鍵
	$(".btnsm").click(function(){		
		var roleSave=$("#selectrole").val();
		var ztreeSave=$("#treeHidden").val()
		 console.log(ztreeSave)
		 console.log(roleSave)
		 $.ajax({
					url : "rights",
					type : "GET",
					dataType : "html", //server送回
					contentType : 'application/json; charset=utf-8',
					data : {
						roleSave:roleSave,
						ztreeSave:ztreeSave
					}, //data空的代表沒任何參數
					success : function(data) { //成功的話
					alert("權限設定成功");
// 						$(".newajaxlist").empty();
// 						$(".newajaxlist").append(data); 	     

	       },  
	    })
	})
	
	//下拉式選單管理員選擇
	 $("#selectrole").click (function () {
	   var  rsbList= $("#selectrole").val(); 
	   
	   console.log(rsbList)
        
	    $.ajax({
	       url:"selectRights",
	       type: "get",
	       dataType: "html",
	       contentType: 'application/json; charset=utf-8',
	       data: {
	    	   rsbList:rsbList  ,
	     },
	      success:function(data){
// 	        $(".post").empty();
// 	        $(".newajaxlist").empty();
// 	        $(".newajaxlist").append(data);

	     
//	       console.log(data);
 	       },  
	    })
	 })
	</script>
</body>
</html>