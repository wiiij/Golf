<%@page import="DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	
	
	
	String sql = "select substr(c.resist_month,1,4) || '년' || substr(c.resist_month,5,2) || '월' resist_month, c.c_no, m.c_name, t.class_name, c.class_area, to_char(c.tuition, 'L999,999') tuition, m.grade from TBL_CLASS_202201 c, TBL_MEMBER_202201 m, TBL_TEACHER_202201 t where c.c_no = m.c_no and c.teacher_code = t.teacher_code";
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css?ver=9">
</head>
<body>
<header>
<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<section class="section">
	<br> <h2 align="center">회원정보조회</h2> <br>
	<table class="table_line">
		<tr>
			 <th>강사월</th> 
			<th>회원번호</th>
			<th>회원명</th>
			<th>강의명</th>
			<th>강의장소</th>
			<th>수강료</th>
			<th>등급</th>
		</tr>
		<%while(rs.next()) {%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getString(5) %></td>
				<td><%= rs.getString(6) %></td>
				<td><%= rs.getString(7) %></td>
			</tr>
		<% } %>
	</table>
</section>
<footer>
<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>