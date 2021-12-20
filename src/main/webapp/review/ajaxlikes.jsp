<%@page import="org.json.simple.JSONObject"%>
<%@page import="review.reviewDao"%>
<%@page import="review.reviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%   
String num=request.getParameter("num"); 

reviewDao dao=new reviewDao();
dao.updateLikes(num);

int likes=dao.getData(num).getLikes();

JSONObject ob=new JSONObject();
 
ob.put("likes", likes);
%>
<%=ob.toString()%>