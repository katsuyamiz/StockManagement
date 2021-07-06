<%-- 
    Document   : edit
    Created on : Jul. 5, 2021, 8:37:50 p.m.
    Author     : kmiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="api.Products"%>
<!DOCTYPE html>
<%
    String prodId;
    String prodName;
    String prodBrand;
    String prodPrice;
    if(request.getAttribute("products") != null){
    Products products = (Products)request.getAttribute("products");
    prodId = products.getID();
    prodName = products.getName();
    prodBrand = products.getBrand(); 
    prodPrice = products.getPrice();
//    prodId = Products.getID();
//    prodName = Products.getName();
//    prodBrand = Products.getBrand(); 
//    prodPrice = Products.getPrice();
    }else{
    prodId = request.getParameter("id2Edit");
    prodName = request.getParameter("name2Edit");
    prodBrand = request.getParameter("brand2Edit");
    prodPrice = request.getParameter("price2Edit");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit data</title>
    </head>
    <body>
        <h1>Edit</h1>
             <div id="form_u_cntnr">
            <form action="UpdateServlet"  method="post">
            <p>ID: <%=prodId%></p>
            <input type="text" name="id2Edit2" hidden ="hidden" value="<%=prodId%>"/>
            <label for="prodName">Name</label>
            <input id="prodName" name="name2Edit2" type="text" required="required" value="<%=prodName%>"/>
            <label for="prodBrand">Brand</label>
            <input id="prodBrand" name="brand2Edit2" type="text" value="<%=prodBrand%>"/>
            <label for="prodPrice">Price</label>
            <input id="prodPrice" name="price2Edit2" type="text" value="<%=prodPrice%>"/>
            <input class="btn" id="btnC"type="submit" value="Update" onclick="return confirm('Are you update?')"/>
            </form>
            <%=request.getAttribute("products")%>
        </div>
              <% String msg = "";
               String color = "";
                if(request.getAttribute("message") != null){
                        msg = "Error";
                        color = "red";
                }%>
                <b style="color:<%=color%>"><%=msg%></b>
        
    </body>
</html>
