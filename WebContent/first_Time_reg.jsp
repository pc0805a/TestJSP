<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="database_ini.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="register.css" type="text/css" />
<title>初診掛號</title>
</head>

<SCRIPT type="text/javascript">
	function check() {

		if (reg_form.p_name.value == "") {
			alert("未輸入姓名");
		} else if (reg_form.p_id.value == "") {
			alert("未輸入身分證字號");
		} else if (reg_form.b_year.value == "" || reg_form.b_month.value == ""
				|| reg_form.b_day.value == "") {
			alert("未輸入完整生日日期");
		} else if (!reg_form.gender[0].checked && !reg_form.gender[1].checked) {
			alert("未選擇性別");
		} else if (reg_form.blood_type.value == "") {
			alert("未選擇血型");
		} else {
			reg_form.submit();
		}

	}
</SCRIPT>

<body>
	<div style="text-align: center;">
		<font size=6.5><h1>初診掛號</h1></font>
	</div>

	<div style="text-align: center;">
		<form name="reg_form" action="register_insert.jsp" method="post">
			<table class="table_form" rules="all">
				
				
				<tr>
					<td align='right'>姓名:</td>
					<td align='left'><input type="text" name="p_name"
						class="inputBox" /></td>
				</tr>
				<tr>
					<td width="15%" align='right' NOWRAP>身分證字號:</td>
					<td width="70%" align='left'><input type="text" name="p_id"
						class="inputBox" /></td>

				</tr>
				<tr>
					<td align='right'>生日:</td>
					<td align='left'><input type="text" name="b_year"
						class="inputBox" placeholder="年" /> <a>年</a> <input type="text"
						name="b_month" class="inputBox" placeholder="月" /><a>月</a> <input
						type="text" name="b_day" class="inputBox" placeholder="日" /><a>日</a>
					</td>
				</tr>

				<tr>
					<td align='right'>性別:</td>
					<td align='left'>男:<input type="radio" name="gender" value="1">
						女:<input type="radio" name="gender" value="2"></td>
				</tr>
				<tr>
					<td align='right'>血型:</td>
					<td align='left'><select name="blood_type">
							<option value="" disabled="disabled" selected="selected">Please
								select a type</option>
							<option value="1">A</option>
							<option value="2">B</option>
							<option value="3">O</option>
							<option value="4">AB</option>
					</select></td>
				</tr>
			</table>

			<div style="margin: 15px;">
				<button type="button" class="button"
					onclick="window.location.href='MainMenu.jsp'">回主頁</button>
				<input type="button" value="掛號" onClick="check()" class="button" />
			</div>
		</form>
	</div>

	<div style="text-align: center;">
		<h1>掛號名單</h1>
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

				}
			%>
		</table>
	</div>



</body>
</html>