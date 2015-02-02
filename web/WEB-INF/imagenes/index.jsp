<%-- 
    Document   : index
    Created on : 01-feb-2015, 23:20:17
    Author     : aitor
--%>

<%@page import="com.inmo.hibernate.Imagen"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       <table>
            <thead>
            </thead>
            <tbody>
                <%
                    int id=Integer.parseInt(request.getParameter("id"));
                    List<Imagen> lista= (List) request.getAttribute("datos");
                    for(Imagen imag :lista){  
                        
                        
                %>
               
                      <tr>
                     
                      <td><img src="<%= imag.getRuta() %>" width="100" height="100"></td>
                      <td><a href="control?target=imagen&op=delete&action=op&id=<%= imag.getIdImagen() %> ">Borrar</a></td>
                      <td><a href="control?target=inmueble&op=select&action=view">Ver Inmuebles</a></td>
                      </tr>
                    
                 <%
                    }
                 %>
                <h2><a href="control?target=imagen&op=insert&action=view&id=<%= id %> ">insertar foto</a></h2>
            </tbody>
        </table>
    </body>
</html>
