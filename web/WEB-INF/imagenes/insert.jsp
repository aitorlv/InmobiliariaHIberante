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
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
             <h1>Modificar inmueble</h1>
             <a class="enlaceInicio" href="control?target=inmueble&op=select&action=view">Ver inmuebles</a>
        </header>
        <form class="form-container" action="control" method="post" enctype="multipart/form-data">
            <div class="form-title">Imagen</div>
            <input class="form-field" type="file" name="imagen">
        <input type="hidden" name="target" value="imagen">
        <input type="hidden" name="op" value="insert">
        <input type="hidden" name="action" value="op">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <input class="submit-button submit-container" type="submit" value="Insertar">
        </form>
    </body>
</html>
