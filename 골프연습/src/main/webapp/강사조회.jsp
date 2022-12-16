<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%

   String sql = "select TEACHER_CODE,TEACHER_NAME,CLASS_NAME,to_char(CLASS_PRICE,'FM990,999')as C,to_char(TEACH_RESIST_DATE,'yyyy\"년\"mm\"월\"dd\"일\')as T from TBL_TEACHER_202201";

   Connection conn = DBConnect.getConnection();
   PreparedStatement pstmt = conn.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery();
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css?ver=8">
</head>
<body>
<header>
<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
<br><a></a><h2 style="text-align: center;">강사조회</h2> <br>
	<table class = table_line>
<tr>
	<th>강사코드</th>
	<th>강사명</th>
	<th>강의명</th>
	<th>수강료</th>
	<th>강사자격취득일</th>
</tr>
<%while(rs.next()){ %>
<tr>
	<td><%=rs.getString("TEACHER_CODE") %></td>
	<td><%=rs.getString("TEACHER_NAME") %></td>
	<td><%=rs.getString("CLASS_NAME") %></td>
	<td><%=rs.getString("C") %></td>
	<td><%=rs.getString("T") %></td>
</tr>
	<%} %>
	</table>
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>