package model.pojos;
// Generated 07/24/2014 08:17:34 PM by Hibernate Tools 3.6.0



/**
 * Cuotaxmedico generated by hbm2java
 */
public class Cuotaxmedico  implements java.io.Serializable {


     private CuotaxmedicoId id;
     private Integer cuotapagar;

    public Cuotaxmedico() {
    }

	
    public Cuotaxmedico(CuotaxmedicoId id) {
        this.id = id;
    }
    public Cuotaxmedico(CuotaxmedicoId id, Integer cuotapagar) {
       this.id = id;
       this.cuotapagar = cuotapagar;
    }
   
    public CuotaxmedicoId getId() {
        return this.id;
    }
    
    public void setId(CuotaxmedicoId id) {
        this.id = id;
    }
    public Integer getCuotapagar() {
        return this.cuotapagar;
    }
    
    public void setCuotapagar(Integer cuotapagar) {
        this.cuotapagar = cuotapagar;
    }




}


