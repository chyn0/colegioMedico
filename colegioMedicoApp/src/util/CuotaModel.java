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
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Chyno
 */
public class CuotaModel {

    AbstractTableModel tableModel = null;
    Statement statement = null;
    ResultSet resultSet = null;
    Connection connection = null;
    String SQL = "";
    Object[][] data0;
    Object[][] dataFix;
    String[] column;
    private final boolean DEBUG = true;
    PreparedStatement preparedStatement = null;
    ArrayList<String> valor = new ArrayList<>();
    String BaseDeDatos = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url = "jdbc:sqlserver://localhost;databaseName=Colegio_Medico;user=sa;password=sa;";

    public CuotaModel() {
        try {
            Class.forName(BaseDeDatos);
            connection = DriverManager.getConnection(url);
        } catch (ClassNotFoundException | SQLException e) {
            if (DEBUG) {
                Logger.getLogger(MedicoModel.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

    public void generateCuota(String mes, String ano) {
        try {
            SQL = "exec generateCuota " + mes + "," + ano;
            preparedStatement = connection.prepareStatement(SQL);
            resultSet = preparedStatement.executeQuery();
            ResultSetMetaData rsmd = resultSet.getMetaData();
            resultSet.next();

            if (resultSet.getInt(1) == -1) {
                JOptionPane.showMessageDialog(new JFrame(), "PROBLEMA CON LA ENTRADA DE DATOS!", "ERROR", JOptionPane.ERROR_MESSAGE);
            } else if (resultSet.getInt(1) == -2) {
                JOptionPane.showMessageDialog(new JFrame(), "AÑO MENOR QUE EL ACTUAL!", "ERROR", JOptionPane.ERROR_MESSAGE);
            } else if (resultSet.getInt(1) == -3) {
                JOptionPane.showMessageDialog(new JFrame(), "ESTAS CUOTAS EXISTEN!", "ERROR", JOptionPane.ERROR_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(new JFrame(), "CUOTAS GENERADAS!", "SUCESS", JOptionPane.INFORMATION_MESSAGE);
            }

            if (DEBUG) {

                System.err.println(SQL);
            }
        } catch (SQLException ex) {
            if (DEBUG) {
                Logger.getLogger(MedicoModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
