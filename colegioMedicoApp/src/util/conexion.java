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
import javax.swing.JTable;
import javax.swing.table.TableColumn;
import javax.swing.table.TableModel;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Chyno
 */
public class conexion {

    TableModel tableModel = null;
    Statement statement = null;
    ResultSet resultSet = null;
    Connection connection = null;
    String SQL = "";
    PreparedStatement preparedStatement = null;

    public conexion() {

    }

    public TableModel prueba() {
        try {
            String BaseDeDatos = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

            Class.forName(BaseDeDatos);

            String url = "jdbc:sqlserver://localhost;databaseName=Colegio_Medico;user=sa;password=sa;";
            connection = DriverManager.getConnection(url);
            SQL = "exec getAllProvincia";
            preparedStatement = connection.prepareStatement(SQL);
            resultSet = preparedStatement.executeQuery();
            tableModel = DbUtils.resultSetToTableModel(resultSet);
    
  
            resultSet.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tableModel;
    }

}
