<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
   <option  value="" label="請選擇" />
   <c:forEach var="all" items="${categoryList}">
   	<option  value="${all.activityClass}">${all.activityClass} </option>
	</c:forEach>
<div class="invalid-feedback" style="display:none"></div>

<script type="text/javascript">
	
</script>
</body>
</html>