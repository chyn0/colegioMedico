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
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Chyno
 */
public class ProvinciaModel {

    AbstractTableModel tableModel = null;
    Statement statement = null;
    ResultSet resultSet = null;
    Connection connection = null;
    String SQL = "";
    Object[][] data0;
    Object[][] dataFix;
    String[] column;
    private final boolean DEBUG = false;
    PreparedStatement preparedStatement = null;
    ArrayList<String> valor = new ArrayList<>();
    String BaseDeDatos = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url = "jdbc:sqlserver://localhost;databaseName=Colegio_Medico;user=sa;password=sa;";

    public ProvinciaModel() {
        try {
            Class.forName(BaseDeDatos);
            connection = DriverManager.getConnection(url);
        } catch (ClassNotFoundException | SQLException e) {
            if (DEBUG) {
                Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

    public void close() {
        try {
            resultSet.close();
            connection.close();
        } catch (SQLException ex) {
            if (DEBUG) {
                Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void getAllProvincia() {
        try {
            SQL = "exec getAllProvincia";
            preparedStatement = connection.prepareStatement(SQL);
            resultSet = preparedStatement.executeQuery();

        } catch (SQLException ex) {
            if (DEBUG) {
                Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void getProvinciaByCondition(String condicion, Integer opt) {
        if (DEBUG) {
            System.err.println(condicion);
            System.err.println(opt);
        }

        try {
            if (opt == 1) {
                SQL = "exec dbo.getProvinciaById ";

            } else if (opt == 2) {
                SQL = "exec dbo.getProvinciaByNombre ";
            }
            SQL += condicion;
            if (DEBUG) {
                System.err.println(SQL);
            }

            preparedStatement = connection.prepareStatement(SQL);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException ex) {
            if (DEBUG) {
                Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void setUpdateProvincia(String nombre, String id) {
        try {

            SQL = "exec dbo.updateProvincia " + id + ",'" + nombre + "'";

            if (DEBUG) {
                System.err.println(SQL);
            }
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.executeQuery();
        } catch (SQLException ex) {
            if (DEBUG) {
                Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    
      public void setProvincia(String nombre) {
        try {

            SQL = "exec dbo.setProvincia '" + nombre + "'";

            if (DEBUG) {
                System.err.println(SQL);
            }
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.executeQuery();
        } catch (SQLException ex) {
            if (DEBUG) {
                Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }
    
    
    public String getUpdateProvincia(String id) {
        String nombre = "";
        try {

            SQL = "exec dbo.getProvinciaById " + id;

            if (DEBUG) {
                System.err.println(SQL);
            }
            preparedStatement = connection.prepareStatement(SQL);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                nombre = resultSet.getObject(2).toString();
                nombre += "|";
                nombre += resultSet.getObject(3).toString();

            }

        } catch (SQLException ex) {
            if (DEBUG) {
                Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return nombre;
    }

    public AbstractTableModel getTableModel() {

        try {
            ResultSetMetaData rsmd = resultSet.getMetaData();
            int col = rsmd.getColumnCount();

            int rows = 1000;
            int i = 0;

            data0 = new Object[rows][col];
            column = new String[col];
            while (resultSet.next()) {

                for (int j = 1; j <= col; j++) {
                    column[j - 1] = rsmd.getColumnName(j);
                    if (j == 1 && "bit".equals(rsmd.getColumnTypeName(j))) {
                        data0[i][j - 1] = (Boolean) resultSet.getObject(j);
                    } else {
                        data0[i][j - 1] = resultSet.getObject(j);
                    }

                }

                i++;
            }
            dataFix = new Object[i][col];
            for (int k = 0; k < dataFix.length; k++) {
                System.arraycopy(data0[k], 0, dataFix[k], 0, dataFix[k].length);
            }
            tableModel = new MyTableModel();

        } catch (SQLException ex) {
            if (DEBUG) {
                Logger.getLogger(ProvinciaModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return tableModel;
    }

    class MyTableModel extends AbstractTableModel {

        private final String[] columnNames = column;
        private final Object[][] data = dataFix;

        @Override
        public int getColumnCount() {
            return columnNames.length;
        }

        @Override
        public int getRowCount() {
            return data.length;
        }

        @Override
        public String getColumnName(int col) {
            return columnNames[col];
        }

        @Override
        public Object getValueAt(int row, int col) {
            return data[row][col];
        }

        /*
         * JTable uses this method to determine the default renderer/
         * editor for each cell.  If we didn't implement this method,
         * then the last column would contain text ("true"/"false"),
         * rather than a check box.
         */
        @Override
        public Class getColumnClass(int c) {
            return getValueAt(0, c).getClass();
        }

        /*
         * Don't need to implement this method unless your table's
         * editable.
         */
        @Override
        public boolean isCellEditable(int row, int col) {
            //Note that the data/cell address is constant,
            //no matter where the cell appears onscreen.
            return col <= 0;
        }

        /*
         * Don't need to implement this method unless your table's
         * data can change.
         */
        @Override
        public void setValueAt(Object value, int row, int col) {
            if (DEBUG) {
                System.out.println("Setting value at " + row + "," + col
                        + " to " + value
                        + " (an instance of "
                        + value.getClass() + ")");
            }

            data[row][col] = value;
            fireTableCellUpdated(row, col);
            generateValor();
            if (DEBUG) {
                System.out.println("New value of data:");
                printDebugData();
            }
        }

        private void printDebugData() {
            int numRows = getRowCount();
            int numCols = getColumnCount();

            for (int i = 0; i < numRows; i++) {
                System.out.print("    row " + i + ":");
                for (int j = 0; j < numCols; j++) {
                    System.out.print("  " + data[i][j]);
                }
                System.out.println();
            }
            System.out.println("--------------------------");
        }

        @SuppressWarnings("empty-statement")
        private void generateValor() {
            int numRows = getRowCount();
            int numCols = getColumnCount();
            valor.clear();
            for (int i = 0; i < numRows; i++) {
                for (int j = 0; j < numCols; j++) {
                    if (j == 1 && data[i][0].toString() == "true") {

                        valor.add(data[i][j].toString());
                    }
                }
            }
        }

    }

    public ArrayList<String> getValor() {
        return this.valor;
    }

}
