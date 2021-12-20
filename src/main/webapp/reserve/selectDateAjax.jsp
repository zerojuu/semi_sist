<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.eclipse.jdt.internal.compiler.env.IGenericField"%>
<%@page import="org.eclipse.jdt.internal.compiler.codegen.Opcodes"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="showing.ShowingDto"%>
<%@page import="showing.ShowingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일 HH시 mm분");

String movie_num =  request.getParameter("movie_num");
String theater_num = request.getParameter("theater_num");

ShowingDao show_dao = new ShowingDao();
ArrayList<ShowingDto> tmp_list = show_dao.getAllDatas();

JSONObject ob = new JSONObject();
JSONArray list = new JSONArray();

String tmp = "";
for (ShowingDto i : tmp_list) {
	if (movie_num.equals(i.getMovie_num()) && theater_num.equals(i.getTheater_num())) {
		ob = new JSONObject();
		ob.put("show_date", sdf.format(i.getShowing_date()));
		list.add(ob);
	}
}
%>

<%= list.toString() %>
