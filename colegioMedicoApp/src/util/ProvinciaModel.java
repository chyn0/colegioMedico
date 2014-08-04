/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.TableModel;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Chyno
 */
public class ProvinciaModel {

    TableModel tableModel = null;
    Statement statement = null;
    ResultSet resultSet = null;
    Connection connection = null;
    String SQL = "";
    PreparedStatement preparedStatement = null;

    String BaseDeDatos = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url = "jdbc:sqlserver://localhost;databaseName=Colegio_Medico;user=sa;password=sa;";

    public ProvinciaModel() {
        try {
            Class.forName(BaseDeDatos);
            connection = DriverManager.getConnection(url);
        } catch (Exception e) {
        }
    }

    public void close() {
        try {
            resultSet.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void getAllProvincia() {
        try {
            SQL = "exec getAllProvincia";
            preparedStatement = connection.prepareStatement(SQL);
            resultSet = preparedStatement.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void getProvinciaByCondition(String condicion, Integer opt) {
        System.err.println(condicion);
        System.err.println(opt);
        try {
            if (opt == 1) {
                SQL = "exec dbo.getProvinciaById ";

            } else if (opt == 2) {
                SQL = "exec dbo.getProvinciaByNombre ";
            }
            SQL += condicion;
             System.err.println(SQL);
            preparedStatement = connection.prepareStatement(SQL);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public TableModel getTableModel() {
        tableModel = DbUtils.resultSetToTableModel(resultSet);

        return tableModel;

    }

}
