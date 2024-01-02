<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management System</title>
</head>
<body>
    ${requestScope.msg}<br/>
    <h2>Product Management System</h2>
    <form action="storeProduct" method="post">
        <label>PName</label>
        <input type="text" name="pname"><br/>
        <label>Price</label>
        <input type="number" name="price"><br/>
        <label>Image URL</label>
        <input type="url" name="url"><br/>
        <input type="submit" value="Store Product"/>
        <input type="reset" value="reset"/>
    </form>
    <hr/>
    <table border="1">
        <tr>
            <th>PId</th>
            <th>PName</th>
            <th>Price</th>
            <th>Image URL</th>
            <th>Feedback</th>
            <th>Delete Product</th>
        </tr>
        <%
            Object obj = session.getAttribute("products");
            List<Product> list = (List<Product>) obj;
            Iterator<Product> ii = list.iterator();
            while (ii.hasNext()) {
                Product p = ii.next();
        %>
        <tr>
            <td><%=p.getPid()%> </td>
            <td><%=p.getPname()%> </td>
            <td><%=p.getPrice()%> </td>
            <td><img src=<%=p.getUrl()%> width="100px" height="100px"/></td>
            <td>
                <form action="storeFeedback" method="post">
                    <input type="hidden" name="pid" value="<%=p.getPid()%>">
                    <textarea name="feedback" rows="3" cols="20" placeholder="Enter feedback"></textarea><br/>
                    <input type="submit" value="Submit Feedback"/>
                </form>
            </td>
            <td>
                <a href="deleteProduct?pid=<%=p.getPid()%>">
                    <img src="https://cdn-icons-png.flaticon.com/128/6861/6861362.png" 
                    width="50px" height="50px"/>
                </a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
