<%-- 
    Document   : register.jsp
    Created on : Jul. 3, 2021, 2:47:57 a.m.
    Author     : kmiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            #RegFrom_cntnr{
                margin: 0 auto;
                width: 500px;
            }
            #btn{
                margin: 0 auto;
                width:5rem;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <div id='RegFrom_cntnr'>
        <form action="RegisterServlet" method="post">
            <label for="id2Reg">ID</label>
            <input id="id2Reg" type="text" name="id2Reg"/>
            <br>
            <label for="pass2Reg">Password</label>
            <input id="pass2Reg" type="text" name="pass2Reg"/>
            <br>
            <label for="f2Reg">First Name</label>
            <input id="f2Reg" type="text" name="f2Reg"/>
            <br>
            <label for="l2Reg">Last Name</label>
            <input id="l2Reg" type="text" name="l2Reg"/>
            <br>
            <input id="btn" type="submit" value="Register"/>
        </form>
         <% String color = "";
            if(request.getAttribute("message")!= null){
         %>
         <b stye color="<%=color%>"><%=request.getAttribute("message")%></b>
             <%}%>
        </div>
    </body>
</html>
