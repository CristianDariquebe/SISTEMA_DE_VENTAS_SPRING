/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.egcc.compuventas.prueba;


import pe.egcc.compuventas.model.Empleado;
import pe.egcc.compuventas.model.Producto;
import pe.egcc.compuventas.service.espec.EmpleadoServiceEspec;
import pe.egcc.compuventas.service.espec.ProductoServiceEspec;
import pe.egcc.compuventas.service.impl.EmpleadoServiceImpl;
import pe.egcc.compuventas.service.impl.ProductoServiceImpl;

/**
 *
 * @author Carlos
 */
public class Prueba07 {
    public static void main(String[] args) {
            try {
      // Dato
      int id=9;
      // Proceso
      ProductoServiceEspec service;
    service = new ProductoServiceImpl();
    Producto bean = service.leer(id);
    service = new ProductoServiceImpl();
    service.eliminarnum(bean);
                System.out.println("Producto eliminado correctamente");
    } catch (Exception e) {
      System.err.println(e.getMessage());
    }
    }
    
}
