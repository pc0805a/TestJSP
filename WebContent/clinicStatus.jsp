<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="database_ini.jsp"%>
<%
	int c_flag = Integer.parseInt(request.getParameter("c_flag"));

	if (c_flag == 0) //控制看診愷始與否
	{
		String query = "select * from test.clinic;";
		ResultSet rs = stmt.executeQuery(query);
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
		String query = "update test.clinic set p_no=p_no+1;";
		stmt.executeUpdate(query);
		out.println("<SCRIPT LANGUAGE='JavaScript'>");
		out.println("<!--");
		out.println("alert('下一號')");
		out.println("//-->");
		out.println("</SCRIPT>");
	}
	
	else if(c_flag == -1)//叫號歸0
	{
		String query = "update test.clinic set p_no=0;";
		stmt.executeUpdate(query);
		out.println("<SCRIPT LANGUAGE='JavaScript'>");
		out.println("<!--");
		out.println("alert('叫號歸零')");
		out.println("//-->");
		out.println("</SCRIPT>");
	}

	response.setHeader("Refresh", "0;url=announce.jsp");
%>
