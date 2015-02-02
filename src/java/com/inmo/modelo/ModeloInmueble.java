package com.inmo.modelo;

import com.inmo.hibernate.Inmueble;
import com.inmo.hibernate.Utiles;
import java.math.BigInteger;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author aitor
 */
public class ModeloInmueble {
    
    public static List<Inmueble> get(){
        Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Inmueble";
        Query q = session.createQuery(hql);
        List<Inmueble> inmuebles = q.list();
        session.getTransaction().commit();
        session.close();
        return inmuebles;
    }
    
     public static Inmueble get(String id){
        Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        /*String hql = "from Prueba where id="+id;
        Query q = session.createQuery(hql);
        Prueba prueba = (Prueba)q.list().get(0);*/
        Inmueble inmueble = (Inmueble) session.get(Inmueble.class,Integer.parseInt(id));
        session.getTransaction().commit();
        session.flush();
        session.close();
        return inmueble;
    }
    
    public static void delete(String id){
        Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Inmueble";
        Inmueble inmueble = (Inmueble) session.load(Inmueble.class,Integer.parseInt(id));
        session.delete(inmueble);
        session.getTransaction().commit();
        session.flush();//obliga a finalizar la operacion
        session.close();
    }
    
    public static int insert(Inmueble im){
        Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(im);
        //Long id=((BigInteger) session.createSQLQuery("SELECT LAST_INSERT_ID()").uniqueResult()).longValue();
        session.getTransaction().commit();
        session.flush();//obliga a finalizar la operacion
        session.close();
        return im.getIdInmbule();
    }
    
    public static void update(Inmueble im){
         Session session=Utiles.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(im);
        session.getTransaction().commit();
        session.flush();//obliga a finalizar la operacion
        session.close();
    }
}
