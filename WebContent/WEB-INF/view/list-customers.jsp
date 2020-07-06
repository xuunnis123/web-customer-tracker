<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	
<head>
	<title>List Customers</title>
	<!-- <meta charset="utf-8"> -->
	<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div id="wrapper">
		<div id="header">
			
			<h2>客戶管理清單</h2>
			<h2>Customer Relationship Manager</h2>
		</div>
	</div>
	<!--  add a search box -->
     <form:form action="search" method="GET">
       客戶查詢: <input type="text" name="theSearchName" />
       <input type="submit" value="Search" class="add-button" />
     </form:form>

	
	<div id="container">
		<div id="content">
			<!-- add new button -->
		<input type="button" value="Add Customer" 
		onclick="window.location.href='showFormForAdd'; return false;"
		class="add-button"
		/>
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>操作</th>
				</tr>
				<!-- loop the data -->
				<c:forEach var="tempCustomer" items="${customers}">
					<!-- construct an update with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					<tr>
						<td> ${tempCustomer.firstName} </td>
						<td> ${tempCustomer.lastName} </td>
						<td> ${tempCustomer.email} </td>
						<td> <a href="${updateLink}">更新</a>
						|
						<a href="${deleteLink}" onclick="if(!(confirm('確定要刪除嗎'))) return false">刪除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
	</div>
</body>
</html>