package d.model.pojos;
// Generated 07/20/2014 08:41:46 PM by Hibernate Tools 3.6.0



/**
 * Provincia generated by hbm2java
 */
public class Provincia  implements java.io.Serializable {


     private int idprovincia;
     private String nombre;

    public Provincia() {
    }

	
    public Provincia(int idprovincia) {
        this.idprovincia = idprovincia;
    }
    public Provincia(int idprovincia, String nombre) {
       this.idprovincia = idprovincia;
       this.nombre = nombre;
    }
   
    public int getIdprovincia() {
        return this.idprovincia;
    }
    
    public void setIdprovincia(int idprovincia) {
        this.idprovincia = idprovincia;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }




}


