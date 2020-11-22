<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Bryce Sunrise
Description: A three-column, fixed-width blog design.
Version    : 1.0
Released   : 20100501

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<style>
.uploadImage{
    display: inline-block;
    vertical-align: top;
    position: relative;
    width: 90px;
    height: 90px;
    background: url("${pageContext.request.contextPath}/images/Button_Add.png") no-repeat;
    background-size: cover;
    text-align: center;
    cursor: pointer;
}
.uploadImage p{
    position: absolute;
    left:0;right:0;
    bottom: 10px;
    font-size: 14px;
    color: #999999;
}
.uploadImage input#file{
    width: 100%;
    height: 100%;
    opacity: 0;
    cursor: pointer;
}
.preview{
    position: relative;
    display: inline-block;
    vertical-align: top;
    margin-left: 10px;
    width: 90px;
    height: 90px;
    background: #E1E6ED;
    text-align: center;
}
.preview img{
    position: relative;
    z-index: 1;
    width: 100%;
    height: 100%;
}
.preview img[src=""]{
    opacity:0;
    filter: Alpha(0); /* 相容IE8-9 */
}
.preview img:not([src]){
    opacity:0;
    filter: Alpha(0); /* 相容IE8-9 */
}
.preview .word{
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    line-height: 90px;
    font-size: 14px;
    color: #999999;
    z-index: 0;
}
</style>

</head>
<body>

<div class="pic">
    <div class="uploadImage">
        <input type="file" name ="pictures" value="上傳檔案" id="file" accept="image/png, image/jpeg, image/gif, image/jpg" multiple/>
    </div>
    <div class="preview">
        <img src="" id="look1">
        <p class="word">圖片1</p>
    </div>
    <div class="preview">
        <img src="" id="look2">
        <p class="word">圖片2</p>
    </div>

</div>

<script>
var hasUploadedOne = false;// 已上傳過1張圖片
var hasUploadedTwo = false;// 已上傳過2張圖片

//獲取到預覽框
var imgObjPreview1 = document.getElementById("look1");
var imgObjPreview2 = document.getElementById("look2");
document.getElementById('file').onchange = function() {
    // 若還沒完成2張圖片的上傳
    if(!hasUploadedTwo){
        //獲取到file的檔案
        var docObj = this;

        //獲取到檔名和型別（非IE，可一次上傳1張或多張）
        if(docObj.files && docObj.files[0]) {
            // 一次上傳了>=2張圖片（只有前兩張會真的上傳上去）
            if(docObj.files.length >= 2){
                imgObjPreview1.src = window.URL.createObjectURL(docObj.files[0]);
                imgObjPreview2.src = window.URL.createObjectURL(docObj.files[1]);
                hasUploadedTwo = true;
            }
            //一次只上傳了1張照片
            else{
                // 這是上傳的第一張照片
                if(!hasUploadedOne){
                    imgObjPreview1.src = window.URL.createObjectURL(docObj.files[0]);
                    hasUploadedOne = true;
                }
                // 這是上傳的第二張照片
                else{
                    imgObjPreview2.src = window.URL.createObjectURL(docObj.files[0]);
                    hasUploadedTwo = true;
                }
            }

        }
        //IE（只能一次上傳1張）
        else {
            //使用濾鏡
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            // 這是上傳的第一張照片
            if(!hasUploadedOne){
                imgObjPreview1.src = imgSrc;
                hasUploadedOne = true;
            }
            // 這是上傳的第二張照片
            else{
                imgObjPreview2.src = imgSrc;
                hasUploadedTwo = true;
            }
            document.selection.empty();
        }
        return true;
    }
}
</script>

</body>
</html>
