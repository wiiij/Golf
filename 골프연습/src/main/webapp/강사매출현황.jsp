<%@page import="java.sql.*"%>
<%@page import="DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
    String sql = "select T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME, to_char(sum(C.TUITION), 'L999,999')TUITION from TBL_TEACHER_202201 T,TBL_CLASS_202201 C where T.TEACHER_CODE=C.TEACHER_CODE group by T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME,C.TUITION order by T.TEACHER_CODE";
    
    
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
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>
<section class = "section">
<br> <h2 align="center">강사매출현황</h2> <br>
<table class = "table_line">
<tr>
<th>강사코드</th>
<th>강사코드</th>
<th>강사명</th>
<th>총매출</th>
</tr>
	<% while(rs.next()) { %>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
</tr>
	<% } %>	
</table>
</section>
<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>