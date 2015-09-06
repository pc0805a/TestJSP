<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="database_ini.jsp"%>
<%
	int c_flag = Integer.parseInt(request.getParameter("c_flag"));

	String query = "select * from test.clinic;";
	ResultSet rs = stmt.executeQuery(query);
	rs.next();
	int p_no = rs.getInt("p_no");

	query = "select count(*) as count from test.register;";
	rs = stmt.executeQuery(query);
	rs.next();
	int p_count = rs.getInt("count");

	query = "select * from test.register where no='" + p_no + "';";
	rs = stmt.executeQuery(query);
	rs.next();
	String p_id = rs.getString("id");

	if (c_flag == 0) //控制看診愷始與否
	{
		query = "select * from test.clinic;";
		rs = stmt.executeQuery(query);
		rs.next();

		if (rs.getInt("status") == 0) //開始看診 , 把狀態設成1
		{
			query = "update test.clinic set status=1 where major=\"test\" and doctor = \"test\";";//看診狀態設成1
			stmt.executeUpdate(query);

			out.println("<SCRIPT LANGUAGE='JavaScript'>");
			out.println("<!--");
			out.println("alert('開始看診')");
			out.println("//-->");
			out.println("</SCRIPT>");
		} else//開始看診 , 把狀態設成0
		{
			query = "update test.clinic set status=0 where major=\"test\" and doctor = \"test\";";//看診狀態設成0
			stmt.executeUpdate(query);
			out.println("<SCRIPT LANGUAGE='JavaScript'>");
			out.println("<!--");
			out.println("alert('結束看診')");
			out.println("//-->");
			out.println("</SCRIPT>");
		}
	}

	else if (c_flag == 1) {//控制叫號

		if (p_no >= p_count - 1) {
			out.println("<SCRIPT LANGUAGE='JavaScript'>");
			out.println("<!--");
			out.println("alert('沒有下一位病人, 已經全部看診完畢')");
			out.println("//-->");
			out.println("</SCRIPT>");
		} else {
			query = "update test.clinic set p_no=p_no+1;";
			stmt.executeUpdate(query);

			out.println("<SCRIPT LANGUAGE='JavaScript'>");
			out.println("<!--");
			out.println("alert('下一號')");
			out.println("//-->");
			out.println("</SCRIPT>");
		}

	} else if (c_flag == 3) //過號
	{

		if (p_no >= p_count - 1) {
			out.println("<SCRIPT LANGUAGE='JavaScript'>");
			out.println("<!--");
			out.println("alert('沒有下一位病人, 已經全部看診完畢')");
			out.println("//-->");
			out.println("</SCRIPT>");
		} else {
			query = "update test.allpatients set status=4 where id=\"" + p_id + "\";";
			stmt.executeUpdate(query);
			query = "update test.register set status=4 where id=\"" + p_id + "\";";
			stmt.executeUpdate(query);
			query = "update test.clinic set p_no=p_no+1;";
			stmt.executeUpdate(query);
			out.println("<SCRIPT LANGUAGE='JavaScript'>");
			out.println("<!--");
			out.println("alert('過號')");
			out.println("//-->");
			out.println("</SCRIPT>");
		}
	}

	else if (c_flag == -1) //叫號歸0
	{
		query = "update test.clinic set p_no=0;";
		stmt.executeUpdate(query);
		out.println("<SCRIPT LANGUAGE='JavaScript'>");
		out.println("<!--");
		out.println("alert('叫號歸零')");
		out.println("//-->");
		out.println("</SCRIPT>");
	}

	response.setHeader("Refresh", "0;url=announce.jsp");
%>
