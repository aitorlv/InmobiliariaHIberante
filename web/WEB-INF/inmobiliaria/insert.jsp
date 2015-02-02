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
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
             <h1>Inserta inmueble</h1>
             <a class="enlaceInicio" href="control?target=inmueble&op=select&action=view">Ver datos de la tabla</a>
        </header>
        <form class="form-container" action="control" method="POST" enctype="multipart/form-data">
            <div class="form-title">Localidad</div>
            <input class="form-field" type="text" name="localidad" value="">
          <div class="form-title">Direccion</div>
            <input class="form-field" type="text" name="direccion" value="">
            <div class="form-title">Tipo</div>
            <select class="form-field" name="tipo">
                <option value="casa">Casa</option>
                <option value="piso">Piso</option>
                <option value="local">Local</option>
                <option value="cochera">Cochera</option>
            </select>
            <label>Precio</label>
            <input class="form-field" type="text" name="precio" value="">
            <label>Iamgen</label>
            <input class="form-field" type="file" name="imagen" value="">
            <input type="hidden" name="target" value="inmueble">
            <input type="hidden" name="op" value="insert">
            <input type="hidden" name="action" value="op">
            <input class="submit-button submit-container" type="submit" value="Insertar">
        </form>
    </body>
</html>
