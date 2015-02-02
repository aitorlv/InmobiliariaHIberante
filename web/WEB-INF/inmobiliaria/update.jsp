<%-- 
    Document   : update
    Created on : 31-ene-2015, 14:50:08
    Author     : aitor
--%>

<%@page import="com.inmo.hibernate.Inmueble"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
                    Inmueble obj=(Inmueble)request.getAttribute("datos");
                                       
          %>
        <header>
             <h1>Modificar inmueble</h1>
             <a class="enlaceInicio" href="control?target=inmueble&op=select&action=view">Ver datos de la tabla</a>
        </header>
        <form class="form-container" action="control" method="POST">
            <div class="form-title">Localidad</div>
            <input class="form-field" type="text" name="localidad" value="<%= obj.getLocalidad() %>">
            <div class="form-title">Direccion</div>
            <input class="form-field" type="text" name="direccion" value=" <%= obj.getDireccion() %> ">
            <div class="form-title">Tipo</div>
            <select class="form-field" name="tipo">
                <option value="Casa" <% if(obj.getTipo().compareTo("Casa")==0){ %> selected <% } %> >Casa</option>
                <option value="Piso" <% if(obj.getTipo().compareTo("Piso")==0){ %> selected <% } %> >Piso</option>
                <option value="Local" <% if(obj.getTipo().compareTo("Local")==0){ %> selected <% } %> >Local</option>
                <option value="Cochera" <% if(obj.getTipo().compareTo("Cochera")==0){ %> selected <% } %> >Cochera</option>
            </select>
           <div class="form-title">Precio</div>
            <input class="form-field" type="text" name="precio" value=" <%= obj.getPrecio() %> ">
            <input type="hidden" name="target" value="inmueble">
            <input type="hidden" name="op" value="update">
            <input type="hidden" name="action" value="op">
            <input type="hidden" name="id" value="<%= obj.getIdInmbule() %>">
            <input class="submit-button submit-container" type="submit" value="Modificar">
        </form>    </body>
</html>
