<%-- 
    Document   : login
    Created on : Jul. 2, 2021, 2:05:19 p.m.
    Author     : kmiz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>

        <form action="LoginServlet" method="post">
        <label for="loginID"> Login ID: </label>
        <input id="loginID" name="loginID" type="text" placeholder="ID"/>
        <br>
        <label for="loginPass">Password: </label>
        <input id="loginPass" name="loginPass" type="text" placeholder="Password"/>
        <br>
        <input type="submit" value="Login"/>
        </form>
        <%
         String color = "";
         if(request.getAttribute("message")!=null){
            if(request.getAttribute("message") == "Registered"){
                color = "green";
            }
            if(request.getAttribute("message") == "Invalid ID or password"){
                color = "red";
            }
        %>
        <b style="color: <%=color%>"><%=request.getAttribute("message")%></b>
        <%}%>
        <br>
        <a href="register.jsp">Register Here</a>
    </body>
</html>
