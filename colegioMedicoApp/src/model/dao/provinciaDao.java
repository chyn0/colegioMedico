/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.pojos.Provincia;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 *
 * @author Chyno
 */
public class provinciaDao {

    SessionFactory sessionFactory;
    Session session;
    Configuration configuration = new Configuration();
    ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();

    public provinciaDao() {
        sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        session = sessionFactory.openSession();
    }

    public String saveProvincia(Provincia p) {
        try {
            session.beginTransaction();
            session.save(p);
            session.getTransaction().commit();
            session.close();
            return "Introducido!";
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }
      public String saveOrUpdateProvincia(Provincia p) {
        try {
            session.beginTransaction();
            session.saveOrUpdate(p);
            session.getTransaction().commit();
            session.close();
            return "Introducido!";
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }
  public String deleteProvincia(Provincia p) {
        try {
            session.beginTransaction();
            session.delete(p);
            session.getTransaction().commit();
            session.close();
            return "Borrado!";
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }
}
