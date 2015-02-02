package com.inmo.modelo;

import com.inmo.hibernate.Imagen;
import com.inmo.hibernate.Utiles;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author aitor
 */
public class ModeloImagen {
    
    public static List<Imagen> get(){
        Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Imagen";
        Query q = session.createQuery(hql);
        List<Imagen> imagen = q.list();
        session.getTransaction().commit();
        session.close();
        return imagen;
    }
    
     public static Imagen get(String id){
        Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        /*String hql = "from Prueba where id="+id;
        Query q = session.createQuery(hql);
        Prueba prueba = (Prueba)q.list().get(0);*/
        Imagen inmueble = (Imagen) session.get(Imagen.class,Integer.parseInt(id));
        session.getTransaction().commit();
        session.flush();
        session.close();
        return inmueble;
    }
    
    public static void delete(String id){
        Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Imagen";
        Imagen imagen = (Imagen) session.load(Imagen.class,Integer.parseInt(id));
        session.delete(imagen);
        session.getTransaction().commit();
        session.flush();//obliga a finalizar la operacion
        session.close();
    }
    
    public static int insert(Imagen im){
        Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(im);
        session.getTransaction().commit();
        session.flush();//obliga a finalizar la operacion
        session.close();
        return im.getIdImagen();
    }
    
    public static void update(Imagen im){
         Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(im);
        session.getTransaction().commit();
        session.flush();//obliga a finalizar la operacion
        session.close();
    }
}
