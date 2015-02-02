<%-- 
    Document   : insert
    Created on : 02-feb-2015, 0:14:23
    Author     : aitor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="control" method="post" enctype="multipart/form-data">
        <label>Imagen</label>
        <input type="file" name="imagen">
        <input type="hidden" name="target" value="imagen">
        <input type="hidden" name="op" value="insert">
        <input type="hidden" name="action" value="op">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
         <input type="submit" value="Insertar">
        </form>
    </body>
</html>
