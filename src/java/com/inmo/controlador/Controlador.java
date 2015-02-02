/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.inmo.controlador;

import com.inmo.hibernate.Imagen;
import com.inmo.hibernate.Inmueble;
import com.inmo.modelo.ModeloImagen;
import com.inmo.modelo.ModeloInmueble;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author aitor
 */
@WebServlet(name = "Controlador", urlPatterns = {"/control"})
@MultipartConfig
public class Controlador extends HttpServlet {

    boolean error;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //acciones e los controladores.
        //1º recibir datos para decidir getParameter()
        //2º decide quien sabe o de be responder en funcion de losd atos recibidos 
        //3º genra informacio para el que sepa responder setAttribute().
        //4ºdecidir como transferir el control
        //5º transferir el control, dos formas redireccion o forward dispatch.
        //redireccion->en caso de hacer una modificacion.
        //do:insert,delete,update,select.
        //target tabla
        //action: view do.
        //view:vista.
        String destino="index.html";
        boolean forward=true;
        String target,op,action,view;
        
        target=request.getParameter("target");
        op=request.getParameter("op");
        action=request.getParameter("action");
        //view=request.getParameter("view");
        
        switch(target){
            case "inmueble":
            if(target.equals("inmueble") && op.equals("select") && action.equals("view")){          
                forward=true;
                destino="WEB-INF/inmobiliaria/index.jsp";
                request.setAttribute("datos", ModeloInmueble.get());
            }else if(target.equals("inmueble") && op.equals("delete") && action.equals("op")){
                forward=false;
                ModeloInmueble.delete(request.getParameter("id"));
                destino="control?target=inmueble&op=select&action=view";
            }else if(target.equals("inmueble") && op.equals("insert") && action.equals("view")){
                forward=true;
                destino="WEB-INF/inmobiliaria/insert.jsp";
            }else if(target.equals("inmueble") && op.equals("insert") && action.equals("op")){
                forward=false;
                Inmueble inmu=new Inmueble();
                Imagen img=new Imagen();
                inmu.setLocalidad(request.getParameter("localidad"));
                inmu.setDireccion(request.getParameter("direccion"));
                inmu.setPrecio(request.getParameter("precio"));
                inmu.setTipo(request.getParameter("tipo"));
                int identificador=ModeloInmueble.insert(inmu);
                Part filePart = request.getPart("imagen"); // Retrieves <input type="file" name="file">
                String fileName = getFileName(filePart);
                InputStream fileContent = filePart.getInputStream();
                String ruta = getServletContext().getRealPath("/") + "subido/";
                guardarImagen(fileContent, fileName, ruta);
                img.setInmueble(ModeloInmueble.get(identificador+""));
                img.setRuta("subido/"+fileName);
                ModeloImagen.insert(img);
                destino="control?target=inmueble&op=select&action=view";
            }else if(target.equals("inmueble") && op.equals("update") && action.equals("view")){
                forward=true;
                request.setAttribute("datos", ModeloInmueble.get(request.getParameter("id")));
                destino="WEB-INF/inmobiliaria/update.jsp";
            }else if(target.equals("inmueble") && op.equals("update") && action.equals("op")){
                forward=false;
                Inmueble inmu=new Inmueble();
                inmu.setLocalidad(request.getParameter("localidad"));
                inmu.setDireccion(request.getParameter("direccion"));
                inmu.setPrecio(request.getParameter("precio"));
                inmu.setTipo(request.getParameter("tipo"));
                inmu.setIdInmbule(Integer.parseInt(request.getParameter("id")));
                ModeloInmueble.update(inmu);
                destino="control?target=inmueble&op=select&action=view";
            }
            break;
            case "imagen":
            
                if(target.equals("imagen") && op.equals("select") && action.equals("view")){          
                forward=true;
                destino="WEB-INF/imagenes/index.jsp";
                request.setAttribute("datos", ModeloImagen.get());
                }else if(target.equals("imagen") && op.equals("delete") && action.equals("op")){
                forward=false;
                ModeloImagen.delete(request.getParameter("id"));
                destino="control?target=imagen&op=select&action=view";
                }else if(target.equals("imagen") && op.equals("insert") && action.equals("view")){
                forward=true;
                destino="WEB-INF/imagenes/insert.jsp";
                }else if(target.equals("imagen") && op.equals("insert") && action.equals("op")){
                Part filePart = request.getPart("imagen"); // Retrieves <input type="file" name="file">
                String fileName = getFileName(filePart);
                InputStream fileContent = filePart.getInputStream();
                String ruta = getServletContext().getRealPath("/") + "subido/";
                guardarImagen(fileContent, fileName, ruta);
                Imagen img=new Imagen();
                img.setInmueble(ModeloInmueble.get( request.getParameter("id")));
                img.setRuta("subido/"+fileName);
                ModeloImagen.insert(img);
                destino="control?target=imagen&op=select&action=view";
                }
            break;
            
            
        }
        
        
        
        //trasferencia
        if(forward){
            request.getRequestDispatcher(destino).forward(request, response);
        }else{
            response.sendRedirect(destino);
        }
    }
    
    private void guardarImagen(InputStream fileContent, String fileName, String ruta){
        try {
            //destino = "C:\\Users\\2dam\\Desktop\\";
            BufferedImage img = ImageIO.read(fileContent);
            if(fileName.endsWith("png"))
                ImageIO.write(img, "png", new File(ruta + fileName));
            else if (fileName.endsWith("jpg"))
                ImageIO.write(img, "jpg", new File (ruta + fileName));
        } catch (Exception ex) {
            error = true;
        }
    }

    private static String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
