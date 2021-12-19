<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User, model.Mutter, java.util.List" %>
<%
// セッションスコープに保存されたユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
//　アプリケーションスコープに保存されたつぶやきリストを取得
List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");
//リクエストスコープに保存されたエラーメッセージを取得
String errorMsg = (String) request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tweet</title>
</head>
<body>
<h1>Tweetメイン</h1>
<p>
<%= loginUser.getName() %>さん、ログイン中
<a href="/tweet/Logout">ログアウト</a>
</p>
<p><a href="/tweet/Main">更新</a></p>
<form action="/tweet/Main" method="post">
<input type="submit" value="つぶやく">
</form>
<% if(errorMsg != null) { %>
<p><%= errorMsg %></p>
<% } %>
<% for(Mutter mutter : mutterList) { %>
<p><%= mutter.getUserName() %>:<%= mutter.getText() %></p>
<% } %>
</body>
</html>