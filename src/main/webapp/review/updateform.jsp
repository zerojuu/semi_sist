<%@page import="review.reviewDto"%>
<%@page import="review.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Update Form</title>
</head>
<%         
String num=request.getParameter("num");

reviewDao dao=new reviewDao();
reviewDto dto=dao.getData(num);
%>

<body>
<form action="review/updateaction.jsp" class="form-inline" method="post">
 
<!-- hidden 처리 -->
<input type="hidden" name="num" value="<%=num%>">
 
  <table class="table table-bordered" style="width: 600px; margin-left: 50px; margin-top: 50px;">
  
<!-- 제목,내용 수정 -->
  <tr> 
    <th width="100"><span class="glyphicon glyphicon-list" style="margin-left: 30px; margin-top: 10px;"></span></th>
    <td>
      <input type="text" class="form-control" required="required" name="subject" 
        style="width: 300px;" value="<%=dto.getSubject()%>">
    </td>
  </tr>
  
  <tr>
    <th width="100"><span class="glyphicon glyphicon-pencil" style="margin-left: 30px; margin-top: 130px;"></span></th>
    <td>
      <textarea style="width: 400px; height: 300px;" class="form-control" name="content" required="required"><%=dto.getContent() %></textarea>
    </td> 
    
  </tr>
  
  <tr>
  <td colspan="2" align="center">
    <button type="submit" class="btn btn-default">수정</button>
  </td>
  </tr>
  </table>
</form>
</body>
</html>