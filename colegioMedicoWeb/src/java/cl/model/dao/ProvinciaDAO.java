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

    Session session = null;

    public ProvinciaDAO() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public List<Provincia> getAllProvincia() {

        List<Provincia> lista = null;
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery(" from Provincia ");
            lista = (List<Provincia>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;

    }
}
