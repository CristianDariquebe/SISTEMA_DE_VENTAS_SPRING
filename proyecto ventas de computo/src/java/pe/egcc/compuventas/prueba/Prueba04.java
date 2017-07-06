package pe.egcc.compuventas.prueba;

import java.util.List;
import pe.egcc.compuventas.model.Empleado;
import pe.egcc.compuventas.model.Producto;
import pe.egcc.compuventas.model.Promocion;
import pe.egcc.compuventas.service.espec.EmpleadoServiceEspec;
import pe.egcc.compuventas.service.espec.ProductoServiceEspec;
import pe.egcc.compuventas.service.espec.PromocionServiceEspec;
import pe.egcc.compuventas.service.impl.EmpleadoServiceImpl;
import pe.egcc.compuventas.service.impl.ProductoServiceImpl;
import pe.egcc.compuventas.service.impl.PromocionServiceImpl;


public class Prueba04 {
 
  public static void main(String[] args) {
    try {
      // Datos
        Producto bean = new Producto();

      bean.setNombre("");
       // Proceso
      ProductoServiceEspec service;
      service = new ProductoServiceImpl();
      List<Producto> lista = service.leer(bean);
      // Reporte
      for (Producto o : lista) {
        System.out.println(o.getIdprod()+ " | " 
                + o.getNombre()+ " | " + o.getIdcat());
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
