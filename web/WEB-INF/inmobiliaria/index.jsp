<%-- 
    Document   : index
    Created on : 31-ene-2015, 10:05:37
    Author     : aitor
--%>

<%@page import="java.util.List"%>
<%@page import="com.inmo.hibernate.Inmueble"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/css.css" type="text/css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
             <h1>Inmobiliaria</h1>
            <a class="enlaceInicio" href="control?target=inmueble&op=insert&action=view">insertar inmueble</a>
        </header>
      
        <div class="tablaInmueble">
        <table>
            <tbody>
                <tr>
                    <td>Localidad</td>
                    <td>Direccion</td>
                    <td>Precio</td>
                    <td>Tipo</td>
                    <td>Usuario</td>
                </tr>
            
            
                <%
                    List<Inmueble> lista=(List<Inmueble>)request.getAttribute("datos");
                    for(Inmueble inmu :lista){                    
                %>
               
                      <tr>
                     
                      <td><%= inmu.getLocalidad() %></td>
                      <td><%= inmu.getDireccion() %></td>
                      <td><%= inmu.getPrecio() %></td>
                      <td><%= inmu.getTipo() %></td>
                      <td><%= inmu.getUsuario() %></td>
                      <td><a href="control?target=inmueble&op=delete&action=op&id=<%= inmu.getIdInmbule()%> ">Borrar</a></td>
                      <td><a href="control?target=inmueble&op=update&action=view&id=<%= inmu.getIdInmbule() %>">Editar</a></td>
                      <td><a href="control?target=imagen&op=select&action=view&id=<%= inmu.getIdInmbule() %>">Ver fotos</a></td>
                      </tr>
                    
                 <%
                    }
                 %>
               
            </tbody>
          
        </table>
      </div>
    </body>
</html>

