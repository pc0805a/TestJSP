<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ include file="database_ini.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="register.css" type="text/css" />
<title>����&����</title>
</head>

<SCRIPT type="text/javascript">
	function check() {

		if (reg_form.p_name.value == "") {
			alert("����J�m�W");
		} else if (reg_form.p_id.value == "") {
			alert("����J�����Ҧr��");
		} else
			reg_form.submit();
	}
</SCRIPT>

<body>
	<div style="text-align: center;">
		<font size=6.5><h1>����&����</h1></font>
	</div>
	<div style="text-align: center;">
		<form name="reg_form" action="register_insert.jsp" method="post">
			<table class="table_form" rules="all">
				<tr>
					<td align='right'>�m�W:</td>
					<td align='left'><input type="text" name="p_name"
						class="inputBox" /></td>
				</tr>
				<tr>
					<td width="15%" align='right' NOWRAP>�����Ҧr��:</td>
					<td width="70%" align='left'><input type="text" name="p_id"
						class="inputBox" /></td>
				</tr>

			</table>
			<div style="margin: 15px;">
				<button type="button" class="button"
					onclick="window.location.href='MainMenu.jsp'">�^�D��</button>
				<input type="button" value="����" onClick="check()" class="button" />
			</div>

		</form>
	</div>
	<div style="text-align: center;">

		<h1>�����W��</h1>
		<form action="report.jsp" method="post">
			<input type="submit" value="�T�w����" class="button">
			<table class="table_form" rules="all">
				<tr>
					<td width="5%">�Ǹ�</td>
					<td width="15%">�m�W</td>
					<td width="20%">�����Ҧr��</td>
					<td width="30%">�ͤ�</td>
					<td width="5%">�嫬</td>
					<td width="5%">�ʧO</td>
					<td width="5%">���A</td>
					<td width="5%">�T�{����</td>
				</tr>
				<%
					String query = "select * from test.register";
					ResultSet rs = null;

					stmt = conn.createStatement();
					rs = stmt.executeQuery(query);
					while (rs.next()) {

						if (rs.getInt("status") != 0) {
							out.print("<tr>");

							out.print("<td>" + rs.getInt("no") + "</td>");
							out.print("<td>" + rs.getString("name") + "</td>");
							out.print("<td>" + rs.getString("id") + "</td>");
							out.print("<td>" + rs.getString("b_year") + "\t�~\t" + rs.getString("b_month") + "\t��\t"
									+ rs.getString("b_day") + "\t��" + "</td>");

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
								out.print("<td>" + "�k" + "</td>");
							else
								out.print("<td>" + "�k" + "</td>");

							//out.print("<td>" + rs.getInt("arrival") + "</td>");

							switch (rs.getInt("status")) {
							case 0:
								out.print("<td>" + "������" + "</td>");
								break;
							case 1:
								out.print("<td>" + "�|������" + "</td>");
								break;
							case 2:
								out.print("<td>" + "�w����" + "</td>");
								break;
							case 3:
								out.print("<td>" + "�ݶE����" + "</td>");
								break;
							case 4:
								out.print("<td>" + "�L��" + "</td>");
								break;
							}

							//<input type="radio" name="p_id" value="A123456789">
							if (rs.getInt("status") == 1)//������~���radio button
								out.print("<td><input type=\"radio\" name=\"p_id\" value=\"" + rs.getString("id") + "\"></td>");
							else
								out.print("<td><input type=\"radio\" name=\"p_id\" value=\"" + rs.getString("id") + "\" style=\"display:none\"></td>");
							out.print("</tr>");
						}

					}
				%>
			</table>
		</form>
	</div>
</body>
</html>