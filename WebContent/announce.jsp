<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="database_ini.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="announce.css" type="text/css" />
<title>診間叫號</title>
</head>



<body>
	<div style="text-align: center;">
		<font size=6.5><h1>診間叫號</h1></font>
	</div>

	<div style="text-align: center;">
		<p style="font-size: 25px">看診科別:</p>
		<p style="font-size: 25px">主治醫生:</p>
	</div>

	<div style="text-align: center; margin: 20px;"><!--開始看診控制區塊-->
		<form action="clinicStatus.jsp" method="post">
			<input type="hidden" name="c_flag" value=0>
			<%
				String query = "select * from test.clinic;";
				ResultSet rs = stmt.executeQuery(query);
				rs.next();

				if (rs.getInt("status") == 0) {
					out.println("<input type=\"submit\" value=\"開始看診\" class=\"button\" />");
				} else {
					out.println("<input type=\"submit\" value=\"結束看診\" class=\"finButton\" />");
				}
			%>
		</form>
	</div>
	
	<div style="text-align: center; margin: 20px;"><!--控制叫號區塊-->
		<form action="clinicStatus.jsp" method="post">
			<input type="hidden" name="c_flag" value=1>
			<%
				query = "select * from test.clinic;";
				rs = stmt.executeQuery(query);
				rs.next();

				if (rs.getInt("status") == 1) {
					out.println("<input type=\"submit\" value=\"叫號\" class=\"button\" />");
				}
			%>
		</form>
	</div>
	
	<div style="text-align: center; margin: 20px;"><!--叫號歸0-->
		<form action="clinicStatus.jsp" method="post">
			<input type="hidden" name="c_flag" value=-1>
			<%
				query = "select * from test.clinic;";
				rs = stmt.executeQuery(query);
				rs.next();

				if (rs.getInt("status") == 0) {
					out.println("<input type=\"submit\" value=\"號碼歸0\" class=\"button\" />");
				}
			%>
		</form>
	</div>


	<div style="text-align: center;"><!--現在號碼區塊-->
		<p style="font-size: 25px">現在號碼</p>
		<%
			query = "select * from test.clinic;";
			rs = stmt.executeQuery(query);
			rs.next();
			
			int p_no = rs.getInt("p_no");
			
			out.println("<p style=\"font-size: 25px\">" + p_no + "號</p>");
		%>
	</div>
	
	<div style="text-align: center;"><!--現在病人資訊-->
		<p style="font-size: 25px">現在病人</p>
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
					query = "select * from test.register where no =\"" + p_no+"\";";
				
					stmt = conn.createStatement();
					rs = stmt.executeQuery(query);
					while (rs.next()) {

						if (rs.getInt("status") != 0) {
							out.print("<tr>");

							out.print("<td>" + rs.getInt("no") + "</td>");
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
						}

					}
				%>
		</table>
	</div>

	<div style="text-align: center;"><!--看診名單資訊-->
		<p style="font-size: 25px">看診名單</p>
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
					query = "select * from test.register";
					rs = null;

					stmt = conn.createStatement();
					rs = stmt.executeQuery(query);
					while (rs.next()) {

						if (rs.getInt("status") != 0) {
							out.print("<tr>");

							out.print("<td>" + rs.getInt("no") + "</td>");
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

						}

					}
				%>
		</table>
	</div>

</body>
</html>