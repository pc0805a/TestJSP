<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="database_ini.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="register.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;">
		<h1>所有名單</h1>
		<table class="table_form" rules="all">
			<tr>
				<td width="5%">序號</td>
				<td width="15%">姓名</td>
				<td width="20%">身分證字號</td>
				<td width="30%">生日</td>
				<td width="5%">血型</td>
				<td width="5%">性別</td>
				<td width="5%">狀態</td>
			</tr>
			<%
				String selectQuery = "select * from test.allpatients";
				ResultSet rs = null;

				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectQuery);
				while (rs.next()) {
					out.print("<tr>");

					out.print("<td>" + rs.getInt("sn") + "</td>");
					out.print("<td>" + rs.getString("name") + "</td>");
					out.print("<td>" + rs.getString("id") + "</td>");
					out.print("<td>" + rs.getString("b_year") + "\t年\t" + rs.getString("b_month") + "\t月\t"
							+ rs.getString("b_day") + "\t日" + "</td>");

					//out.print("<td>" + rs.getInt("blood_type") + "</td>");

					switch (rs.getInt("blood_type")) {
					case 1:
						out.print("<td>" + "A" + "</td>");
						break;
					case 2:
						out.print("<td>" + "B" + "</td>");
						break;
					case 3:
						out.print("<td>" + "O" + "</td>");
						break;
					case 4:
						out.print("<td>" + "AB" + "</td>");
						break;
					}

					//out.print("<td>" + rs.getInt("gender") + "</td>");

					if (rs.getInt("gender") == 1)
						out.print("<td>" + "男" + "</td>");
					else
						out.print("<td>" + "女" + "</td>");

					//out.print("<td>" + rs.getInt("arrival") + "</td>");

					switch (rs.getInt("status")) {
					case 0:
						out.print("<td>" + "未掛號" + "</td>");
						break;
					case 1:
						out.print("<td>" + "尚未報到" + "</td>");
						break;
					case 2:
						out.print("<td>" + "已報到" + "</td>");
						break;
					case 3:
						out.print("<td>" + "看診完畢" + "</td>");
						break;
					case 4:
						out.print("<td>" + "過號" + "</td>");
						break;
					}

					out.print("</tr>");

				}
			%>
		</table>
	</div>
	<div style="margin: 15px; text-align: center;" >
				<button type="button" class="button"
					onclick="window.location.href='MainMenu.jsp'">回主頁</button>
	</div>
</body>
</html>