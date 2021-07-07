<%-- 
    Document   : index.jsp
    Created on : Jul. 1, 2021, 7:26:30 p.m.
    Author     : kmiz
--%>

<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" import="api.User,api.Products,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            *, html{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            #u_name{
                margin-bottom: 1rem ;
            }
            #form_i_cntnr{
                padding: 1rem;
            }
            input{
                padding: 1rem 0.5rem;
            }
            #tbl_cntnr{
                width: 100%;
            }
            table{
                 margin: 0 auto;
            }
            label{
                font-style: italic;
                font-weight: bold;
            }
            #tbc{
                padding: 0.5rem 4rem;
            }
            #tb{
                padding: 1rem 4rem;
                border:1px black solid;
            }
            .btn{
                padding: 1rem 2rem;
                font-size: 1rem;
            }
            #btnC{
                background-color: buttonhighlight;
                background-color: lightblue;
            }
            #btnU{
                background-color: buttonhighlight;
                background-color: lightgreen;
            }
            #btnD{
                background-color: buttonhighlight;
                background-color: lightcoral;
            }
            #btnLO{
                position: absolute;
                right: 2rem;
                font-size: 1rem;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
<!--        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>-->
    </head>
    <body>
           <%
            if(session.getAttribute("user") == null){
                response.sendRedirect("login.jsp");
               }else{
               User user = (User)session.getAttribute("user");%>
         <div id="u_name">    
        <b><i>Hello, <%=user.getName()%></i></b>
        <%}%>
        <input id="btnLO" type="submit" value="Logout"/>
        </div>
        
        <%
            String nameDef = "";
            String brandDef ="";
            String priceDef ="";
            if(request.getAttribute("products")!= null){
            Products products = (Products)request.getAttribute("products");
            nameDef = products.getName();
            brandDef = products.getBrand();
            priceDef = products.getPrice();
            }
        %>
            


        
        
        <div id="form_i_cntnr">
            <form action="InsertServlet" method="post">
            <label for="prodName">Name</label>
            <input id="prodName" name="prodName" type="text" placeholder="Name of the product" value="<%=nameDef%>"/>
            <label for="prodBrand">Brand</label>
            <input id="prodBrand" name="prodBrand" type="text" placeholder="Brand name" value="<%=brandDef%>"/>
            <label for="prodPrice">Quantity</label>
            <input id="prodPrice" name="prodPrice" type="text" placeholder="Quantity" value="<%=priceDef%>"/>
            <input class="btn" id="btnC"type="submit" value="Register"/>
            </form>
        </div>
    <div id="tbl_cntnr">    
    <table>    
    <tr>
        <td id="tbc"><b><i>ID</i></b></td>
        <td id="tbc"><b><i>NAME</i></b></td>
        <td id="tbc"><b><i>BRAND</i></b></td>
        <td id="tbc"><b><i>Quantity</i></b></td>
    </tr>
        <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8889/dbs","kmiz","12345");
            String sql = "SELECT * FROM products";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while(result.next()){
            %>
    <tr>
        <td id="tb"><%=result.getInt("prodId")%></td>
        <td id="tb"><%=result.getString("prodName")%></td>
        <td id="tb"><%=result.getString("prodBrand")%></td>
        <td id="tb"><%=result.getInt("prodPrice")%></td>
        <td><form action="edit.jsp" method="post">
                <input name="id2Edit" type="text" hidden=hidden" value="<%=result.getInt("prodId")%>"/>
                <input name="name2Edit" type="text" hidden=hidden" value="<%=result.getString("prodName")%>"/>
                <input name="brand2Edit" hidden=hidden" value="<%=result.getString("prodBrand")%>"/>
                <input name="price2Edit" hidden=hidden" value="<%=result.getInt("prodPrice")%>"/>
                <input class="btn" id="btnU" type="submit" value="Edit"/>
            </form></td>
            
        <td><form action="DeleteServlet" method="post">
                <input name="id2Delete" type="text" hidden=hidden" value="<%=result.getInt("prodId")%>"/>
                <input class="btn" id="btnD" type="submit" value="Delete" onclick="return confirm('Are you sure to delete -ID: <%=result.getInt("prodId")%>?')"/>
            </form>
        </td>    
    </tr><%
            }
            conn.close();
            }catch(Exception e){
            e.printStackTrace();
            }
            %>
    </table> 
    </div>
            <% String msg = "";
               String color = "";
                if(request.getAttribute("message") == null){
                ;
               }else{
                    if(request.getAttribute("message") == "Inserted"){
                        color = "blue";
                    }
                    if(request.getAttribute("message") == "Updated"){
                        color = "green";
                    }                    
                    if(request.getAttribute("message") == "Error"){
                        color = "red";
                    }%>
                
                <b style="color:<%=color%>"><%=request.getAttribute("message")%></b>
                <%}%>
    </body>
    
<!--    <script type="text/javascript">
 
    $(document).ready(function() {
        $("#loginForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
         
                password: "required",
            },
             
            messages: {
                email: {
                    required: "Please enter email",
                    email: "Please enter a valid email address"
                },
                 
                password: "Please enter password"
            }
        });
 
    });
</script>-->
</html>

