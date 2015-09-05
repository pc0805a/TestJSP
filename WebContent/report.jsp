<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="database_ini.jsp"%>
<%
	String p_id = request.getParameter("p_id");

	if (p_id != null) {
		String query = "update test.allpatients set status=2 where id='" + p_id + "';";
		stmt.executeUpdate(query);

		query = "update test.register set status=2 where id='" + p_id + "';";
		stmt.executeUpdate(query);

		out.println("<SCRIPT LANGUAGE='JavaScript'>");
		out.println("alert('報到成功')");
		out.println("</SCRIPT>");

	} else {
		out.println("<SCRIPT LANGUAGE='JavaScript'>");
		out.println("alert('您尚未選擇')");
		out.println("</SCRIPT>");
	}

	response.setHeader("Refresh", "0;url=reg.jsp");
%>