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
    </head>
    <body>
        <%
                    Inmueble obj=(Inmueble)request.getAttribute("datos");
                                       
          %>
<h1>Inserta inmueble</h1>
        <form action="control" method="POST">
            <label>Localidad</label>
            <input type="text" name="localidad" value="<%= obj.getLocalidad() %>">
            <label>Direccion</label>
            <input type="text" name="direccion" value=" <%= obj.getDireccion() %> ">
            <label>Tipo</label>
            <select name="tipo">
                <option value="Casa" <% if(obj.getTipo().compareTo("Casa")==0){ %> selected <% } %> >Casa</option>
                <option value="Piso" <% if(obj.getTipo().compareTo("Piso")==0){ %> selected <% } %> >Piso</option>
                <option value="Local" <% if(obj.getTipo().compareTo("Local")==0){ %> selected <% } %> >Local</option>
                <option value="Cochera" <% if(obj.getTipo().compareTo("Cochera")==0){ %> selected <% } %> >Cochera</option>
            </select>
            <label>Precio</label>
            <input type="text" name="precio" value=" <%= obj.getPrecio() %> ">
            <input type="hidden" name="target" value="inmueble">
            <input type="hidden" name="op" value="update">
            <input type="hidden" name="action" value="op">
            <input type="text" name="id" value="<%= obj.getIdInmbule() %>">
            <input type="submit" value="Modificar">
        </form>    </body>
</html>
