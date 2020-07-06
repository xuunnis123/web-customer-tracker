<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>Save Customer</title>
	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">
		  
	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/add-customer-style.css">
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>客戶管理清單</h2>
		</div>
	</div>
	<div id="container">
		<h3>儲存客戶資訊</h3>
			<form:form action="saveCustomer" modelAttribute="customer" method="POST">
				
				<!-- need to associate this data with customer id -->
				<form:hidden path="id" />
				
				<table>
					<tbody>
						<tr>	
							<td><label>名字</label></td>
							<td> <form:input path="firstName"/></td>
						</tr>
						<tr>	
							<td><label>姓氏</label></td>
							<td><form:input path="lastName"/></td>
						</tr>
						<tr>	
							<td><label>信箱</label></td>
							<td><form:input path="email"/></td>
						</tr>
						<tr>	
							<td><label></label></td>
							<td><input type="submit" value="Save" class="save" /></td>
						</tr>
					</tbody>
				</table>
			</form:form>
			
			<div style="clear;both;"></div>
			<p>
				<a href="${pageContext.request.contextPath}/customer/list">回上一頁</a>
			</p>
	</div>
</body>
</html>