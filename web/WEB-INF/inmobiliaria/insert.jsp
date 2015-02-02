<%-- 
    Document   : insert
    Created on : 31-ene-2015, 14:49:58
    Author     : aitor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Inserta inmueble</h1>
        <form action="control" method="POST" enctype="multipart/form-data">
            <label>Localidad</label>
            <input type="text" name="localidad" value="">
            <label>Direccion</label>
            <input type="text" name="direccion" value="">
            <label>Tipo</label>
            <select name="tipo">
                <option value="casa">Casa</option>
                <option value="piso">Piso</option>
                <option value="local">Local</option>
                <option value="cochera">Cochera</option>
            </select>
            <label>Precio</label>
            <input type="text" name="precio" value="">
            <label>Imagen</label>
            <input type="file" name="imagen" value="">
            <input type="hidden" name="target" value="inmueble">
            <input type="hidden" name="op" value="insert">
            <input type="hidden" name="action" value="op">
            <input type="submit" value="Insertar">
        </form>
    </body>
</html>
