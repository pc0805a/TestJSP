<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="database_ini.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="mainMenu.css" type="text/css" />
<title>報到掛號系統</title>
</head>
<body>
	<div style="text-align: center;">
		<font size=6.5><h1>報到掛號系統</h1></font>
	</div>

	<div class="buttonContainer">
		<button type="button" class="menuButton"
			onclick="window.location.href='first_Time_reg.jsp'">初診掛號</button>
	</div>
	<div class="buttonContainer">
		<button type="button" class="menuButton"
			onclick="window.location.href='reg.jsp'">掛號&報到</button>
	</div>
	<div class="buttonContainer">
		<button type="button" class="menuButton"
			onclick="window.location.href='announce.jsp'">診間叫號</button>
	</div>
	<div class="buttonContainer">
		<button type="button" class="menuButton"
			onclick="window.location.href='AllPatients.jsp'">所有病患名單</button>
	</div>




</body>
</html>