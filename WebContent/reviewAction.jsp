<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import = "java.net.URLEncoder" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<jsp:useBean id="review" class="review.Review" scope="page" />
<jsp:setProperty name="review" property="reviewContent" />
<jsp:setProperty name="review" property="reviewRec" />
<%
	System.out.println(review);
%>
<script type = "text/javascript">
</script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게임 커뮤니티</title>
</head>
<body>
	<%
		
		String gameID= request.getParameter("id");
		System.out.println(gameID);
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if ( review.getReviewContent() == null||review.getReviewRec()==null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				ReviewDAO ReviewDAO = new ReviewDAO();

				int result = ReviewDAO.write(userID, gameID, review.getReviewContent(),review.getReviewRec());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('리뷰 작성에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					Cookie recentID = new Cookie("recent_ID", URLEncoder.encode(request.getParameter("id"),"utf-8"));
					recentID.setMaxAge(24*60*60);
					response.addCookie(recentID);

					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('리뷰 작성에 성공했습니다')");
					script.print("location.href='main.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>
