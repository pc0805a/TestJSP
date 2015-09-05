<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="database_ini.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	if (request.getParameter("p_name") != null) {
		String p_name = request.getParameter("p_name");
		String p_id = request.getParameter("p_id");
		String gender = request.getParameter("gender");
		String b_year = request.getParameter("b_year");
		String b_month = request.getParameter("b_month");
		String b_day = request.getParameter("b_day");
		String blood_type = request.getParameter("blood_type");
		
		String query = "select count(*) as count from test.register;";
		
		ResultSet rs = null;
		PreparedStatement pst = null;
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		rs.next();
		
		int count = rs.getInt("count");//看診人數

		query = "select count(*) as count from test.allpatients where name='" + p_name + "' and id='"
				+ p_id + "';";

		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		rs.next();

		if (rs.getInt("count") == 0) //若第一次掛號到allpatient建立資料
		{
			if (gender != null) //預防從另一個掛號介面輸入新的病人
			{
				query = "insert into test.allpatients (name, id, gender, b_year, b_month, b_day, blood_type, status) values (?,?,?,?,?,?,?,1)";

				pst = conn.prepareStatement(query);

				pst.setString(1, p_name);
				pst.setString(2, p_id);
				pst.setString(3, gender);
				pst.setString(4, b_year);
				pst.setString(5, b_month);
				pst.setString(6, b_day);
				pst.setString(7, blood_type);

				pst.executeUpdate();

				//把病人放入register
				query = "insert into test.register (no ,id, name, gender, b_year, b_month, b_day, blood_type) values (?,?,?,?,?,?,?,?)";

				pst = conn.prepareStatement(query);

				pst.setString(1, Integer.toString(count));
				pst.setString(2, p_id);
				pst.setString(3, p_name);
				pst.setString(4, gender);
				pst.setString(5, b_year);
				pst.setString(6, b_month);
				pst.setString(7, b_day);
				pst.setString(8, blood_type);

				pst.executeUpdate();
				
				out.println("<SCRIPT LANGUAGE='JavaScript'>");
				out.println("<!--");
				out.println("alert('掛號成功')");
				out.println("//-->");
				out.println("</SCRIPT>");
				
			} else {
				out.println("<SCRIPT LANGUAGE='JavaScript'>");
				out.println("<!--");
				out.println("alert('此人尚未建立資料')");
				out.println("//-->");
				out.println("</SCRIPT>");

			}

			response.setHeader("Refresh", "0;url=first_Time_reg.jsp");

		} else//已有紀錄的病人把allpatient的status改成未報到(1)
		{

			query = "select count(*) as count from test.register where name='" + p_name + "' and id='" + p_id
					+ "';";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();

			if (rs.getInt("count") == 0) //避免重複掛號
			{
				//把病人放入register
				query = "select * from test.allpatients where name='" + p_name + "' and id='" + p_id + "';";
				String sqlTemp = "insert into test.register (no ,id, name, gender, b_year, b_month, b_day, blood_type) values (?,?,?,?,?,?,?,?)";

				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				pst = conn.prepareStatement(sqlTemp);
				rs.next();
				pst.setString(1, Integer.toString(count));
				pst.setString(2, rs.getString("id"));
				pst.setString(3, rs.getString("name"));
				pst.setString(4, Integer.toString(rs.getInt("gender")));
				pst.setString(5, rs.getString("b_year"));
				pst.setString(6, rs.getString("b_month"));
				pst.setString(7, rs.getString("b_day"));
				pst.setString(8, Integer.toString(rs.getInt("blood_type")));

				pst.executeUpdate();
				
				out.println("<SCRIPT LANGUAGE='JavaScript'>");
				out.println("<!--");
				out.println("alert('掛號成功')");
				out.println("//-->");
				out.println("</SCRIPT>");

			} else {

				out.println("<SCRIPT LANGUAGE='JavaScript'>");
				out.println("<!--");
				out.println("alert('已經掛號過了')");
				out.println("//-->");
				out.println("</SCRIPT>");

			}

			response.setHeader("Refresh", "0;url=reg.jsp");
		}

		//0秒後將網頁轉跳到首頁 
	}
%>

