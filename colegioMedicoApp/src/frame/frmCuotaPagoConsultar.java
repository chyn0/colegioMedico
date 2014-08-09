/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frame;

import colegiomedicoapp.main;
import java.awt.Color;
import java.util.ArrayList;
import javax.swing.DefaultCellEditor;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import static javax.swing.JOptionPane.OK_CANCEL_OPTION;
import static javax.swing.JOptionPane.PLAIN_MESSAGE;
import static javax.swing.JOptionPane.showConfirmDialog;
import javax.swing.UIManager;
import util.CheckBoxRenderer;
import util.CuotaPagoModel;
import util.ProvinciaModel;

/**
 *
 * @author Chyno
 */
public class frmCuotaPagoConsultar extends javax.swing.JFrame {

    Boolean pago = false;
    CuotaPagoModel cpm = new CuotaPagoModel();

    ArrayList<String> valor = new ArrayList<>();

    /**
     * Creates new form frmCuotaConsultar
     */
    public frmCuotaPagoConsultar() {
        initComponents();
            this.setLocationRelativeTo(null);

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        botomPanel = new javax.swing.JPanel();
        checkPagos = new javax.swing.JCheckBox();
        cmbOpcion = new javax.swing.JComboBox();
        txtWhere = new javax.swing.JTextField();
        btnConsultar = new javax.swing.JButton();
        btnPago = new javax.swing.JButton();
        btnCerrar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tabla = new javax.swing.JTable(){
            @Override
            public boolean isCellEditable(int row, int column) {
                return column == 0 ? true : false;
            }}
            ;
            jMenuBar1 = new javax.swing.JMenuBar();
            jMenu1 = new javax.swing.JMenu();
            mnClose = new javax.swing.JMenuItem();

            setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
            addWindowListener(new java.awt.event.WindowAdapter() {
                public void windowOpened(java.awt.event.WindowEvent evt) {
                    formWindowOpened(evt);
                }
            });

            jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

            jLabel2.setText("CUOTAS & PAGOS");
            jPanel1.add(jLabel2);

            botomPanel.setBorder(javax.swing.BorderFactory.createEtchedBorder());

            checkPagos.setText("PAGOS");
            checkPagos.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    checkPagosActionPerformed(evt);
                }
            });
            botomPanel.add(checkPagos);

            cmbOpcion.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "TODO", "ID" }));
            cmbOpcion.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    cmbOpcionActionPerformed(evt);
                }
            });
            botomPanel.add(cmbOpcion);

            txtWhere.setForeground(new java.awt.Color(204, 204, 204));
            txtWhere.setToolTipText("");
            txtWhere.setPreferredSize(new java.awt.Dimension(100, 26));
            txtWhere.addFocusListener(new java.awt.event.FocusAdapter() {
                public void focusGained(java.awt.event.FocusEvent evt) {
                    txtWhereFocusGained(evt);
                }
                public void focusLost(java.awt.event.FocusEvent evt) {
                    txtWhereFocusLost(evt);
                }
            });
            botomPanel.add(txtWhere);

            btnConsultar.setText("CONSULTAR");
            btnConsultar.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    btnConsultarActionPerformed(evt);
                }
            });
            botomPanel.add(btnConsultar);

            btnPago.setText("PAGAR");
            btnPago.setEnabled(false);
            btnPago.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    btnPagoActionPerformed(evt);
                }
            });
            botomPanel.add(btnPago);

            btnCerrar.setText("CERRAR");
            btnCerrar.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    btnCerrarActionPerformed(evt);
                }
            });
            botomPanel.add(btnCerrar);

            tabla.setModel(new javax.swing.table.DefaultTableModel(
                new Object [][] {
                    {null, null, null, null},
                    {null, null, null, null},
                    {null, null, null, null},
                    {null, null, null, null}
                },
                new String [] {
                    "Title 1", "Title 2", "Title 3", "Title 4"
                }
            ));
            jScrollPane1.setViewportView(tabla);

            jMenu1.setText("File");

            mnClose.setText("Close");
            mnClose.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    mnCloseActionPerformed(evt);
                }
            });
            jMenu1.add(mnClose);

            jMenuBar1.add(jMenu1);

            setJMenuBar(jMenuBar1);

            javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
            getContentPane().setLayout(layout);
            layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addContainerGap()
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(jScrollPane1)
                        .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(botomPanel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 742, Short.MAX_VALUE))
                    .addContainerGap())
            );
            layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                    .addComponent(botomPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(48, Short.MAX_VALUE))
            );

            pack();
        }// </editor-fold>//GEN-END:initComponents

    private void mnCloseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnCloseActionPerformed
        this.dispose();
          main m = new main();
        m.setVisible(true);
    }//GEN-LAST:event_mnCloseActionPerformed

    private void cmbOpcionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbOpcionActionPerformed
        if (cmbOpcion.getSelectedIndex() == 0) {
            txtWhere.setEnabled(false);
            txtWhere.setText("");
            valor.clear();
        } else {
            txtWhere.setEnabled(true);
            txtWhere.setText("CONDICION");
            txtWhere.setForeground(Color.gray);
            valor.clear();
        }
    }//GEN-LAST:event_cmbOpcionActionPerformed

    private void txtWhereFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtWhereFocusGained
        if ("CONDICION".equals(txtWhere.getText())) {
            txtWhere.setText("");
            txtWhere.setForeground(Color.black);

        }
    }//GEN-LAST:event_txtWhereFocusGained

    private void txtWhereFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtWhereFocusLost
        if ("".equals(txtWhere.getText())) {
            txtWhere.setForeground(Color.gray);
            txtWhere.setText("CONDICION");
        }
    }//GEN-LAST:event_txtWhereFocusLost

    private void btnConsultarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnConsultarActionPerformed
        valor.clear();

        if (cmbOpcion.getSelectedIndex() == 0) {
            cpm.getAllCuotaPago(pago);
            tabla.setModel(cpm.getTableModel());
        } else if (!"CONDICION".equals(txtWhere.getText()) && (cmbOpcion.getSelectedIndex() == 1 || cmbOpcion.getSelectedIndex() == 2)) {
            cpm.getCuotaPagoById(txtWhere.getText(), pago);
            tabla.setModel(cpm.getTableModel());

        } else {
            JOptionPane.showMessageDialog(new JFrame(), "REVISE LA CONDICION!", "ERROR!", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnConsultarActionPerformed

    private void btnPagoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPagoActionPerformed
        FormularioPago panel = new FormularioPago();
        
       valor = cpm.getValor();
      
        if (valor.isEmpty() ) {
            JOptionPane.showMessageDialog(new JFrame(), "ELIJA UN REGISTRO!", "ERROR", JOptionPane.ERROR_MESSAGE);
        } else {
            panel.setValorCombo(valor);
            panel.createFactura();
            int result = showConfirmDialog(null, panel, "MODIFICAR",
                    OK_CANCEL_OPTION, PLAIN_MESSAGE);
            if (result == JOptionPane.OK_OPTION) {
//                cpm.setUpdateMedico(
//                        panel.getTextId(), panel.getTextNombre(), panel.getTextDirrecion(), panel.getTextTelefono(), panel.getTextProvincia(), panel.getTextEstatus(), panel.getTextCuota());
//                btnConsultar.doClick();
            }
        }
    }//GEN-LAST:event_btnPagoActionPerformed

    private void btnCerrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCerrarActionPerformed
        this.dispose();
    }//GEN-LAST:event_btnCerrarActionPerformed

    private void checkPagosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_checkPagosActionPerformed
        if (checkPagos.isSelected()) {
            pago = true;
        } else {
            pago = false;
        }
        cmbOpcion.setSelectedIndex(0);
        btnConsultar.doClick();

    }//GEN-LAST:event_checkPagosActionPerformed

    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        cmbOpcion.setSelectedIndex(0);
        btnConsultar.doClick();
    }//GEN-LAST:event_formWindowOpened

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
//        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("GTK".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(frmCuotaPagoConsultar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(frmCuotaPagoConsultar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(frmCuotaPagoConsultar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(frmCuotaPagoConsultar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                new frmCuotaPagoConsultar().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel botomPanel;
    private javax.swing.JButton btnCerrar;
    private javax.swing.JButton btnConsultar;
    private javax.swing.JButton btnPago;
    private javax.swing.JCheckBox checkPagos;
    private javax.swing.JComboBox cmbOpcion;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JMenuItem mnClose;
    private javax.swing.JTable tabla;
    private javax.swing.JTextField txtWhere;
    // End of variables declaration//GEN-END:variables
}
