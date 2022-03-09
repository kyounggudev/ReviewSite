<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%					
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('이미 존재하는 키입니다!')");
script.println("history.back()");
script.println("</script>");
%>