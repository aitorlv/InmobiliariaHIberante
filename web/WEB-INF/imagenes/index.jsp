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
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            int id=Integer.parseInt(request.getParameter("id"));
        %>
        <header>
             <h1>Modificar inmueble</h1>
             <a class="enlaceInicio" href="control?target=inmueble&op=select&action=view">Ver inmuebles</a>
             <a class="enlaceInicio" href="control?target=imagen&op=insert&action=view&id=<%= id %> ">Insertar foto</a></h2>
        </header>
        <div class="tablaInmueble">
       <table>
            <tbody>
                <tr>
                    <td>Imagen</td>
                </tr>
                <%
                    
                    List<Imagen> lista= (List) request.getAttribute("datos");
                    for(Imagen imag :lista){  
                        
                        
                %>
               
                      <tr>
                     
                      <td><img src="<%= imag.getRuta() %>" width="100" height="100"></td>
                      <td><a href="control?target=imagen&op=delete&action=op&id=<%= imag.getIdImagen() %>&idinmueble=<%= id %> ">Borrar</a></td>
                  
                      </tr>
                    
                 <%
                    }
                 %>
                
            </tbody>
        </table>
            </div>
    </body>
</html>
