<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:#CEFFCE">
	<div align="center">
		<h2>藝文資料</h2>
		<form id="form1" method="post"
			action="<%=request.getContextPath()%>/ArtInsert">
			<table border="1">

				 <tr>
		     		<td>藝文活動類別</td>
		     		 <!--       因為一開始並沒有傳值 所以不用打getArtno()之類接值的東西 表格直接輸入值 -->
					<td>
						<select name="arttype" >
						<option class="area1" value="">請選擇</option>
						<option class="area1" value=" 表演與節慶"> 表演與節慶</option>
						<option class="area1" value="演講／講座">演講／講座</option>
						<option class="area1" value="視覺藝術">視覺藝術</option>
						<option class="area1" value="民俗與文化資產">民俗與文化資產</option>
						<option class="area1" value=" 影視"> 影視</option>
						</select>
					</td>
					
				<tr>
					<td>區域</td>
					<td>
						<select name="area" id="area1">
						<option class="area1" value="">請選擇</option>
						<option class="area1" value="北部">北部</option>
						<option class="area1" value="中部">中部</option>
						<option class="area1" value="南部">南部</option>
						<option class="area1" value="東部">東部</option>
						<option class="area1" value="福建省">福建省</option>
						</select>
					</td>
						
					
				<tr>
					<td>活動時間
					<td><input type="date" name="arttime">
				<tr>
					<td>活動名稱
<!-- 					<td><input type="text" name="artname"> -->
					<td>
						<select name="artname" id="area1">
						<option class="area1" value="2020月光．海音樂會「邊界聚合」-在邊界吟詠">2020月光．海音樂會「邊界聚合」-在邊界吟詠</option>
						<option class="area1" value="「灰姑娘不丟玻璃鞋」 療癒音樂劇">「灰姑娘不丟玻璃鞋」 療癒音樂劇</option>
						<option class="area1" value="舞墨中秋 現場揮毫_陳吉山">舞墨中秋 現場揮毫_陳吉山</option>
						<option class="area1" value="花燁">花燁</option>
						<option class="area1" value="李毓琪：裸根—一切都是懸而未決的">李毓琪：裸根—一切都是懸而未決的</option>
						<option class="area1" value="同安寮十二庄請媽祖老照片歷史回顧展">同安寮十二庄請媽祖老照片歷史回顧展</option>
						<option class="area1" value="「水金九礦山實境探索」實境解謎遊戲">「水金九礦山實境探索」實境解謎遊戲</option>
						<option class="area1" value="「心動向藝術坊師生聯展」作品展">「心動向藝術坊師生聯展」作品展</option>
						<option class="area1" value="BANPRESTO EXPO 2020">BANPRESTO EXPO 2020</option>
						<option class="area1" value="花語錄—女性藝術家花卉畫聯展">花語錄—女性藝術家花卉畫聯展</option>
						<option class="area1" value="負地理學系列講演｜飛碟，火山與外星生命: 兼談東亞飛碟學研究的建構">負地理學系列講演｜飛碟，火山與外星生命: 兼談東亞飛碟學研究的建構</option>
						<option class="area1" value="2020親愛提琴故事節：聞心音樂  （ 2020親愛提琴故事節 ）">2020親愛提琴故事節：聞心音樂  （ 2020親愛提琴故事節 ）</option>
						<option class="area1" value="大雋藝術《在歷史上塗鴉－黃麟詠個展》">大雋藝術《在歷史上塗鴉－黃麟詠個展》</option>
						<option class="area1" value="龍談秋藝─揮毫出自己心中的美學與文學：國畫筆法技巧賞析">龍談秋藝─揮毫出自己心中的美學與文學：國畫筆法技巧賞析</option>
						</select>		
					</td>
				<tr>
				
					
					
			</table>
			<div align="center">
				<input type="submit" name="submit" value="確認"> <input
					type="reset" name="reset" value="重置">
			</div>
			<div align="center">
				<a href="<%=request.getContextPath()%>/Art/Home.jsp">HomrPage</a>
			</div>
		</form>

	</div>
</body>
</html>