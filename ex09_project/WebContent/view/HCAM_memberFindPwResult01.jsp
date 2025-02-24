<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="dao.MemberDAO" id="memberDao"></jsp:useBean>
<%
	String kubun = request.getParameter("kubun");
	String id = request.getParameter("id");
	String email = request.getParameter("email");

	boolean result = memberDao.pwResult(id, email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<title>Insert title here</title>
<style>
	div {
		margin: 110px auto;
		width: 440px;
		/* color: #6799FF; */
		font-size: 16px;
		text-align: center;
	}
	input {
		margin: 20px auto;
		width: 60px;
		height: 30px;
		border: none;
		border-radius: 5px;
		background-color: var(--color-blue);
		color: var(--color-white);
		cursor: pointer;
	}
	svg {
		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<% if(result) { 
		RequestDispatcher dispatcher = request.getRequestDispatcher("HCAM_memberFindPwResult02.jsp?kubun=" + kubun);
		dispatcher.forward(request, response);
	%>
	<% } else { %>
		<!-- <script>self.close(); </script> -->
		<div>
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16" color="red">
			<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
			<path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
			</svg><br>
			회원정보가 존재하지 않습니다.<br>
			<input type="button" value="확인" onClick="window.close()">
		<div>
	<% } %>
	
	<%
		memberDao.dbClose();
	%>
</body>
</html>