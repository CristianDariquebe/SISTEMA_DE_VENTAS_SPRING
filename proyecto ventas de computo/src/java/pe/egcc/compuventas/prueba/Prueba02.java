package pe.egcc.compuventas.prueba;

import pe.egcc.compuventas.model.Empleado;
import pe.egcc.compuventas.model.Promocion;
import pe.egcc.compuventas.service.espec.EmpleadoServiceEspec;
import pe.egcc.compuventas.service.espec.PromocionServiceEspec;
import pe.egcc.compuventas.service.impl.EmpleadoServiceImpl;
import pe.egcc.compuventas.service.impl.PromocionServiceImpl;


public class Prueba02 {
  
  public static void main(String[] args) {
    try {
      // Dato
      int id = 1;
      // Proceso
      PromocionServiceEspec service;
      service = new PromocionServiceImpl();
      Promocion bean = service.leer(id);
      System.out.println(bean.getFecinicio()
              + " | " + bean.getFecfin());
    } catch (Exception e) {
      System.err.println(e.getMessage());
    }
    
  }
}
