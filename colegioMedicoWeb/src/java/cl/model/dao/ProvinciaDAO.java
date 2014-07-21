/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.model.dao;

import cl.model.pojos.Provincia;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author Chyno
 */
public class ProvinciaDAO {

    public void insertProvincia(Provincia p) {
        SessionFactory sf = null;
        Session s = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            s = sf.openSession();
            t = s.beginTransaction();
            s.save(p);
            t.commit();
            s.close();
        } catch (HibernateException ex) {
            t.rollback();
            throw new RuntimeException("No se pudo grabar\n Mensage : " + ex.getMessage());
        }
    }

    public String selectProvincia(int id) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session s = sf.openSession();
        Provincia p = (Provincia) s.get(Provincia.class, id);
        s.close();
        if (p != null) {
            return "El id de provincia " + p.getIdprovincia() + " de nombre " + p.getNombre();
        } else {
            return "La Provincia de id " + id + " no existe!";
        }
    }

    public List<Provincia> getAllProvincia() {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session s = sf.openSession();
        Query query = s.createQuery("from Provincia");
        List<Provincia> lista = query.list();
        s.close();
        return lista;
    }
}
